<?php

namespace App\Controller\Api;

use App\Entity\Restaurant;
use App\Repository\RestaurantRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Component\Serializer\Normalizer\AbstractNormalizer;
use Symfony\Component\Serializer\SerializerInterface;
use OpenApi\Attributes as OA;


#[Route('/api/restaurant', name: 'app_api_restaurant_')]
final class RestaurantApiController extends AbstractController
{
    public function __construct(
        private EntityManagerInterface $manager,
        private RestaurantRepository $repo,
        private SerializerInterface $serializer,
        )
    {
    }

    #[Route(methods: ['POST'])]
    #[OA\Post(
        path: '/api/restaurant',
        summary: "Créer un restaurant",
        requestBody: new OA\RequestBody(
            required: true,
            description: "Données du restaurant à créer",
            content: new OA\JsonContent(
                type: 'object',
                required: ['name', 'maxGuest', 'amOpeningTime', 'pmOpeningTime'],
                properties: [
                    new OA\Property(property: 'name', type: 'string', example: 'Nom du restaurant'),
                    new OA\Property(property: 'description', type: 'string', nullable: true, example: 'Description du restaurant'),
                    new OA\Property(property: 'maxGuest', type: 'integer', example: 80),
                    new OA\Property(
                        property: 'amOpeningTime',
                        type: 'array',
                        items: new OA\Items(type: 'string', example: '11:30'),
                        example: ['11:30', '12:00', '12:30']
                    ),
                    new OA\Property(
                        property: 'pmOpeningTime',
                        type: 'array',
                        items: new OA\Items(type: 'string', example: '19:00'),
                        example: ['19:00', '19:30', '20:00']
                    ),
                ]
            )
        ),
        responses: [
            new OA\Response(
                response: 201,
                description: "Restaurant créé avec succès",
                content: new OA\JsonContent(
                    type: 'object',
                    properties: [
                        new OA\Property(property: 'id', type: 'integer', example: 1),
                        new OA\Property(property: 'uuid', type: 'string', example: 'b3b1b6c0-0f0a-4f6a-9e57-2a2ccf2b6a2a'),
                        new OA\Property(property: 'message', type: 'string', example: 'Restaurant créé'),
                    ]
                )
            ),
            new OA\Response(response: 401, description: "Non authentifié"),
        ]
    )]
    public function new(
        Request $request
    ): Response
    {
        $user = $this->getUser();
        if (!$user) {
            return $this->json(['error' => 'Non authentifié'], Response::HTTP_UNAUTHORIZED);
        }
        $restaurant = $this->serializer->deserialize(
            $request->getContent(),
            Restaurant::class,
            'json'
        );

        $restaurant->setCreatedAt(new \DateTimeImmutable());
        $restaurant->setOwner($this->getUser());

        $this->manager->persist($restaurant);
        $this->manager->flush();

        return $this->json([
            'id' => $restaurant->getId(),
            'uuid' => (string) $restaurant->getUuid(),
            'message' => 'Restaurant créé'
        ], Response::HTTP_CREATED);
    }




    #[Route('/{id}', name: 'show', methods: ['GET'])]
    #[OA\Get(
        path: '/api/restaurant/{id}',
        summary: 'Afficher un restaurant par son ID',
        parameters: [
            new OA\Parameter(
                name: 'id',
                description: 'Identifiant du restaurant',
                in: 'path',
                required: true,
                schema: new OA\Schema(type: 'integer', example: 1)
            )
        ],
        responses: [
            new OA\Response(
                response: 200,
                description: 'Restaurant trouvé avec succès',
                content: new OA\JsonContent(
                    type: 'object',
                    properties: [
                        new OA\Property(property: 'id', type: 'integer', example: 1),
                        new OA\Property(property: 'uuid', type: 'string', format: 'uuid', example: 'b3b1b6c0-0f0a-4f6a-9e57-2a2ccf2b6a2a'),
                        new OA\Property(property: 'name', type: 'string', example: 'Le Quai Antique'),
                        new OA\Property(property: 'description', type: 'string', example: 'Restaurant savoyard'),
                        new OA\Property(
                            property: 'amOpeningTime',
                            type: 'array',
                            items: new OA\Items(type: 'string', example: '11:30')
                        ),
                        new OA\Property(
                            property: 'pmOpeningTime',
                            type: 'array',
                            items: new OA\Items(type: 'string', example: '19:00')
                        ),
                        new OA\Property(property: 'maxGuest', type: 'integer', example: 80),
                        new OA\Property(property: 'createdAt', type: 'string', format: 'date-time', example: '2026-02-13T12:34:56+01:00'),
                        new OA\Property(property: 'updatedAt', type: 'string', format: 'date-time', nullable: true),
                    ]
                )
            ),
            new OA\Response(
                response: 404,
                description: 'Restaurant non trouvé'
            )
        ]
    )]
    public function show(int $id): Response
    {
        $restaurant = $this->repo->findOneBy(['id' => $id]);
        if ($restaurant) {
            $responseData = $this->serializer->serialize(
                $restaurant,
                'json',
                ['groups' => 'restaurant:read']
                );
            return new JsonResponse(
                $responseData,
                Response::HTTP_OK,
                [],
                true
            );
        }
        return new JsonResponse(null, Response::HTTP_NOT_FOUND);
    }



    #[Route('/{id}', name: 'edit', methods: ['PUT'])]
    #[OA\Put(
        path: '/api/restaurant/{id}',
        summary: 'Modifier un restaurant',
        parameters: [
            new OA\Parameter(
                name: 'id',
                in: 'path',
                required: true,
                description: 'Identifiant du restaurant à modifier',
                schema: new OA\Schema(type: 'integer', example: 1)
            )
        ],
        requestBody: new OA\RequestBody(
            required: true,
            description: 'Données du restaurant à mettre à jour',
            content: new OA\JsonContent(
                type: 'object',
                properties: [
                    new OA\Property(property: 'name', type: 'string', example: 'Nouveau nom'),
                    new OA\Property(property: 'description', type: 'string', example: 'Nouvelle description'),
                    new OA\Property(property: 'maxGuest', type: 'integer', example: 100),
                    new OA\Property(
                        property: 'amOpeningTime',
                        type: 'array',
                        items: new OA\Items(type: 'string', example: '11:30')
                    ),
                    new OA\Property(
                        property: 'pmOpeningTime',
                        type: 'array',
                        items: new OA\Items(type: 'string', example: '19:00')
                    ),
                ]
            )
        ),
        responses: [
            new OA\Response(
                response: 204,
                description: 'Restaurant modifié avec succès'
            ),
            new OA\Response(
                response: 404,
                description: 'Restaurant non trouvé'
            ),
            new OA\Response(
                response: 401,
                description: 'Non authentifié'
            )
        ]
    )]
    public function edit(int $id, Request $request): Response
    {
        $restaurant = $this->repo->findOneBy(['id' => $id]);
        if ($restaurant) {
        $restaurant = $this->serializer->deserialize(
                $request->getContent(),
                Restaurant::class,
                'json',
                [AbstractNormalizer::OBJECT_TO_POPULATE => $restaurant]
            );
            $restaurant->setUpdatedAt(new \DateTimeImmutable());

            $this->manager->flush();
            return new JsonResponse(null, Response::HTTP_NO_CONTENT);
        }
        return new JsonResponse(null, Response::HTTP_NOT_FOUND);
    }





    #[Route('/{id}', name: 'delete', methods: ['DELETE'])]
    #[OA\Delete(
        path: '/api/restaurant/{id}',
        summary: 'Supprimer un restaurant par son ID',
        parameters: [
            new OA\Parameter(
                name: 'id',
                description: 'Identifiant du restaurant à supprimer',
                in: 'path',
                required: true,
                schema: new OA\Schema(type: 'integer', example: 1)
            )
        ],
        responses: [
            new OA\Response(
                response: 204,
                description: 'Restaurant supprimé (aucun contenu retourné)'
            ),
            new OA\Response(
                response: 404,
                description: 'Restaurant non trouvé'
            ),
            new OA\Response(
                response: 401,
                description: 'Non authentifié'
            )
        ]
    )]
    public function delete(int $id): Response
    {
        $restaurant = $this->repo->findOneBy(['id' => $id]);
        if ($restaurant) {
            $this->manager->remove($restaurant);
            $this->manager->flush();
            return new JsonResponse(null, Response::HTTP_NO_CONTENT);
        }
        return new JsonResponse(null, Response::HTTP_NOT_FOUND);
    }

}
