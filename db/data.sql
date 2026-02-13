-- =========================================================
-- Jeu d'essai - Février 2026 uniquement
-- =========================================================

SET FOREIGN_KEY_CHECKS = 0;

-- (Optionnel) Purge dans l'ordre
DELETE FROM booking;
DELETE FROM picture;
DELETE FROM menu_category;
DELETE FROM food_category;
DELETE FROM menu;
DELETE FROM food;
DELETE FROM category;
DELETE FROM restaurant;
DELETE FROM user;

SET FOREIGN_KEY_CHECKS = 1;

-- =========================================================
-- USERS
-- =========================================================
-- password hash (bcrypt) souvent utilisé en démo : "password"
-- $2y$13$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi

INSERT INTO user (id, email, roles, password, uuid, first_name, last_name, guest_number, allergy, created_at, updated_at, api_token) VALUES
(1, 'admin@quai-antique.test', '["ROLE_ADMIN"]',
 '$2y$13$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',
 '0d2b6c424a534c1e9b7d5b2d4c9e3a11',
 'Camille', 'Admin', NULL, NULL,
 '2026-02-01 09:10:00', '2026-02-10 14:22:00',
 'a1b2c3d4e5f60718293a4b5c6d7e8f9012345678'
),
(2, 'owner@quai-antique.test', '["ROLE_OWNER"]',
 '$2y$13$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',
 '6fbb1a2e7b2c4a71a8a33a5f3e8d9a21',
 'Isabelle', 'Beauregard', NULL, NULL,
 '2026-02-01 10:05:00', '2026-02-12 11:30:00',
 'b7c0f1a2d3e4f5061728394a5b6c7d8e9f001122'
),
(3, 'owner@bistro.test', '["ROLE_OWNER"]',
 '$2y$13$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',
 'a9c6c8a52d334a1a8a9f2c8f0c6a1122',
 'Thomas', 'Roux', NULL, NULL,
 '2026-02-02 08:40:00', '2026-02-11 16:05:00',
 'c0ffee1234deadbeef567890abcdef1234567890'
),
(10, 'lea.client@test.io', '["ROLE_USER"]',
 '$2y$13$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',
 '1a6a0f937f6e4a2dbb1e6e1d2a7c0f10',
 'Léa', 'Martin', 2, 'Arachides',
 '2026-02-03 12:12:00', '2026-02-09 10:00:00',
 '10aa22bb33cc44dd55ee66ff77889900aabbccdd'
),
(11, 'nicolas.client@test.io', '["ROLE_USER"]',
 '$2y$13$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',
 'f7c6a9102f4b4a0c9d122f4c8a9b7c61',
 'Nicolas', 'Bernard', 4, NULL,
 '2026-02-04 09:05:00', '2026-02-12 18:20:00',
 '11aa22bb33cc44dd55ee66ff77889900aabbccde'
),
(12, 'sarah.client@test.io', '["ROLE_USER"]',
 '$2y$13$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',
 '2d4c9e311b2a4c3d9e8f1a2b3c4d5e6f',
 'Sarah', 'Diallo', 3, 'Gluten',
 '2026-02-05 14:30:00', '2026-02-08 09:10:00',
 '22aa22bb33cc44dd55ee66ff77889900aabbccdf'
),
(13, 'julien.client@test.io', '["ROLE_USER"]',
 '$2y$13$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',
 '9b7d5a11cc224bb188aa112233445566',
 'Julien', 'Moreau', 2, 'Lactose',
 '2026-02-06 18:45:00', '2026-02-12 08:55:00',
 '33aa22bb33cc44dd55ee66ff77889900aabbccaa'
);

-- =========================================================
-- RESTAURANTS
-- =========================================================
-- amOpeningTime / pmOpeningTime => sérialisation PHP (Doctrine ARRAY)
-- Exemple : a:3:{i:0;s:5:"12:00";i:1;s:5:"12:30";i:2;s:5:"13:00";}

INSERT INTO restaurant (id, uuid, name, description, am_opening_time, pm_opening_time, max_guest, created_at, updated_at, owner_id) VALUES
(1, '2c1d3f10-6a7b-4f9a-8c1d-3f106a7b4f9a',
 'Quai Antique',
 'Cuisine française de saison, produits locaux, ambiance chaleureuse et service soigné.',
 'a:4:{i:0;s:5:"12:00";i:1;s:5:"12:30";i:2;s:5:"13:00";i:3;s:5:"13:30";}',
 'a:5:{i:0;s:5:"19:00";i:1;s:5:"19:30";i:2;s:5:"20:00";i:3;s:5:"20:30";i:4;s:5:"21:00";}',
 40,
 '2026-02-01 11:00:00', '2026-02-12 11:30:00',
 2
),
(2, '7f3a2b11-1c2d-4e3f-9a8b-7f3a2b111c2d',
 'Bistro du Canal',
 'Bistrot moderne : plats du jour, carte courte, vins nature, desserts maison.',
 'a:3:{i:0;s:5:"12:00";i:1;s:5:"12:45";i:2;s:5:"13:30";}',
 'a:4:{i:0;s:5:"19:15";i:1;s:5:"20:00";i:2;s:5:"20:45";i:3;s:5:"21:30";}',
 28,
 '2026-02-02 09:15:00', '2026-02-11 16:05:00',
 3
);

-- =========================================================
-- PICTURES
-- =========================================================
INSERT INTO picture (id, title, slug, created_at, updated_at, restaurant_id) VALUES
(1, 'Salle principale', 'salle-principale', '2026-02-03 10:00:00', '2026-02-10 12:00:00', 1),
(2, 'Plat signature', 'plat-signature', '2026-02-03 10:05:00', NULL, 1),
(3, 'Terrasse au bord du canal', 'terrasse-canal', '2026-02-04 09:40:00', NULL, 2),
(4, 'Dessert du jour', 'dessert-jour', '2026-02-04 09:55:00', '2026-02-12 10:15:00', 2);

-- =========================================================
-- CATEGORIES
-- =========================================================
INSERT INTO category (id, uuid, title, created_at, updated_at) VALUES
(1, 'c1b0a111-2222-4333-8444-555566667777', 'Entrées',  '2026-02-01 12:00:00', '2026-02-10 09:00:00'),
(2, 'c1b0a112-2222-4333-8444-555566667777', 'Plats',    '2026-02-01 12:00:00', '2026-02-10 09:00:00'),
(3, 'c1b0a113-2222-4333-8444-555566667777', 'Desserts', '2026-02-01 12:00:00', NULL),
(4, 'c1b0a114-2222-4333-8444-555566667777', 'Boissons', '2026-02-01 12:00:00', NULL),
(5, 'c1b0a115-2222-4333-8444-555566667777', 'Végétarien','2026-02-02 10:20:00', '2026-02-12 09:45:00');

-- =========================================================
-- FOODS
-- price = SMALLINT (ex: en centimes ou en euros selon ton app)
-- Ici je mets des prix "type euros" (ex: 12 = 12€). Ajuste si besoin.
-- =========================================================
INSERT INTO food (id, uuid, title, description, price, created_at, updated_at) VALUES
(1, 'f00d0001-aaaa-4bbb-8ccc-000000000001', 'Oeuf parfait', 'Oeuf parfait, crème de champignons, noisettes torréfiées.', 12, '2026-02-01 12:30:00', '2026-02-09 11:10:00'),
(2, 'f00d0002-aaaa-4bbb-8ccc-000000000002', 'Velouté de potimarron', 'Velouté de potimarron, huile de noisette, croûtons.', 9, '2026-02-01 12:30:00', NULL),
(3, 'f00d0003-aaaa-4bbb-8ccc-000000000003', 'Boeuf mijoté', 'Boeuf mijoté longuement, purée maison, jus réduit.', 22, '2026-02-01 12:35:00', '2026-02-12 10:00:00'),
(4, 'f00d0004-aaaa-4bbb-8ccc-000000000004', 'Cabillaud rôti', 'Cabillaud rôti, légumes de saison, sauce citron.', 24, '2026-02-01 12:35:00', NULL),
(5, 'f00d0005-aaaa-4bbb-8ccc-000000000005', 'Risotto aux champignons', 'Risotto crémeux, champignons, parmesan (option sans lactose sur demande).', 19, '2026-02-02 11:00:00', '2026-02-11 09:30:00'),
(6, 'f00d0006-aaaa-4bbb-8ccc-000000000006', 'Tarte fine aux pommes', 'Tarte fine, caramel léger, boule vanille.', 10, '2026-02-01 12:40:00', NULL),
(7, 'f00d0007-aaaa-4bbb-8ccc-000000000007', 'Moelleux chocolat', 'Moelleux chocolat cœur coulant, crème anglaise.', 11, '2026-02-01 12:40:00', '2026-02-08 15:20:00'),
(8, 'f00d0008-aaaa-4bbb-8ccc-000000000008', 'Eau pétillante', 'Bouteille 50cl.', 4, '2026-02-01 12:45:00', NULL),
(9, 'f00d0009-aaaa-4bbb-8ccc-000000000009', 'Verre de vin rouge', 'Sélection du moment (12cl).', 6, '2026-02-01 12:45:00', NULL);

-- =========================================================
-- FOOD <-> CATEGORY (ManyToMany) : table de jointure
-- supposée : food_category(food_id, category_id)
-- =========================================================
INSERT INTO food_category (food_id, category_id) VALUES
(1, 1),                 -- Oeuf parfait -> Entrées
(2, 1), (2, 5),         -- Velouté -> Entrées + Végétarien
(3, 2),                 -- Boeuf -> Plats
(4, 2),                 -- Cabillaud -> Plats
(5, 2), (5, 5),         -- Risotto -> Plats + Végétarien
(6, 3),                 -- Tarte -> Desserts
(7, 3),                 -- Moelleux -> Desserts
(8, 4),                 -- Eau -> Boissons
(9, 4);                 -- Vin -> Boissons

-- =========================================================
-- MENUS
-- =========================================================
INSERT INTO menu (id, uuid, title, description, price, created_at, updated_at, restaurant_id) VALUES
(1, 'm3nu0001-bbbb-4ccc-8ddd-000000000001', 'Menu Déjeuner', 'Entrée + Plat ou Plat + Dessert (hors boissons).', 29, '2026-02-02 12:00:00', '2026-02-12 11:00:00', 1),
(2, 'm3nu0002-bbbb-4ccc-8ddd-000000000002', 'Menu Dégustation', 'Entrée + Plat + Dessert, suggestions du chef.', 39, '2026-02-03 09:30:00', NULL, 1),
(3, 'm3nu0003-bbbb-4ccc-8ddd-000000000003', 'Formule Bistrot', 'Plat du jour + Dessert du jour.', 22, '2026-02-04 10:10:00', '2026-02-10 17:20:00', 2);

-- =========================================================
-- MENU <-> CATEGORY (ManyToMany) : table de jointure
-- supposée : menu_category(menu_id, category_id)
-- =========================================================
INSERT INTO menu_category (menu_id, category_id) VALUES
(1, 1), (1, 2), (1, 3),       -- Menu Déjeuner : Entrées/Plats/Desserts
(2, 1), (2, 2), (2, 3),       -- Menu Dégustation : Entrées/Plats/Desserts
(3, 2), (3, 3);               -- Formule Bistrot : Plats/Desserts

-- =========================================================
-- BOOKINGS
-- orderDate (DATE), orderHour (TIME)
-- createdAt/updatedAt (DATETIME)
-- =========================================================
INSERT INTO booking (id, uuid, guest_number, order_date, order_hour, allergy, created_at, updated_at, restaurant_id, client_id) VALUES
(1, 'b00k0001-1111-4aaa-8bbb-000000000001', 2, '2026-02-07', '19:30:00', 'Arachides (trace possible)', '2026-02-05 18:10:00', '2026-02-06 09:00:00', 1, 10),
(2, 'b00k0002-1111-4aaa-8bbb-000000000002', 4, '2026-02-08', '20:00:00', NULL, '2026-02-06 12:00:00', '2026-02-06 12:00:00', 1, 11),
(3, 'b00k0003-1111-4aaa-8bbb-000000000003', 3, '2026-02-10', '12:45:00', 'Sans gluten', '2026-02-08 09:30:00', '2026-02-09 10:15:00', 1, 12),
(4, 'b00k0004-1111-4aaa-8bbb-000000000004', 2, '2026-02-12', '19:15:00', 'Lactose', '2026-02-10 20:05:00', '2026-02-11 08:00:00', 2, 13),
(5, 'b00k0005-1111-4aaa-8bbb-000000000005', 2, '2026-02-14', '21:00:00', NULL, '2026-02-12 11:40:00', '2026-02-12 11:40:00', 2, 10),
(6, 'b00k0006-1111-4aaa-8bbb-000000000006', 4, '2026-02-20', '20:45:00', 'Gluten + lactose', '2026-02-18 13:25:00', '2026-02-19 09:05:00', 1, 12);

-- Fin
