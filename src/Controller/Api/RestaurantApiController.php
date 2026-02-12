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
use Symfony\Component\Routing\Generator\UrlGeneratorInterface;
use Symfony\Component\Serializer\Normalizer\AbstractNormalizer;
use Symfony\Component\Serializer\SerializerInterface;
use Symfony\Component\Uid\Uuid;


#[Route('/api/restaurant', name: 'app_api_restaurant_')]
final class RestaurantApiController extends AbstractController
{
    public function __construct(
        private EntityManagerInterface $manager,
        private RestaurantRepository $repo,
        private SerializerInterface $serializer,
        private UrlGeneratorInterface $urlGenerator
        )
    {
    }


    #[Route(methods: ['POST'])]
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
