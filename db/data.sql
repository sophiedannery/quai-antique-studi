SET @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS;
SET FOREIGN_KEY_CHECKS = 0;

TRUNCATE TABLE reservation;
TRUNCATE TABLE review;
TRUNCATE TABLE suspension;
TRUNCATE TABLE session;
TRUNCATE TABLE room;
TRUNCATE TABLE class_type;
TRUNCATE TABLE user;

SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS;

SET NAMES utf8mb4;
SET time_zone = '+00:00';

START TRANSACTION;

-- ---------- USERS ----------
INSERT INTO user (email, roles, password, first_name, last_name, avatar_url, is_active, bio, specialties, created_at, updated_at)
VALUES
  ('admin@namaste.com',  JSON_ARRAY('ROLE_ADMIN'),  '$2y$13$06JScrgLVpYLL3UxjKPja.9wW1rcHxFcxMbAVT.6Ysp5i34Lv5bdG', 'Aline',  'Admin',   NULL, 1, NULL, NULL, '2025-10-01 09:00:00', '2025-10-01 09:00:00'),
  ('maddie@mail.com',     JSON_ARRAY('ROLE_USER'),   '$2y$13$06JScrgLVpYLL3UxjKPja.9wW1rcHxFcxMbAVT.6Ysp5i34Lv5bdG', 'Maddie','Luna',   NULL, 1, NULL, NULL, '2025-10-01 09:10:00', '2025-10-01 09:10:00'),
  ('sophie@namaste.com',  JSON_ARRAY('ROLE_TEACHER','ROLE_USER'), '$2y$13$06JScrgLVpYLL3UxjKPja.9wW1rcHxFcxMbAVT.6Ysp5i34Lv5bdG', 'Sophie','Durand', NULL, 1, 'Enseigne Vinyasa & Yin.', 'Vinyasa,Yin', '2025-10-01 09:20:00', '2025-10-01 09:20:00'),
  ('lucas@namaste.com',   JSON_ARRAY('ROLE_TEACHER','ROLE_USER'), '$2y$13$06JScrgLVpYLL3UxjKPja.9wW1rcHxFcxMbAVT.6Ysp5i34Lv5bdG', 'Lucas', 'Bernard', NULL, 1, 'Spécialiste Hatha.', 'Hatha', '2025-10-01 09:25:00', '2025-10-01 09:25:00'),
  ('emma@mail.com',       JSON_ARRAY('ROLE_USER'),   '$2y$13$06JScrgLVpYLL3UxjKPja.9wW1rcHxFcxMbAVT.6Ysp5i34Lv5bdG', 'Emma',  'Leroy',  NULL, 1, NULL, NULL, '2025-10-01 09:30:00', '2025-10-01 09:30:00'),
  ('martin@mail.com',     JSON_ARRAY('ROLE_USER'),   '$2y$13$06JScrgLVpYLL3UxjKPja.9wW1rcHxFcxMbAVT.6Ysp5i34Lv5bdG', 'Martin','Morel',  NULL, 1, NULL, NULL, '2025-10-01 09:35:00', '2025-10-01 09:35:00'),
  ('laura@namaste.com',   JSON_ARRAY('ROLE_TEACHER','ROLE_USER'), '$2y$13$06JScrgLVpYLL3UxjKPja.9wW1rcHxFcxMbAVT.6Ysp5i34Lv5bdG', 'Laura', 'Martin', NULL, 1, 'Hatha & Prénatal.', 'Hatha,Prénatal', '2025-10-01 09:26:00', '2025-10-01 09:26:00'),
  ('ines@namaste.com',    JSON_ARRAY('ROLE_TEACHER','ROLE_USER'), '$2y$13$06JScrgLVpYLL3UxjKPja.9wW1rcHxFcxMbAVT.6Ysp5i34Lv5bdG', 'Inès',  'Petit',  NULL, 1, 'Yin & Méditation.', 'Yin,Méditation', '2025-10-01 09:27:00', '2025-10-01 09:27:00'),
  ('tom@namaste.com',     JSON_ARRAY('ROLE_TEACHER','ROLE_USER'), '$2y$13$06JScrgLVpYLL3UxjKPja.9wW1rcHxFcxMbAVT.6Ysp5i34Lv5bdG', 'Tom',   'Roux',   NULL, 1, 'Vinyasa dynamique.', 'Vinyasa', '2025-10-01 09:28:00', '2025-10-01 09:28:00'),
  ('alice@mail.com',   JSON_ARRAY('ROLE_USER'), '$2y$13$06JScrgLVpYLL3UxjKPja.9wW1rcHxFcxMbAVT.6Ysp5i34Lv5bdG', 'Alice',   'Dupont',  NULL, 1, NULL, NULL, '2025-10-02 09:00:00', '2025-10-02 09:00:00'),
  ('julien@mail.com',  JSON_ARRAY('ROLE_USER'), '$2y$13$06JScrgLVpYLL3UxjKPja.9wW1rcHxFcxMbAVT.6Ysp5i34Lv5bdG', 'Julien',  'Moreau',  NULL, 1, NULL, NULL, '2025-10-02 09:05:00', '2025-10-02 09:05:00'),
  ('clara@mail.com',   JSON_ARRAY('ROLE_USER'), '$2y$13$06JScrgLVpYLL3UxjKPja.9wW1rcHxFcxMbAVT.6Ysp5i34Lv5bdG', 'Clara',   'Lefevre', NULL, 1, NULL, NULL, '2025-10-02 09:10:00', '2025-10-02 09:10:00'),
  ('nicolas@mail.com', JSON_ARRAY('ROLE_USER'), '$2y$13$06JScrgLVpYLL3UxjKPja.9wW1rcHxFcxMbAVT.6Ysp5i34Lv5bdG', 'Nicolas', 'Girard',  NULL, 1, NULL, NULL, '2025-10-02 09:15:00', '2025-10-02 09:15:00'),
  ('lea@mail.com',     JSON_ARRAY('ROLE_USER'), '$2y$13$06JScrgLVpYLL3UxjKPja.9wW1rcHxFcxMbAVT.6Ysp5i34Lv5bdG', 'Léa',     'Fontaine',NULL, 1, NULL, NULL, '2025-10-02 09:20:00', '2025-10-02 09:20:00'),
  ('paul@mail.com',    JSON_ARRAY('ROLE_USER'), '$2y$13$06JScrgLVpYLL3UxjKPja.9wW1rcHxFcxMbAVT.6Ysp5i34Lv5bdG', 'Paul',    'Renaud',  NULL, 1, NULL, NULL, '2025-10-02 09:25:00', '2025-10-02 09:25:00'),
  ('sarah@mail.com',   JSON_ARRAY('ROLE_USER'), '$2y$13$06JScrgLVpYLL3UxjKPja.9wW1rcHxFcxMbAVT.6Ysp5i34Lv5bdG', 'Sarah',   'Marchand',NULL, 1, NULL, NULL, '2025-10-02 09:30:00', '2025-10-02 09:30:00'),
  ('kevin@mail.com',   JSON_ARRAY('ROLE_USER'), '$2y$13$06JScrgLVpYLL3UxjKPja.9wW1rcHxFcxMbAVT.6Ysp5i34Lv5bdG', 'Kevin',   'Blanc',   NULL, 1, NULL, NULL, '2025-10-02 09:35:00', '2025-10-02 09:35:00'),
  ('manon@mail.com',   JSON_ARRAY('ROLE_USER'), '$2y$13$06JScrgLVpYLL3UxjKPja.9wW1rcHxFcxMbAVT.6Ysp5i34Lv5bdG', 'Manon',   'Gauthier',NULL, 1, NULL, NULL, '2025-10-02 09:40:00', '2025-10-02 09:40:00'),
  ('thomas@mail.com',  JSON_ARRAY('ROLE_USER'), '$2y$13$06JScrgLVpYLL3UxjKPja.9wW1rcHxFcxMbAVT.6Ysp5i34Lv5bdG', 'Thomas',  'Perrin',  NULL, 1, NULL, NULL, '2025-10-02 09:45:00', '2025-10-02 09:45:00'),
  ('camille@mail.com', JSON_ARRAY('ROLE_USER'), '$2y$13$06JScrgLVpYLL3UxjKPja.9wW1rcHxFcxMbAVT.6Ysp5i34Lv5bdG', 'Camille', 'Chevalier',NULL,1, NULL, NULL, '2025-10-02 09:50:00', '2025-10-02 09:50:00'),
  ('antoine@mail.com', JSON_ARRAY('ROLE_USER'), '$2y$13$06JScrgLVpYLL3UxjKPja.9wW1rcHxFcxMbAVT.6Ysp5i34Lv5bdG', 'Antoine', 'Boyer',   NULL, 1, NULL, NULL, '2025-10-02 09:55:00', '2025-10-02 09:55:00');


-- ---------- CLASS TYPES ----------
INSERT INTO class_type (title, style, level, description, created_at, updated_at)
VALUES
  ('Hatha Découverte',  'Hatha',   'Débutant',      'Bases, respiration, postures clés.',        '2025-10-01 10:00:00', '2025-10-01 10:00:00'),
  ('Vinyasa Flow',      'Vinyasa', 'Intermédiaire', 'Séquences dynamiques en musique.',          '2025-10-01 10:05:00', '2025-10-01 10:05:00'),
  ('Yin Relax',         'Yin',     'Tous niveaux',  'Étirements tenus longtemps, relaxation.',   '2025-10-01 10:10:00', '2025-10-01 10:10:00'),
  ('Prénatal Doux',     'Prénatal',  'Débutant',     'Mobilité, respiration, détente.',         '2025-10-01 10:11:00', '2025-10-01 10:11:00'),
  ('Power Vinyasa',     'Vinyasa',   'Avancé',       'Flow intense, renforcement.',            '2025-10-01 10:12:00', '2025-10-01 10:12:00'),
  ('Méditation Guidée', 'Méditation','Tous niveaux', 'Méditation + pranayama.',                '2025-10-01 10:13:00', '2025-10-01 10:13:00'),
  ('Yoga Nidra',        'Nidra',     'Tous niveaux', 'Relaxation profonde, scan corporel.',   '2025-10-01 10:14:00', '2025-10-01 10:14:00');


-- ---------- ROOMS ----------
INSERT INTO room (name_room, note_room, created_at, updated_at)
VALUES
  ('Lotus',      'Salle lumineuse, 15 tapis.',                         '2025-10-01 10:15:00', '2025-10-01 10:15:00'),
  ('Bamboo',     'Salle cosy, 10 tapis.',                              '2025-10-01 10:16:00', '2025-10-01 10:16:00'),
  ('Sérénité',   'Salle calme dédiée au Yin et à la méditation.',      '2025-10-01 10:17:00', '2025-10-01 10:17:00'),
  ('Énergie',    'Grande salle pour flows dynamiques, 20 tapis.',     '2025-10-01 10:18:00', '2025-10-01 10:18:00'),
  ('Harmonie',   'Salle modulable, idéale pour ateliers et prénatal.', '2025-10-01 10:19:00', '2025-10-01 10:19:00');

-- ---------- SESSIONS ----------
INSERT INTO session
(teacher_id, cancelled_by_id, class_type_id, room_id, start_at, end_at, capacity, price, details, status, cancelled_at, cancel_reason, created_at, updated_at)
VALUES
  ( (SELECT id FROM user WHERE email='lucas@namaste.com'),
    NULL,
    (SELECT id FROM class_type WHERE title='Hatha Découverte'),
    (SELECT id FROM room WHERE name_room='Lotus'),
    '2025-11-03 18:00:00', '2025-11-03 19:15:00', 15, 18.00, 'Cours du soir Hatha.', 'SCHEDULED', NULL, NULL, '2025-10-10 09:00:00', '2025-10-10 09:00:00'),

  ( (SELECT id FROM user WHERE email='sophie@namaste.com'),
    NULL,
    (SELECT id FROM class_type WHERE title='Vinyasa Flow'),
    (SELECT id FROM room WHERE name_room='Bamboo'),
    '2025-11-05 07:30:00', '2025-11-05 08:30:00', 10, 20.00, 'Morning flow.', 'SCHEDULED', NULL, NULL, '2025-10-10 09:05:00', '2025-10-10 09:05:00'),

  ( (SELECT id FROM user WHERE email='sophie@namaste.com'),
    NULL,
    (SELECT id FROM class_type WHERE title='Yin Relax'),
    (SELECT id FROM room WHERE name_room='Lotus'),
    '2025-10-20 20:00:00', '2025-10-20 21:15:00', 15, 16.00, 'Session relax du lundi.', 'COMPLETED', NULL, NULL, '2025-10-05 09:10:00', '2025-10-21 22:00:00'),

  ( (SELECT id FROM user WHERE email='lucas@namaste.com'),
    (SELECT id FROM user WHERE email='admin@namaste.com'),
    (SELECT id FROM class_type WHERE title='Vinyasa Flow'),
    (SELECT id FROM room WHERE name_room='Bamboo'),
    '2025-10-25 18:00:00', '2025-10-25 19:15:00', 10, 20.00, 'Annulé pour maintenance.', 'CANCELLED', '2025-10-24 12:00:00', 'Plafond à réparer', '2025-10-05 09:15:00', '2025-10-24 12:00:00'),

  ( (SELECT id FROM user WHERE email='lucas@namaste.com'),
    NULL,
    (SELECT id FROM class_type WHERE title='Hatha Découverte'),
    (SELECT id FROM room WHERE name_room='Bamboo'),
    '2025-11-10 12:15:00', '2025-11-10 13:15:00', 10, 18.00, 'Hatha lunch break.', 'SCHEDULED', NULL, NULL, '2025-10-12 10:00:00', '2025-10-12 10:00:00'),

  ( (SELECT id FROM user WHERE email='sophie@namaste.com'),
    NULL,
    (SELECT id FROM class_type WHERE title='Yin Relax'),
    (SELECT id FROM room WHERE name_room='Lotus'),
    '2025-11-12 19:00:00', '2025-11-12 20:15:00', 15, 16.00, 'Yin en fin de journée.', 'SCHEDULED', NULL, NULL, '2025-10-12 10:05:00', '2025-10-12 10:05:00'),

  ( (SELECT id FROM user WHERE email='sophie@namaste.com'), NULL,
    (SELECT id FROM class_type WHERE title='Vinyasa Flow'), (SELECT id FROM room WHERE name_room='Énergie'),
    '2026-01-01 07:30:00','2026-01-01 08:30:00',20,20.00,'Flow du Nouvel An : mobilité + énergie.', 'COMPLETED', NULL, NULL, '2025-12-10 09:00:00','2026-01-01 10:00:00'),

  ( (SELECT id FROM user WHERE email='lucas@namaste.com'), NULL,
    (SELECT id FROM class_type WHERE title='Hatha Découverte'), (SELECT id FROM room WHERE name_room='Lotus'),
    '2026-01-01 09:00:00','2026-01-01 10:15:00',15,18.00,'Hatha doux : respiration et bases.', 'COMPLETED', NULL, NULL, '2025-12-10 09:05:00','2026-01-01 10:20:00'),

  ( (SELECT id FROM user WHERE email='laura@namaste.com'), NULL,
    (SELECT id FROM class_type WHERE title='Prénatal Doux'), (SELECT id FROM room WHERE name_room='Harmonie'),
    '2026-01-01 10:30:00','2026-01-01 11:30:00',12,18.00,'Prénatal : bassin, souffle, détente.', 'COMPLETED', NULL, NULL, '2025-12-10 09:10:00','2026-01-01 12:00:00'),

  ( (SELECT id FROM user WHERE email='ines@namaste.com'), NULL,
    (SELECT id FROM class_type WHERE title='Méditation Guidée'), (SELECT id FROM room WHERE name_room='Sérénité'),
    '2026-01-01 12:15:00','2026-01-01 13:00:00',10,12.00,'Méditation guidée : intentions 2026.', 'COMPLETED', NULL, NULL, '2025-12-10 09:15:00','2026-01-01 13:10:00'),

  ( (SELECT id FROM user WHERE email='tom@namaste.com'), NULL,
    (SELECT id FROM class_type WHERE title='Power Vinyasa'), (SELECT id FROM room WHERE name_room='Énergie'),
    '2026-01-01 13:15:00','2026-01-01 14:15:00',20,22.00,'Power : renforcement full body.', 'COMPLETED', NULL, NULL, '2025-12-10 09:20:00','2026-01-01 15:00:00'),

  ( (SELECT id FROM user WHERE email='ines@namaste.com'), NULL,
    (SELECT id FROM class_type WHERE title='Yin Relax'), (SELECT id FROM room WHERE name_room='Sérénité'),
    '2026-01-01 18:00:00','2026-01-01 19:00:00',10,16.00,'Yin : hanches & relâchement.', 'COMPLETED', NULL, NULL, '2025-12-10 09:25:00','2026-01-01 19:10:00'),

  ( (SELECT id FROM user WHERE email='ines@namaste.com'), NULL,
    (SELECT id FROM class_type WHERE title='Yoga Nidra'), (SELECT id FROM room WHERE name_room='Sérénité'),
    '2026-01-01 19:00:00','2026-01-01 19:50:00',10,14.00,'Nidra : relaxation profonde.', 'COMPLETED', NULL, NULL, '2025-12-10 09:27:00','2026-01-01 20:00:00'),

  ( (SELECT id FROM user WHERE email='sophie@namaste.com'), (SELECT id FROM user WHERE email='sophie@namaste.com'),
    (SELECT id FROM class_type WHERE title='Vinyasa Flow'), (SELECT id FROM room WHERE name_room='Bamboo'),
    '2026-01-01 17:00:00','2026-01-01 18:00:00',10,20.00,'Annulé : professeur indisponible.', 'CANCELLED', '2026-01-01 12:00:00', 'Imprévu personnel', '2025-12-10 09:30:00','2026-01-01 12:00:00'),

  ( (SELECT id FROM user WHERE email='lucas@namaste.com'), NULL,
    (SELECT id FROM class_type WHERE title='Hatha Découverte'), (SELECT id FROM room WHERE name_room='Bamboo'),
    '2026-01-01 15:30:00','2026-01-01 16:45:00',10,18.00,'Hatha : dos et posture (niveau débutant).', 'COMPLETED', NULL, NULL, '2025-12-10 09:35:00','2026-01-01 17:00:00'),

  ( (SELECT id FROM user WHERE email='tom@namaste.com'), NULL,
    (SELECT id FROM class_type WHERE title='Power Vinyasa'), (SELECT id FROM room WHERE name_room='Énergie'),
    '2026-01-01 16:45:00','2026-01-01 17:45:00',20,22.00,'Power : mobilité + force.', 'COMPLETED', NULL, NULL, '2025-12-10 09:40:00','2026-01-01 18:00:00'),

  -- 2026-01-02 (10)
  ( (SELECT id FROM user WHERE email='sophie@namaste.com'), NULL,
    (SELECT id FROM class_type WHERE title='Vinyasa Flow'), (SELECT id FROM room WHERE name_room='Énergie'),
    '2026-01-02 07:30:00','2026-01-02 08:30:00',20,20.00,'Vinyasa : réveil progressif.', 'COMPLETED', NULL, NULL, '2025-12-11 09:00:00','2026-01-02 10:00:00'),

  ( (SELECT id FROM user WHERE email='lucas@namaste.com'), NULL,
    (SELECT id FROM class_type WHERE title='Hatha Découverte'), (SELECT id FROM room WHERE name_room='Lotus'),
    '2026-01-02 09:00:00','2026-01-02 10:15:00',15,18.00,'Hatha : fondamentaux + respiration.', 'COMPLETED', NULL, NULL, '2025-12-11 09:05:00','2026-01-02 10:20:00'),

  ( (SELECT id FROM user WHERE email='laura@namaste.com'), NULL,
    (SELECT id FROM class_type WHERE title='Prénatal Doux'), (SELECT id FROM room WHERE name_room='Harmonie'),
    '2026-01-02 10:30:00','2026-01-02 11:30:00',12,18.00,'Prénatal : dos, bassin, détente.', 'COMPLETED', NULL, NULL, '2025-12-11 09:10:00','2026-01-02 12:00:00'),

  ( (SELECT id FROM user WHERE email='ines@namaste.com'), NULL,
    (SELECT id FROM class_type WHERE title='Méditation Guidée'), (SELECT id FROM room WHERE name_room='Sérénité'),
    '2026-01-02 12:15:00','2026-01-02 13:00:00',10,12.00,'Méditation : respiration cohérente.', 'COMPLETED', NULL, NULL, '2025-12-11 09:15:00','2026-01-02 13:10:00'),

  ( (SELECT id FROM user WHERE email='tom@namaste.com'), NULL,
    (SELECT id FROM class_type WHERE title='Power Vinyasa'), (SELECT id FROM room WHERE name_room='Énergie'),
    '2026-01-02 13:15:00','2026-01-02 14:15:00',20,22.00,'Power : renforcement + flow.', 'COMPLETED', NULL, NULL, '2025-12-11 09:20:00','2026-01-02 15:00:00'),

  ( (SELECT id FROM user WHERE email='ines@namaste.com'), NULL,
    (SELECT id FROM class_type WHERE title='Yin Relax'), (SELECT id FROM room WHERE name_room='Sérénité'),
    '2026-01-02 18:00:00','2026-01-02 19:00:00',10,16.00,'Yin : épaules & nuque.', 'COMPLETED', NULL, NULL, '2025-12-11 09:25:00','2026-01-02 19:10:00'),

  ( (SELECT id FROM user WHERE email='ines@namaste.com'), NULL,
    (SELECT id FROM class_type WHERE title='Yoga Nidra'), (SELECT id FROM room WHERE name_room='Sérénité'),
    '2026-01-02 19:00:00','2026-01-02 19:50:00',10,14.00,'Nidra : détente profonde.', 'COMPLETED', NULL, NULL, '2025-12-11 09:27:00','2026-01-02 20:00:00'),

  ( (SELECT id FROM user WHERE email='lucas@namaste.com'), (SELECT id FROM user WHERE email='lucas@namaste.com'),
    (SELECT id FROM class_type WHERE title='Hatha Découverte'), (SELECT id FROM room WHERE name_room='Bamboo'),
    '2026-01-02 15:30:00','2026-01-02 16:45:00',10,18.00,'Annulé : salle indisponible.', 'CANCELLED', '2026-01-02 10:00:00', 'Salle réquisitionnée', '2025-12-11 09:30:00','2026-01-02 10:00:00'),

  ( (SELECT id FROM user WHERE email='sophie@namaste.com'), NULL,
    (SELECT id FROM class_type WHERE title='Vinyasa Flow'), (SELECT id FROM room WHERE name_room='Bamboo'),
    '2026-01-02 17:00:00','2026-01-02 18:00:00',10,20.00,'Vinyasa : torsions & mobilité.', 'COMPLETED', NULL, NULL, '2025-12-11 09:35:00','2026-01-02 18:10:00'),

  ( (SELECT id FROM user WHERE email='tom@namaste.com'), NULL,
    (SELECT id FROM class_type WHERE title='Power Vinyasa'), (SELECT id FROM room WHERE name_room='Énergie'),
    '2026-01-02 16:45:00','2026-01-02 17:45:00',20,22.00,'Power : stabilité & gainage.', 'COMPLETED', NULL, NULL, '2025-12-11 09:40:00','2026-01-02 18:00:00'),

  -- 2026-01-03 (10)
  ( (SELECT id FROM user WHERE email='sophie@namaste.com'), NULL,
    (SELECT id FROM class_type WHERE title='Vinyasa Flow'), (SELECT id FROM room WHERE name_room='Énergie'),
    '2026-01-03 07:30:00','2026-01-03 08:30:00',20,20.00,'Vinyasa : ouverture hanches.', 'COMPLETED', NULL, NULL, '2025-12-12 09:00:00','2026-01-03 10:00:00'),
  ( (SELECT id FROM user WHERE email='lucas@namaste.com'), NULL,
    (SELECT id FROM class_type WHERE title='Hatha Découverte'), (SELECT id FROM room WHERE name_room='Lotus'),
    '2026-01-03 09:00:00','2026-01-03 10:15:00',15,18.00,'Hatha : alignements & souffle.', 'COMPLETED', NULL, NULL, '2025-12-12 09:05:00','2026-01-03 10:20:00'),
  ( (SELECT id FROM user WHERE email='laura@namaste.com'), NULL,
    (SELECT id FROM class_type WHERE title='Prénatal Doux'), (SELECT id FROM room WHERE name_room='Harmonie'),
    '2026-01-03 10:30:00','2026-01-03 11:30:00',12,18.00,'Prénatal : détente & mobilité.', 'COMPLETED', NULL, NULL, '2025-12-12 09:10:00','2026-01-03 12:00:00'),
  ( (SELECT id FROM user WHERE email='ines@namaste.com'), NULL,
    (SELECT id FROM class_type WHERE title='Méditation Guidée'), (SELECT id FROM room WHERE name_room='Sérénité'),
    '2026-01-03 12:15:00','2026-01-03 13:00:00',10,12.00,'Méditation : recentrage.', 'COMPLETED', NULL, NULL, '2025-12-12 09:15:00','2026-01-03 13:10:00'),
  ( (SELECT id FROM user WHERE email='tom@namaste.com'), NULL,
    (SELECT id FROM class_type WHERE title='Power Vinyasa'), (SELECT id FROM room WHERE name_room='Énergie'),
    '2026-01-03 13:15:00','2026-01-03 14:15:00',20,22.00,'Power : flow dynamique.', 'COMPLETED', NULL, NULL, '2025-12-12 09:20:00','2026-01-03 15:00:00'),
  ( (SELECT id FROM user WHERE email='ines@namaste.com'), NULL,
    (SELECT id FROM class_type WHERE title='Yin Relax'), (SELECT id FROM room WHERE name_room='Sérénité'),
    '2026-01-03 18:00:00','2026-01-03 19:00:00',10,16.00,'Yin : dos & relâchement.', 'COMPLETED', NULL, NULL, '2025-12-12 09:25:00','2026-01-03 19:10:00'),
  ( (SELECT id FROM user WHERE email='ines@namaste.com'), NULL,
    (SELECT id FROM class_type WHERE title='Yoga Nidra'), (SELECT id FROM room WHERE name_room='Sérénité'),
    '2026-01-03 19:00:00','2026-01-03 19:50:00',10,14.00,'Nidra : récupération.', 'COMPLETED', NULL, NULL, '2025-12-12 09:27:00','2026-01-03 20:00:00'),
  ( (SELECT id FROM user WHERE email='tom@namaste.com'), (SELECT id FROM user WHERE email='tom@namaste.com'),
    (SELECT id FROM class_type WHERE title='Power Vinyasa'), (SELECT id FROM room WHERE name_room='Énergie'),
    '2026-01-03 16:45:00','2026-01-03 17:45:00',20,22.00,'Annulé : fatigue / récupération.', 'CANCELLED', '2026-01-03 08:00:00', 'Indisponibilité', '2025-12-12 09:30:00','2026-01-03 08:00:00'),
  ( (SELECT id FROM user WHERE email='lucas@namaste.com'), NULL,
    (SELECT id FROM class_type WHERE title='Hatha Découverte'), (SELECT id FROM room WHERE name_room='Bamboo'),
    '2026-01-03 15:30:00','2026-01-03 16:45:00',10,18.00,'Hatha : mobilité dos & épaules.', 'COMPLETED', NULL, NULL, '2025-12-12 09:35:00','2026-01-03 17:00:00'),
  ( (SELECT id FROM user WHERE email='sophie@namaste.com'), NULL,
    (SELECT id FROM class_type WHERE title='Vinyasa Flow'), (SELECT id FROM room WHERE name_room='Bamboo'),
    '2026-01-03 17:00:00','2026-01-03 18:00:00',10,20.00,'Vinyasa : flow du soir.', 'COMPLETED', NULL, NULL, '2025-12-12 09:40:00','2026-01-03 18:10:00'),

  -- 2026-01-04 (10)
  ( (SELECT id FROM user WHERE email='sophie@namaste.com'), NULL,
    (SELECT id FROM class_type WHERE title='Vinyasa Flow'), (SELECT id FROM room WHERE name_room='Énergie'),
    '2026-01-04 07:30:00','2026-01-04 08:30:00',20,20.00,'Vinyasa : réveil & respiration.', 'COMPLETED', NULL, NULL, '2025-12-13 09:00:00','2026-01-04 10:00:00'),
  ( (SELECT id FROM user WHERE email='lucas@namaste.com'), NULL,
    (SELECT id FROM class_type WHERE title='Hatha Découverte'), (SELECT id FROM room WHERE name_room='Lotus'),
    '2026-01-04 09:00:00','2026-01-04 10:15:00',15,18.00,'Hatha : bases + étirements.', 'COMPLETED', NULL, NULL, '2025-12-13 09:05:00','2026-01-04 10:20:00'),
  ( (SELECT id FROM user WHERE email='laura@namaste.com'), NULL,
    (SELECT id FROM class_type WHERE title='Prénatal Doux'), (SELECT id FROM room WHERE name_room='Harmonie'),
    '2026-01-04 10:30:00','2026-01-04 11:30:00',12,18.00,'Prénatal : détente & mobilité.', 'COMPLETED', NULL, NULL, '2025-12-13 09:10:00','2026-01-04 12:00:00'),
  ( (SELECT id FROM user WHERE email='ines@namaste.com'), NULL,
    (SELECT id FROM class_type WHERE title='Méditation Guidée'), (SELECT id FROM room WHERE name_room='Sérénité'),
    '2026-01-04 12:15:00','2026-01-04 13:00:00',10,12.00,'Méditation : lâcher-prise.', 'COMPLETED', NULL, NULL, '2025-12-13 09:15:00','2026-01-04 13:10:00'),
  ( (SELECT id FROM user WHERE email='tom@namaste.com'), NULL,
    (SELECT id FROM class_type WHERE title='Power Vinyasa'), (SELECT id FROM room WHERE name_room='Énergie'),
    '2026-01-04 13:15:00','2026-01-04 14:15:00',20,22.00,'Power : gainage & force.', 'COMPLETED', NULL, NULL, '2025-12-13 09:20:00','2026-01-04 15:00:00'),
  ( (SELECT id FROM user WHERE email='ines@namaste.com'), NULL,
    (SELECT id FROM class_type WHERE title='Yin Relax'), (SELECT id FROM room WHERE name_room='Sérénité'),
    '2026-01-04 18:00:00','2026-01-04 19:00:00',10,16.00,'Yin : jambes & récupération.', 'COMPLETED', NULL, NULL, '2025-12-13 09:25:00','2026-01-04 19:10:00'),
  ( (SELECT id FROM user WHERE email='ines@namaste.com'), NULL,
    (SELECT id FROM class_type WHERE title='Yoga Nidra'), (SELECT id FROM room WHERE name_room='Sérénité'),
    '2026-01-04 19:00:00','2026-01-04 19:50:00',10,14.00,'Nidra : détente dominicale.', 'COMPLETED', NULL, NULL, '2025-12-13 09:27:00','2026-01-04 20:00:00'),
  ( (SELECT id FROM user WHERE email='laura@namaste.com'), (SELECT id FROM user WHERE email='laura@namaste.com'),
    (SELECT id FROM class_type WHERE title='Prénatal Doux'), (SELECT id FROM room WHERE name_room='Harmonie'),
    '2026-01-04 15:30:00','2026-01-04 16:30:00',12,18.00,'Annulé : indisponibilité.', 'CANCELLED', '2026-01-04 08:30:00', 'Indisponibilité', '2025-12-13 09:30:00','2026-01-04 08:30:00'),
  ( (SELECT id FROM user WHERE email='lucas@namaste.com'), NULL,
    (SELECT id FROM class_type WHERE title='Hatha Découverte'), (SELECT id FROM room WHERE name_room='Bamboo'),
    '2026-01-04 15:30:00','2026-01-04 16:45:00',10,18.00,'Hatha : dos & posture.', 'COMPLETED', NULL, NULL, '2025-12-13 09:35:00','2026-01-04 17:00:00'),
  ( (SELECT id FROM user WHERE email='sophie@namaste.com'), NULL,
    (SELECT id FROM class_type WHERE title='Vinyasa Flow'), (SELECT id FROM room WHERE name_room='Bamboo'),
    '2026-01-04 17:00:00','2026-01-04 18:00:00',10,20.00,'Vinyasa : flow du soir.', 'COMPLETED', NULL, NULL, '2025-12-13 09:40:00','2026-01-04 18:10:00'),

  -- 2026-01-05 (10)
  ( (SELECT id FROM user WHERE email='sophie@namaste.com'), NULL,
    (SELECT id FROM class_type WHERE title='Vinyasa Flow'), (SELECT id FROM room WHERE name_room='Énergie'),
    '2026-01-05 07:30:00','2026-01-05 08:30:00',20,20.00,'Vinyasa : réveil en douceur.', 'COMPLETED', NULL, NULL, '2025-12-14 09:00:00','2026-01-05 10:00:00'),
  ( (SELECT id FROM user WHERE email='lucas@namaste.com'), NULL,
    (SELECT id FROM class_type WHERE title='Hatha Découverte'), (SELECT id FROM room WHERE name_room='Lotus'),
    '2026-01-05 09:00:00','2026-01-05 10:15:00',15,18.00,'Hatha : mobilité + étirements.', 'COMPLETED', NULL, NULL, '2025-12-14 09:05:00','2026-01-05 10:20:00'),
  ( (SELECT id FROM user WHERE email='laura@namaste.com'), NULL,
    (SELECT id FROM class_type WHERE title='Prénatal Doux'), (SELECT id FROM room WHERE name_room='Harmonie'),
    '2026-01-05 10:30:00','2026-01-05 11:30:00',12,18.00,'Prénatal : renfo doux & souffle.', 'COMPLETED', NULL, NULL, '2025-12-14 09:10:00','2026-01-05 12:00:00'),
  ( (SELECT id FROM user WHERE email='ines@namaste.com'), NULL,
    (SELECT id FROM class_type WHERE title='Méditation Guidée'), (SELECT id FROM room WHERE name_room='Sérénité'),
    '2026-01-05 12:15:00','2026-01-05 13:00:00',10,12.00,'Méditation : apaiser le mental.', 'COMPLETED', NULL, NULL, '2025-12-14 09:15:00','2026-01-05 13:10:00'),
  ( (SELECT id FROM user WHERE email='tom@namaste.com'), NULL,
    (SELECT id FROM class_type WHERE title='Power Vinyasa'), (SELECT id FROM room WHERE name_room='Énergie'),
    '2026-01-05 13:15:00','2026-01-05 14:15:00',20,22.00,'Power : flow + renforcement.', 'COMPLETED', NULL, NULL, '2025-12-14 09:20:00','2026-01-05 15:00:00'),
  ( (SELECT id FROM user WHERE email='ines@namaste.com'), NULL,
    (SELECT id FROM class_type WHERE title='Yin Relax'), (SELECT id FROM room WHERE name_room='Sérénité'),
    '2026-01-05 18:00:00','2026-01-05 19:00:00',10,16.00,'Yin : récupération & relâchement.', 'COMPLETED', NULL, NULL, '2025-12-14 09:25:00','2026-01-05 19:10:00'),
  ( (SELECT id FROM user WHERE email='ines@namaste.com'), NULL,
    (SELECT id FROM class_type WHERE title='Yoga Nidra'), (SELECT id FROM room WHERE name_room='Sérénité'),
    '2026-01-05 19:00:00','2026-01-05 19:50:00',10,14.00,'Nidra : détente fin de journée.', 'COMPLETED', NULL, NULL, '2025-12-14 09:27:00','2026-01-05 20:00:00'),
  ( (SELECT id FROM user WHERE email='sophie@namaste.com'), (SELECT id FROM user WHERE email='sophie@namaste.com'),
    (SELECT id FROM class_type WHERE title='Yin Relax'), (SELECT id FROM room WHERE name_room='Lotus'),
    '2026-01-05 17:00:00','2026-01-05 18:15:00',15,16.00,'Annulé : prof indisponible.', 'CANCELLED', '2026-01-05 09:00:00', 'Indisponibilité', '2025-12-14 09:30:00','2026-01-05 09:00:00'),
  ( (SELECT id FROM user WHERE email='lucas@namaste.com'), NULL,
    (SELECT id FROM class_type WHERE title='Hatha Découverte'), (SELECT id FROM room WHERE name_room='Bamboo'),
    '2026-01-05 15:30:00','2026-01-05 16:45:00',10,18.00,'Hatha : dos & épaules.', 'COMPLETED', NULL, NULL, '2025-12-14 09:35:00','2026-01-05 17:00:00'),
  ( (SELECT id FROM user WHERE email='tom@namaste.com'), NULL,
    (SELECT id FROM class_type WHERE title='Power Vinyasa'), (SELECT id FROM room WHERE name_room='Énergie'),
    '2026-01-05 16:45:00','2026-01-05 17:45:00',20,22.00,'Power : stabilité & force.', 'COMPLETED', NULL, NULL, '2025-12-14 09:40:00','2026-01-05 18:00:00'),

  -- ===========================
  -- FEBRUARY 2026 (17 -> 21) : SCHEDULED + CANCELLED
  -- ===========================

  -- 2026-02-17 (10)
  ( (SELECT id FROM user WHERE email='sophie@namaste.com'), NULL,
    (SELECT id FROM class_type WHERE title='Vinyasa Flow'), (SELECT id FROM room WHERE name_room='Énergie'),
    '2026-02-17 07:00:00','2026-02-17 08:00:00',20,20.00,'Vinyasa : réveil dynamique (post-oral).', 'SCHEDULED', NULL, NULL, '2026-02-01 09:00:00','2026-02-01 09:00:00'),
  ( (SELECT id FROM user WHERE email='lucas@namaste.com'), NULL,
    (SELECT id FROM class_type WHERE title='Hatha Découverte'), (SELECT id FROM room WHERE name_room='Lotus'),
    '2026-02-17 07:30:00','2026-02-17 08:45:00',15,18.00,'Hatha : bases & respiration.', 'SCHEDULED', NULL, NULL, '2026-02-01 09:05:00','2026-02-01 09:05:00'),
  ( (SELECT id FROM user WHERE email='ines@namaste.com'), NULL,
    (SELECT id FROM class_type WHERE title='Méditation Guidée'), (SELECT id FROM room WHERE name_room='Sérénité'),
    '2026-02-17 08:30:00','2026-02-17 09:15:00',10,12.00,'Méditation : concentration & calme.', 'SCHEDULED', NULL, NULL, '2026-02-01 09:10:00','2026-02-01 09:10:00'),
  ( (SELECT id FROM user WHERE email='laura@namaste.com'), NULL,
    (SELECT id FROM class_type WHERE title='Prénatal Doux'), (SELECT id FROM room WHERE name_room='Harmonie'),
    '2026-02-17 10:00:00','2026-02-17 11:00:00',12,18.00,'Prénatal : confort & mobilité.', 'SCHEDULED', NULL, NULL, '2026-02-01 09:12:00','2026-02-01 09:12:00'),
  ( (SELECT id FROM user WHERE email='tom@namaste.com'), NULL,
    (SELECT id FROM class_type WHERE title='Power Vinyasa'), (SELECT id FROM room WHERE name_room='Énergie'),
    '2026-02-17 10:30:00','2026-02-17 11:30:00',20,22.00,'Power : renforcement (avancé).', 'SCHEDULED', NULL, NULL, '2026-02-01 09:15:00','2026-02-01 09:15:00'),
  ( (SELECT id FROM user WHERE email='lucas@namaste.com'), NULL,
    (SELECT id FROM class_type WHERE title='Hatha Découverte'), (SELECT id FROM room WHERE name_room='Bamboo'),
    '2026-02-17 12:15:00','2026-02-17 13:30:00',10,18.00,'Hatha lunch : dos & épaules.', 'SCHEDULED', NULL, NULL, '2026-02-01 09:18:00','2026-02-01 09:18:00'),
  ( (SELECT id FROM user WHERE email='sophie@namaste.com'), NULL,
    (SELECT id FROM class_type WHERE title='Yin Relax'), (SELECT id FROM room WHERE name_room='Lotus'),
    '2026-02-17 18:00:00','2026-02-17 19:15:00',15,16.00,'Yin : récupération et relâchement.', 'SCHEDULED', NULL, NULL, '2026-02-01 09:20:00','2026-02-01 09:20:00'),
  ( (SELECT id FROM user WHERE email='ines@namaste.com'), NULL,
    (SELECT id FROM class_type WHERE title='Yoga Nidra'), (SELECT id FROM room WHERE name_room='Sérénité'),
    '2026-02-17 19:00:00','2026-02-17 19:50:00',10,14.00,'Nidra : sommeil & récupération.', 'SCHEDULED', NULL, NULL, '2026-02-01 09:25:00','2026-02-01 09:25:00'),
  ( (SELECT id FROM user WHERE email='tom@namaste.com'), (SELECT id FROM user WHERE email='tom@namaste.com'),
    (SELECT id FROM class_type WHERE title='Power Vinyasa'), (SELECT id FROM room WHERE name_room='Énergie'),
    '2026-02-17 18:30:00','2026-02-17 19:30:00',20,22.00,'Annulé : prof indisponible.', 'CANCELLED', '2026-02-16 18:00:00', 'Imprévu personnel', '2026-02-01 09:30:00','2026-02-16 18:00:00'),
  ( (SELECT id FROM user WHERE email='ines@namaste.com'), NULL,
    (SELECT id FROM class_type WHERE title='Méditation Guidée'), (SELECT id FROM room WHERE name_room='Sérénité'),
    '2026-02-17 17:00:00','2026-02-17 17:45:00',10,12.00,'Méditation : mini-session (soir).', 'SCHEDULED', NULL, NULL, '2026-02-01 09:35:00','2026-02-01 09:35:00'),

  -- 2026-02-18 (10)
  ( (SELECT id FROM user WHERE email='sophie@namaste.com'), NULL,
    (SELECT id FROM class_type WHERE title='Vinyasa Flow'), (SELECT id FROM room WHERE name_room='Bamboo'),
    '2026-02-18 07:30:00','2026-02-18 08:30:00',10,20.00,'Morning flow : énergie & mobilité.', 'SCHEDULED', NULL, NULL, '2026-02-02 09:00:00','2026-02-02 09:00:00'),
  ( (SELECT id FROM user WHERE email='lucas@namaste.com'), NULL,
    (SELECT id FROM class_type WHERE title='Hatha Découverte'), (SELECT id FROM room WHERE name_room='Lotus'),
    '2026-02-18 09:00:00','2026-02-18 10:15:00',15,18.00,'Hatha : alignements & souffle.', 'SCHEDULED', NULL, NULL, '2026-02-02 09:05:00','2026-02-02 09:05:00'),
  ( (SELECT id FROM user WHERE email='laura@namaste.com'), NULL,
    (SELECT id FROM class_type WHERE title='Prénatal Doux'), (SELECT id FROM room WHERE name_room='Harmonie'),
    '2026-02-18 10:30:00','2026-02-18 11:30:00',12,18.00,'Prénatal : bassin & détente.', 'SCHEDULED', NULL, NULL, '2026-02-02 09:10:00','2026-02-02 09:10:00'),
  ( (SELECT id FROM user WHERE email='tom@namaste.com'), NULL,
    (SELECT id FROM class_type WHERE title='Power Vinyasa'), (SELECT id FROM room WHERE name_room='Énergie'),
    '2026-02-18 12:15:00','2026-02-18 13:15:00',20,22.00,'Power : renfo + cardio.', 'SCHEDULED', NULL, NULL, '2026-02-02 09:15:00','2026-02-02 09:15:00'),
  ( (SELECT id FROM user WHERE email='ines@namaste.com'), NULL,
    (SELECT id FROM class_type WHERE title='Méditation Guidée'), (SELECT id FROM room WHERE name_room='Sérénité'),
    '2026-02-18 12:15:00','2026-02-18 13:00:00',10,12.00,'Méditation : pause du midi.', 'SCHEDULED', NULL, NULL, '2026-02-02 09:18:00','2026-02-02 09:18:00'),
  ( (SELECT id FROM user WHERE email='sophie@namaste.com'), NULL,
    (SELECT id FROM class_type WHERE title='Yin Relax'), (SELECT id FROM room WHERE name_room='Lotus'),
    '2026-02-18 17:00:00','2026-02-18 18:15:00',15,16.00,'Yin : récupération active.', 'SCHEDULED', NULL, NULL, '2026-02-02 09:20:00','2026-02-02 09:20:00'),
  ( (SELECT id FROM user WHERE email='ines@namaste.com'), NULL,
    (SELECT id FROM class_type WHERE title='Yoga Nidra'), (SELECT id FROM room WHERE name_room='Sérénité'),
    '2026-02-18 18:00:00','2026-02-18 18:50:00',10,14.00,'Nidra : reset mental.', 'SCHEDULED', NULL, NULL, '2026-02-02 09:25:00','2026-02-02 09:25:00'),
  ( (SELECT id FROM user WHERE email='lucas@namaste.com'), NULL,
    (SELECT id FROM class_type WHERE title='Hatha Découverte'), (SELECT id FROM room WHERE name_room='Bamboo'),
    '2026-02-18 18:30:00','2026-02-18 19:45:00',10,18.00,'Hatha du soir : étirements profonds.', 'SCHEDULED', NULL, NULL, '2026-02-02 09:28:00','2026-02-02 09:28:00'),
  ( (SELECT id FROM user WHERE email='tom@namaste.com'), (SELECT id FROM user WHERE email='tom@namaste.com'),
    (SELECT id FROM class_type WHERE title='Power Vinyasa'), (SELECT id FROM room WHERE name_room='Énergie'),
    '2026-02-18 19:00:00','2026-02-18 20:00:00',20,22.00,'Annulé : fatigue (récupération).', 'CANCELLED', '2026-02-18 10:00:00', 'Fatigue / récupération', '2026-02-02 09:30:00','2026-02-18 10:00:00'),
  ( (SELECT id FROM user WHERE email='ines@namaste.com'), NULL,
    (SELECT id FROM class_type WHERE title='Yin Relax'), (SELECT id FROM room WHERE name_room='Sérénité'),
    '2026-02-18 19:00:00','2026-02-18 20:00:00',10,16.00,'Yin : relâchement complet.', 'SCHEDULED', NULL, NULL, '2026-02-02 09:35:00','2026-02-02 09:35:00'),

  -- 2026-02-19 (10)
  ( (SELECT id FROM user WHERE email='sophie@namaste.com'), NULL,
    (SELECT id FROM class_type WHERE title='Vinyasa Flow'), (SELECT id FROM room WHERE name_room='Énergie'),
    '2026-02-19 07:00:00','2026-02-19 08:00:00',20,20.00,'Vinyasa : force + mobilité.', 'SCHEDULED', NULL, NULL, '2026-02-03 09:00:00','2026-02-03 09:00:00'),
  ( (SELECT id FROM user WHERE email='lucas@namaste.com'), NULL,
    (SELECT id FROM class_type WHERE title='Hatha Découverte'), (SELECT id FROM room WHERE name_room='Lotus'),
    '2026-02-19 09:00:00','2026-02-19 10:15:00',15,18.00,'Hatha : fondamentaux.', 'SCHEDULED', NULL, NULL, '2026-02-03 09:05:00','2026-02-03 09:05:00'),
  ( (SELECT id FROM user WHERE email='laura@namaste.com'), NULL,
    (SELECT id FROM class_type WHERE title='Prénatal Doux'), (SELECT id FROM room WHERE name_room='Harmonie'),
    '2026-02-19 10:30:00','2026-02-19 11:30:00',12,18.00,'Prénatal : respiration & confort.', 'SCHEDULED', NULL, NULL, '2026-02-03 09:10:00','2026-02-03 09:10:00'),
  ( (SELECT id FROM user WHERE email='ines@namaste.com'), NULL,
    (SELECT id FROM class_type WHERE title='Méditation Guidée'), (SELECT id FROM room WHERE name_room='Sérénité'),
    '2026-02-19 12:15:00','2026-02-19 13:00:00',10,12.00,'Méditation : pause du midi.', 'SCHEDULED', NULL, NULL, '2026-02-03 09:15:00','2026-02-03 09:15:00'),
  ( (SELECT id FROM user WHERE email='tom@namaste.com'), NULL,
    (SELECT id FROM class_type WHERE title='Power Vinyasa'), (SELECT id FROM room WHERE name_room='Énergie'),
    '2026-02-19 13:15:00','2026-02-19 14:15:00',20,22.00,'Power : renforcement complet.', 'SCHEDULED', NULL, NULL, '2026-02-03 09:20:00','2026-02-03 09:20:00'),
  ( (SELECT id FROM user WHERE email='sophie@namaste.com'), NULL,
    (SELECT id FROM class_type WHERE title='Yin Relax'), (SELECT id FROM room WHERE name_room='Lotus'),
    '2026-02-19 17:00:00','2026-02-19 18:15:00',15,16.00,'Yin : détente fin de journée.', 'SCHEDULED', NULL, NULL, '2026-02-03 09:25:00','2026-02-03 09:25:00'),
  ( (SELECT id FROM user WHERE email='ines@namaste.com'), NULL,
    (SELECT id FROM class_type WHERE title='Yoga Nidra'), (SELECT id FROM room WHERE name_room='Sérénité'),
    '2026-02-19 18:00:00','2026-02-19 18:50:00',10,14.00,'Nidra : récupération.', 'SCHEDULED', NULL, NULL, '2026-02-03 09:30:00','2026-02-03 09:30:00'),
  ( (SELECT id FROM user WHERE email='lucas@namaste.com'), (SELECT id FROM user WHERE email='lucas@namaste.com'),
    (SELECT id FROM class_type WHERE title='Hatha Découverte'), (SELECT id FROM room WHERE name_room='Bamboo'),
    '2026-02-19 18:30:00','2026-02-19 19:45:00',10,18.00,'Annulé : urgence personnelle.', 'CANCELLED', '2026-02-19 12:00:00', 'Urgence personnelle', '2026-02-03 09:35:00','2026-02-19 12:00:00'),
  ( (SELECT id FROM user WHERE email='tom@namaste.com'), NULL,
    (SELECT id FROM class_type WHERE title='Power Vinyasa'), (SELECT id FROM room WHERE name_room='Énergie'),
    '2026-02-19 18:30:00','2026-02-19 19:30:00',20,22.00,'Power : flow du soir.', 'SCHEDULED', NULL, NULL, '2026-02-03 09:40:00','2026-02-03 09:40:00'),
  ( (SELECT id FROM user WHERE email='ines@namaste.com'), NULL,
    (SELECT id FROM class_type WHERE title='Yin Relax'), (SELECT id FROM room WHERE name_room='Sérénité'),
    '2026-02-19 19:00:00','2026-02-19 20:00:00',10,16.00,'Yin : relâchement complet.', 'SCHEDULED', NULL, NULL, '2026-02-03 09:45:00','2026-02-03 09:45:00'),

  -- 2026-02-20 (10)
  ( (SELECT id FROM user WHERE email='sophie@namaste.com'), NULL,
    (SELECT id FROM class_type WHERE title='Vinyasa Flow'), (SELECT id FROM room WHERE name_room='Bamboo'),
    '2026-02-20 07:30:00','2026-02-20 08:30:00',10,20.00,'Morning flow : mobilité.', 'SCHEDULED', NULL, NULL, '2026-02-04 09:00:00','2026-02-04 09:00:00'),
  ( (SELECT id FROM user WHERE email='lucas@namaste.com'), NULL,
    (SELECT id FROM class_type WHERE title='Hatha Découverte'), (SELECT id FROM room WHERE name_room='Lotus'),
    '2026-02-20 09:00:00','2026-02-20 10:15:00',15,18.00,'Hatha : posture & souffle.', 'SCHEDULED', NULL, NULL, '2026-02-04 09:05:00','2026-02-04 09:05:00'),
  ( (SELECT id FROM user WHERE email='laura@namaste.com'), (SELECT id FROM user WHERE email='laura@namaste.com'),
    (SELECT id FROM class_type WHERE title='Prénatal Doux'), (SELECT id FROM room WHERE name_room='Harmonie'),
    '2026-02-20 10:30:00','2026-02-20 11:30:00',12,18.00,'Annulé : atelier externe.', 'CANCELLED', '2026-02-19 18:00:00', 'Atelier hors studio', '2026-02-04 09:10:00','2026-02-19 18:00:00'),
  ( (SELECT id FROM user WHERE email='tom@namaste.com'), NULL,
    (SELECT id FROM class_type WHERE title='Power Vinyasa'), (SELECT id FROM room WHERE name_room='Énergie'),
    '2026-02-20 12:15:00','2026-02-20 13:15:00',20,22.00,'Power : renfo + cardio.', 'SCHEDULED', NULL, NULL, '2026-02-04 09:15:00','2026-02-04 09:15:00'),
  ( (SELECT id FROM user WHERE email='ines@namaste.com'), NULL,
    (SELECT id FROM class_type WHERE title='Méditation Guidée'), (SELECT id FROM room WHERE name_room='Sérénité'),
    '2026-02-20 12:15:00','2026-02-20 13:00:00',10,12.00,'Méditation : pause du midi.', 'SCHEDULED', NULL, NULL, '2026-02-04 09:18:00','2026-02-04 09:18:00'),
  ( (SELECT id FROM user WHERE email='lucas@namaste.com'), NULL,
    (SELECT id FROM class_type WHERE title='Hatha Découverte'), (SELECT id FROM room WHERE name_room='Bamboo'),
    '2026-02-20 15:30:00','2026-02-20 16:45:00',10,18.00,'Hatha : dos & épaules.', 'SCHEDULED', NULL, NULL, '2026-02-04 09:20:00','2026-02-04 09:20:00'),
  ( (SELECT id FROM user WHERE email='sophie@namaste.com'), NULL,
    (SELECT id FROM class_type WHERE title='Yin Relax'), (SELECT id FROM room WHERE name_room='Lotus'),
    '2026-02-20 17:00:00','2026-02-20 18:15:00',15,16.00,'Yin : récupération fin de semaine.', 'SCHEDULED', NULL, NULL, '2026-02-04 09:25:00','2026-02-04 09:25:00'),
  ( (SELECT id FROM user WHERE email='ines@namaste.com'), NULL,
    (SELECT id FROM class_type WHERE title='Yoga Nidra'), (SELECT id FROM room WHERE name_room='Sérénité'),
    '2026-02-20 18:00:00','2026-02-20 18:50:00',10,14.00,'Nidra : relaxation profonde.', 'SCHEDULED', NULL, NULL, '2026-02-04 09:30:00','2026-02-04 09:30:00'),
  ( (SELECT id FROM user WHERE email='tom@namaste.com'), NULL,
    (SELECT id FROM class_type WHERE title='Power Vinyasa'), (SELECT id FROM room WHERE name_room='Énergie'),
    '2026-02-20 18:30:00','2026-02-20 19:30:00',20,22.00,'Power : flow du soir.', 'SCHEDULED', NULL, NULL, '2026-02-04 09:35:00','2026-02-04 09:35:00'),
  ( (SELECT id FROM user WHERE email='ines@namaste.com'), NULL,
    (SELECT id FROM class_type WHERE title='Yin Relax'), (SELECT id FROM room WHERE name_room='Sérénité'),
    '2026-02-20 19:00:00','2026-02-20 20:00:00',10,16.00,'Yin : relâchement complet.', 'SCHEDULED', NULL, NULL, '2026-02-04 09:40:00','2026-02-04 09:40:00'),

  -- 2026-02-21 (10)
  ( (SELECT id FROM user WHERE email='sophie@namaste.com'), NULL,
    (SELECT id FROM class_type WHERE title='Vinyasa Flow'), (SELECT id FROM room WHERE name_room='Énergie'),
    '2026-02-21 07:30:00','2026-02-21 08:30:00',20,20.00,'Vinyasa : week-end flow.', 'SCHEDULED', NULL, NULL, '2026-02-05 09:00:00','2026-02-05 09:00:00'),
  ( (SELECT id FROM user WHERE email='lucas@namaste.com'), NULL,
    (SELECT id FROM class_type WHERE title='Hatha Découverte'), (SELECT id FROM room WHERE name_room='Lotus'),
    '2026-02-21 09:00:00','2026-02-21 10:15:00',15,18.00,'Hatha : fondamentaux.', 'SCHEDULED', NULL, NULL, '2026-02-05 09:05:00','2026-02-05 09:05:00'),
  ( (SELECT id FROM user WHERE email='laura@namaste.com'), NULL,
    (SELECT id FROM class_type WHERE title='Prénatal Doux'), (SELECT id FROM room WHERE name_room='Harmonie'),
    '2026-02-21 10:30:00','2026-02-21 11:30:00',12,18.00,'Prénatal : détente + souffle.', 'SCHEDULED', NULL, NULL, '2026-02-05 09:10:00','2026-02-05 09:10:00'),
  ( (SELECT id FROM user WHERE email='tom@namaste.com'), NULL,
    (SELECT id FROM class_type WHERE title='Power Vinyasa'), (SELECT id FROM room WHERE name_room='Énergie'),
    '2026-02-21 12:15:00','2026-02-21 13:15:00',20,22.00,'Power : renfo week-end.', 'SCHEDULED', NULL, NULL, '2026-02-05 09:15:00','2026-02-05 09:15:00'),
  ( (SELECT id FROM user WHERE email='ines@namaste.com'), NULL,
    (SELECT id FROM class_type WHERE title='Méditation Guidée'), (SELECT id FROM room WHERE name_room='Sérénité'),
    '2026-02-21 12:15:00','2026-02-21 13:00:00',10,12.00,'Méditation : pause du midi.', 'SCHEDULED', NULL, NULL, '2026-02-05 09:18:00','2026-02-05 09:18:00'),
  ( (SELECT id FROM user WHERE email='lucas@namaste.com'), NULL,
    (SELECT id FROM class_type WHERE title='Hatha Découverte'), (SELECT id FROM room WHERE name_room='Bamboo'),
    '2026-02-21 15:30:00','2026-02-21 16:45:00',10,18.00,'Hatha : dos & posture.', 'SCHEDULED', NULL, NULL, '2026-02-05 09:20:00','2026-02-05 09:20:00'),
  ( (SELECT id FROM user WHERE email='sophie@namaste.com'), NULL,
    (SELECT id FROM class_type WHERE title='Yin Relax'), (SELECT id FROM room WHERE name_room='Lotus'),
    '2026-02-21 17:00:00','2026-02-21 18:15:00',15,16.00,'Yin : récupération week-end.', 'SCHEDULED', NULL, NULL, '2026-02-05 09:25:00','2026-02-05 09:25:00'),
  ( (SELECT id FROM user WHERE email='ines@namaste.com'), NULL,
    (SELECT id FROM class_type WHERE title='Yoga Nidra'), (SELECT id FROM room WHERE name_room='Sérénité'),
    '2026-02-21 18:00:00','2026-02-21 18:50:00',10,14.00,'Nidra : détente du samedi.', 'SCHEDULED', NULL, NULL, '2026-02-05 09:30:00','2026-02-05 09:30:00'),
  ( (SELECT id FROM user WHERE email='tom@namaste.com'), (SELECT id FROM user WHERE email='tom@namaste.com'),
    (SELECT id FROM class_type WHERE title='Power Vinyasa'), (SELECT id FROM room WHERE name_room='Énergie'),
    '2026-02-21 18:30:00','2026-02-21 19:30:00',20,22.00,'Annulé : imprévu prof.', 'CANCELLED', '2026-02-21 10:00:00', 'Imprévu', '2026-02-05 09:35:00','2026-02-21 10:00:00'),
  ( (SELECT id FROM user WHERE email='ines@namaste.com'), NULL,
    (SELECT id FROM class_type WHERE title='Yin Relax'), (SELECT id FROM room WHERE name_room='Sérénité'),
    '2026-02-21 19:00:00','2026-02-21 20:00:00',10,16.00,'Yin : relâchement complet.', 'SCHEDULED', NULL, NULL, '2026-02-05 09:40:00','2026-02-05 09:40:00')
;

-- ---------- RESERVATIONS ----------
INSERT INTO reservation
(student_id, session_id, cancelled_by_id, statut, booked_at, cancelled_at, created_at, updated_at)
VALUES
  ( (SELECT id FROM user WHERE email='maddie@mail.com'),
    (SELECT id FROM session WHERE start_at='2025-11-03 18:00:00' AND class_type_id=(SELECT id FROM class_type WHERE title='Hatha Découverte')),
    NULL, 'CONFIRMED', '2025-10-15 10:00:00', NULL, '2025-10-15 10:00:00', '2025-10-15 10:00:00'),

  ( (SELECT id FROM user WHERE email='emma@mail.com'),
    (SELECT id FROM session WHERE start_at='2025-11-03 18:00:00' AND class_type_id=(SELECT id FROM class_type WHERE title='Hatha Découverte')),
    NULL, 'CONFIRMED', '2025-10-16 11:30:00', NULL, '2025-10-16 11:30:00', '2025-10-16 11:30:00'),

  ( (SELECT id FROM user WHERE email='martin@mail.com'),
    (SELECT id FROM session WHERE start_at='2025-11-05 07:30:00' AND class_type_id=(SELECT id FROM class_type WHERE title='Vinyasa Flow')),
    NULL, 'CONFIRMED', '2025-10-16 12:00:00', NULL, '2025-10-16 12:00:00', '2025-10-16 12:00:00'),

  ( (SELECT id FROM user WHERE email='maddie@mail.com'),
    (SELECT id FROM session WHERE start_at='2025-10-25 18:00:00' AND class_type_id=(SELECT id FROM class_type WHERE title='Vinyasa Flow')),
    (SELECT id FROM user WHERE email='admin@namaste.com'), 'CANCELLED', '2025-10-20 09:00:00', '2025-10-24 12:05:00', '2025-10-20 09:00:00', '2025-10-24 12:05:00'),

  ( (SELECT id FROM user WHERE email='emma@mail.com'),
    (SELECT id FROM session WHERE start_at='2025-10-20 20:00:00' AND class_type_id=(SELECT id FROM class_type WHERE title='Yin Relax')),
    NULL, 'CONFIRMED', '2025-10-18 14:00:00', NULL, '2025-10-18 14:00:00', '2025-10-18 14:00:00'),

  ( (SELECT id FROM user WHERE email='martin@mail.com'),
    (SELECT id FROM session WHERE start_at='2025-11-12 19:00:00' AND class_type_id=(SELECT id FROM class_type WHERE title='Yin Relax')),
    NULL, 'CONFIRMED', '2025-10-19 10:15:00', NULL, '2025-10-19 10:15:00', '2025-10-19 10:15:00'),

  -- 2026-01-01
  ( (SELECT id FROM user WHERE email='alice@mail.com'),
    (SELECT id FROM session WHERE start_at='2026-01-01 07:30:00'),
    NULL, 'CONFIRMED', '2025-12-20 10:00:00', NULL, '2025-12-20 10:00:00', '2025-12-20 10:00:00'),

  ( (SELECT id FROM user WHERE email='julien@mail.com'),
    (SELECT id FROM session WHERE start_at='2026-01-01 07:30:00'),
    NULL, 'CONFIRMED', '2025-12-20 10:05:00', NULL, '2025-12-20 10:05:00', '2025-12-20 10:05:00'),

  ( (SELECT id FROM user WHERE email='clara@mail.com'),
    (SELECT id FROM session WHERE start_at='2026-01-01 09:00:00'),
    NULL, 'CONFIRMED', '2025-12-20 10:10:00', NULL, '2025-12-20 10:10:00', '2025-12-20 10:10:00'),

  ( (SELECT id FROM user WHERE email='nicolas@mail.com'),
    (SELECT id FROM session WHERE start_at='2026-01-01 10:30:00'),
    NULL, 'CONFIRMED', '2025-12-20 10:15:00', NULL, '2025-12-20 10:15:00', '2025-12-20 10:15:00'),

  ( (SELECT id FROM user WHERE email='lea@mail.com'),
    (SELECT id FROM session WHERE start_at='2026-01-01 12:15:00'),
    NULL, 'CONFIRMED', '2025-12-20 10:20:00', NULL, '2025-12-20 10:20:00', '2025-12-20 10:20:00'),

  ( (SELECT id FROM user WHERE email='paul@mail.com'),
    (SELECT id FROM session WHERE start_at='2026-01-01 13:15:00'),
    NULL, 'CONFIRMED', '2025-12-20 10:25:00', NULL, '2025-12-20 10:25:00', '2025-12-20 10:25:00'),

  ( (SELECT id FROM user WHERE email='sarah@mail.com'),
    (SELECT id FROM session WHERE start_at='2026-01-01 18:00:00'),
    NULL, 'CONFIRMED', '2025-12-21 09:00:00', NULL, '2025-12-21 09:00:00', '2025-12-21 09:00:00'),

  ( (SELECT id FROM user WHERE email='kevin@mail.com'),
    (SELECT id FROM session WHERE start_at='2026-01-01 19:00:00'),
    NULL, 'CONFIRMED', '2025-12-21 09:05:00', NULL, '2025-12-21 09:05:00', '2025-12-21 09:05:00'),

  -- 2026-01-02
  ( (SELECT id FROM user WHERE email='manon@mail.com'),
    (SELECT id FROM session WHERE start_at='2026-01-02 07:30:00'),
    NULL, 'CONFIRMED', '2025-12-22 11:00:00', NULL, '2025-12-22 11:00:00', '2025-12-22 11:00:00'),

  ( (SELECT id FROM user WHERE email='thomas@mail.com'),
    (SELECT id FROM session WHERE start_at='2026-01-02 09:00:00'),
    NULL, 'CONFIRMED', '2025-12-22 11:05:00', NULL, '2025-12-22 11:05:00', '2025-12-22 11:05:00'),

  ( (SELECT id FROM user WHERE email='camille@mail.com'),
    (SELECT id FROM session WHERE start_at='2026-01-02 10:30:00'),
    NULL, 'CONFIRMED', '2025-12-22 11:10:00', NULL, '2025-12-22 11:10:00', '2025-12-22 11:10:00'),

  ( (SELECT id FROM user WHERE email='antoine@mail.com'),
    (SELECT id FROM session WHERE start_at='2026-01-02 12:15:00'),
    NULL, 'CONFIRMED', '2025-12-22 11:15:00', NULL, '2025-12-22 11:15:00', '2025-12-22 11:15:00'),

  -- Annulation par l'élève (session completed, mais réservation annulée)
  ( (SELECT id FROM user WHERE email='alice@mail.com'),
    (SELECT id FROM session WHERE start_at='2026-01-02 13:15:00'),
    (SELECT id FROM user WHERE email='alice@mail.com'), 'CANCELLED', '2025-12-22 11:20:00', '2025-12-30 08:00:00', '2025-12-22 11:20:00', '2025-12-30 08:00:00'),

  -- 2026-01-03
  ( (SELECT id FROM user WHERE email='julien@mail.com'),
    (SELECT id FROM session WHERE start_at='2026-01-03 07:30:00'),
    NULL, 'CONFIRMED', '2025-12-23 10:00:00', NULL, '2025-12-23 10:00:00', '2025-12-23 10:00:00'),

  ( (SELECT id FROM user WHERE email='clara@mail.com'),
    (SELECT id FROM session WHERE start_at='2026-01-03 09:00:00'),
    NULL, 'CONFIRMED', '2025-12-23 10:05:00', NULL, '2025-12-23 10:05:00', '2025-12-23 10:05:00'),

  ( (SELECT id FROM user WHERE email='nicolas@mail.com'),
    (SELECT id FROM session WHERE start_at='2026-01-03 18:00:00'),
    NULL, 'CONFIRMED', '2025-12-23 10:10:00', NULL, '2025-12-23 10:10:00', '2025-12-23 10:10:00'),

  -- 2026-01-04
  ( (SELECT id FROM user WHERE email='lea@mail.com'),
    (SELECT id FROM session WHERE start_at='2026-01-04 07:30:00'),
    NULL, 'CONFIRMED', '2025-12-24 09:00:00', NULL, '2025-12-24 09:00:00', '2025-12-24 09:00:00'),

  ( (SELECT id FROM user WHERE email='paul@mail.com'),
    (SELECT id FROM session WHERE start_at='2026-01-04 09:00:00'),
    NULL, 'CONFIRMED', '2025-12-24 09:05:00', NULL, '2025-12-24 09:05:00', '2025-12-24 09:05:00'),

  ( (SELECT id FROM user WHERE email='sarah@mail.com'),
    (SELECT id FROM session WHERE start_at='2026-01-04 13:15:00'),
    NULL, 'CONFIRMED', '2025-12-24 09:10:00', NULL, '2025-12-24 09:10:00', '2025-12-24 09:10:00'),

  -- 2026-01-05
  ( (SELECT id FROM user WHERE email='kevin@mail.com'),
    (SELECT id FROM session WHERE start_at='2026-01-05 07:30:00'),
    NULL, 'CONFIRMED', '2025-12-26 10:00:00', NULL, '2025-12-26 10:00:00', '2025-12-26 10:00:00'),

  ( (SELECT id FROM user WHERE email='manon@mail.com'),
    (SELECT id FROM session WHERE start_at='2026-01-05 09:00:00'),
    NULL, 'CONFIRMED', '2025-12-26 10:05:00', NULL, '2025-12-26 10:05:00', '2025-12-26 10:05:00'),

  ( (SELECT id FROM user WHERE email='thomas@mail.com'),
    (SELECT id FROM session WHERE start_at='2026-01-05 18:00:00'),
    NULL, 'CONFIRMED', '2025-12-26 10:10:00', NULL, '2025-12-26 10:10:00', '2025-12-26 10:10:00'),

  -- ==========================
  -- FEBRUARY 2026 (scheduled sessions)
  -- ==========================

  -- 2026-02-17
  ( (SELECT id FROM user WHERE email='alice@mail.com'),
    (SELECT id FROM session WHERE start_at='2026-02-17 07:00:00'),
    NULL, 'CONFIRMED', '2026-02-10 10:00:00', NULL, '2026-02-10 10:00:00', '2026-02-10 10:00:00'),

  ( (SELECT id FROM user WHERE email='julien@mail.com'),
    (SELECT id FROM session WHERE start_at='2026-02-17 07:30:00'),
    NULL, 'CONFIRMED', '2026-02-10 10:05:00', NULL, '2026-02-10 10:05:00', '2026-02-10 10:05:00'),

  ( (SELECT id FROM user WHERE email='clara@mail.com'),
    (SELECT id FROM session WHERE start_at='2026-02-17 10:00:00'),
    NULL, 'CONFIRMED', '2026-02-10 10:10:00', NULL, '2026-02-10 10:10:00', '2026-02-10 10:10:00'),

  ( (SELECT id FROM user WHERE email='nicolas@mail.com'),
    (SELECT id FROM session WHERE start_at='2026-02-17 18:00:00'),
    NULL, 'CONFIRMED', '2026-02-10 10:15:00', NULL, '2026-02-10 10:15:00', '2026-02-10 10:15:00'),

  ( (SELECT id FROM user WHERE email='lea@mail.com'),
    (SELECT id FROM session WHERE start_at='2026-02-17 19:00:00'),
    NULL, 'CONFIRMED', '2026-02-10 10:20:00', NULL, '2026-02-10 10:20:00', '2026-02-10 10:20:00'),

  -- 2026-02-18
  ( (SELECT id FROM user WHERE email='paul@mail.com'),
    (SELECT id FROM session WHERE start_at='2026-02-18 07:30:00'),
    NULL, 'CONFIRMED', '2026-02-11 10:00:00', NULL, '2026-02-11 10:00:00', '2026-02-11 10:00:00'),

  ( (SELECT id FROM user WHERE email='sarah@mail.com'),
    (SELECT id FROM session WHERE start_at='2026-02-18 09:00:00'),
    NULL, 'CONFIRMED', '2026-02-11 10:05:00', NULL, '2026-02-11 10:05:00', '2026-02-11 10:05:00'),

  ( (SELECT id FROM user WHERE email='kevin@mail.com'),
    (SELECT id FROM session WHERE start_at='2026-02-18 17:00:00'),
    NULL, 'CONFIRMED', '2026-02-11 10:10:00', NULL, '2026-02-11 10:10:00', '2026-02-11 10:10:00'),

  -- annulation par l'élève sur une session scheduled (créneau 12:15 ambigu -> on fixe Méditation Guidée + Salle Sérénité)
  ( (SELECT id FROM user WHERE email='manon@mail.com'),
    (SELECT id FROM session
      WHERE start_at='2026-02-18 12:15:00'
        AND class_type_id=(SELECT id FROM class_type WHERE title='Méditation Guidée')
        AND room_id=(SELECT id FROM room WHERE name_room='Sérénité')
    ),
    (SELECT id FROM user WHERE email='manon@mail.com'), 'CANCELLED', '2026-02-11 10:15:00', '2026-02-17 09:00:00', '2026-02-11 10:15:00', '2026-02-17 09:00:00'),

  -- 2026-02-19
  ( (SELECT id FROM user WHERE email='thomas@mail.com'),
    (SELECT id FROM session WHERE start_at='2026-02-19 07:00:00'),
    NULL, 'CONFIRMED', '2026-02-12 10:00:00', NULL, '2026-02-12 10:00:00', '2026-02-12 10:00:00'),

  ( (SELECT id FROM user WHERE email='camille@mail.com'),
    (SELECT id FROM session WHERE start_at='2026-02-19 09:00:00'),
    NULL, 'CONFIRMED', '2026-02-12 10:05:00', NULL, '2026-02-12 10:05:00', '2026-02-12 10:05:00'),

  ( (SELECT id FROM user WHERE email='antoine@mail.com'),
    (SELECT id FROM session WHERE start_at='2026-02-19 19:00:00'),
    NULL, 'CONFIRMED', '2026-02-12 10:10:00', NULL, '2026-02-12 10:10:00', '2026-02-12 10:10:00'),

  -- 2026-02-20
  ( (SELECT id FROM user WHERE email='alice@mail.com'),
    (SELECT id FROM session WHERE start_at='2026-02-20 07:30:00'),
    NULL, 'CONFIRMED', '2026-02-13 10:00:00', NULL, '2026-02-13 10:00:00', '2026-02-13 10:00:00'),

  ( (SELECT id FROM user WHERE email='julien@mail.com'),
    (SELECT id FROM session WHERE start_at='2026-02-20 09:00:00'),
    NULL, 'CONFIRMED', '2026-02-13 10:05:00', NULL, '2026-02-13 10:05:00', '2026-02-13 10:05:00'),

  -- 2026-02-21
  ( (SELECT id FROM user WHERE email='clara@mail.com'),
    (SELECT id FROM session WHERE start_at='2026-02-21 07:30:00'),
    NULL, 'CONFIRMED', '2026-02-14 10:00:00', NULL, '2026-02-14 10:00:00', '2026-02-14 10:00:00'),

  ( (SELECT id FROM user WHERE email='nicolas@mail.com'),
    (SELECT id FROM session WHERE start_at='2026-02-21 17:00:00'),
    NULL, 'CONFIRMED', '2026-02-14 10:05:00', NULL, '2026-02-14 10:05:00', '2026-02-14 10:05:00'),

  ( (SELECT id FROM user WHERE email='lea@mail.com'),
    (SELECT id FROM session WHERE start_at='2026-02-21 19:00:00'),
    NULL, 'CONFIRMED', '2026-02-14 10:10:00', NULL, '2026-02-14 10:10:00', '2026-02-14 10:10:00')
;


-- ---------- REVIEWS ----------
INSERT INTO review
(student_id, class_type_id, rating, comment, statut, created_at, updated_at)
VALUES
  ( (SELECT id FROM user WHERE email='maddie@mail.com'),
    (SELECT id FROM class_type WHERE title='Hatha Découverte'),
    5, 'Super pour débuter !', 'PUBLISHED', '2025-10-21 09:00:00', '2025-10-21 09:30:00'),

  ( (SELECT id FROM user WHERE email='emma@mail.com'),
    (SELECT id FROM class_type WHERE title='Vinyasa Flow'),
    4, 'Dynamique et ludique.', 'PUBLISHED', '2025-10-21 10:00:00', '2025-10-21 10:00:00'),

  ( (SELECT id FROM user WHERE email='martin@mail.com'),
    (SELECT id FROM class_type WHERE title='Yin Relax'),
    5, 'Très relaxant, parfait le soir.', 'PENDING', '2025-10-22 18:00:00', '2025-10-22 18:00:00'),

  ( (SELECT id FROM user WHERE email='maddie@mail.com'),
    (SELECT id FROM class_type WHERE title='Vinyasa Flow'),
    2, 'Cours annulé, déçu…', 'PUBLISHED', '2025-10-25 20:00:00', '2025-10-25 20:00:00'),

  ( (SELECT id FROM user WHERE email='alice@mail.com'),
    (SELECT id FROM class_type WHERE title='Hatha Découverte'),
    5, 'Très bon cours, explications claires et ambiance rassurante.', 'PUBLISHED', '2026-01-02 09:15:00', '2026-01-02 09:30:00'),

  ( (SELECT id FROM user WHERE email='julien@mail.com'),
    (SELECT id FROM class_type WHERE title='Hatha Découverte'),
    4, 'Bon rythme pour débuter, j’ai aimé les ajustements.', 'PUBLISHED', '2026-01-03 10:20:00', '2026-01-03 10:20:00'),

  ( (SELECT id FROM user WHERE email='clara@mail.com'),
    (SELECT id FROM class_type WHERE title='Hatha Découverte'),
    3, 'Bien mais j’aurais aimé un peu plus de posture debout.', 'PENDING', '2026-01-04 12:00:00', '2026-01-04 12:00:00'),

  -- Vinyasa Flow
  ( (SELECT id FROM user WHERE email='nicolas@mail.com'),
    (SELECT id FROM class_type WHERE title='Vinyasa Flow'),
    5, 'Flow top, très dynamique et bien construit.', 'PUBLISHED', '2026-01-02 08:45:00', '2026-01-02 09:00:00'),

  ( (SELECT id FROM user WHERE email='lea@mail.com'),
    (SELECT id FROM class_type WHERE title='Vinyasa Flow'),
    4, 'Énergisant ! Bonne musique et transitions fluides.', 'PUBLISHED', '2026-01-03 09:00:00', '2026-01-03 09:05:00'),

  ( (SELECT id FROM user WHERE email='paul@mail.com'),
    (SELECT id FROM class_type WHERE title='Vinyasa Flow'),
    2, 'Un peu trop intense pour moi, mais prof sympa.', 'PUBLISHED', '2026-01-05 11:00:00', '2026-01-05 11:00:00'),

  -- Yin Relax
  ( (SELECT id FROM user WHERE email='sarah@mail.com'),
    (SELECT id FROM class_type WHERE title='Yin Relax'),
    5, 'Parfait pour relâcher, je suis sorti(e) détendu(e).', 'PUBLISHED', '2026-01-01 19:10:00', '2026-01-01 19:20:00'),

  ( (SELECT id FROM user WHERE email='kevin@mail.com'),
    (SELECT id FROM class_type WHERE title='Yin Relax'),
    4, 'Très relaxant, j’ai mieux dormi après.', 'PENDING', '2026-01-04 19:30:00', '2026-01-04 19:30:00'),

  -- Prénatal Doux
  ( (SELECT id FROM user WHERE email='manon@mail.com'),
    (SELECT id FROM class_type WHERE title='Prénatal Doux'),
    5, 'Cours doux et adapté, je me suis sentie en confiance.', 'PUBLISHED', '2026-01-02 12:05:00', '2026-01-02 12:10:00'),

  ( (SELECT id FROM user WHERE email='camille@mail.com'),
    (SELECT id FROM class_type WHERE title='Prénatal Doux'),
    4, 'Très bien, bonnes respirations et étirements.', 'PUBLISHED', '2026-01-03 12:05:00', '2026-01-03 12:15:00'),

  -- Power Vinyasa
  ( (SELECT id FROM user WHERE email='antoine@mail.com'),
    (SELECT id FROM class_type WHERE title='Power Vinyasa'),
    5, 'Intense mais super ! On sent le travail.', 'PUBLISHED', '2026-01-03 15:05:00', '2026-01-03 15:10:00'),

  ( (SELECT id FROM user WHERE email='thomas@mail.com'),
    (SELECT id FROM class_type WHERE title='Power Vinyasa'),
    4, 'Bonne séance, cardio + renforcement, j’ai transpiré !', 'PUBLISHED', '2026-01-04 15:10:00', '2026-01-04 15:10:00'),

  ( (SELECT id FROM user WHERE email='maddie@mail.com'),
    (SELECT id FROM class_type WHERE title='Power Vinyasa'),
    3, 'Challenging, j’ai suivi mais difficile par moments.', 'PENDING', '2026-01-05 18:05:00', '2026-01-05 18:05:00'),

  -- Méditation Guidée
  ( (SELECT id FROM user WHERE email='emma@mail.com'),
    (SELECT id FROM class_type WHERE title='Méditation Guidée'),
    5, 'Très apaisant, la voix guide bien et on ressort calme.', 'PUBLISHED', '2026-01-02 13:20:00', '2026-01-02 13:25:00'),

  ( (SELECT id FROM user WHERE email='martin@mail.com'),
    (SELECT id FROM class_type WHERE title='Méditation Guidée'),
    4, 'Bonne découverte, j’ai apprécié la partie respiration.', 'PUBLISHED', '2026-01-03 13:20:00', '2026-01-03 13:20:00'),

  -- Yoga Nidra
  ( (SELECT id FROM user WHERE email='alice@mail.com'),
    (SELECT id FROM class_type WHERE title='Yoga Nidra'),
    5, 'Incroyable, j’ai vraiment décroché. À refaire.', 'PUBLISHED', '2026-01-01 20:05:00', '2026-01-01 20:05:00'),

  ( (SELECT id FROM user WHERE email='julien@mail.com'),
    (SELECT id FROM class_type WHERE title='Yoga Nidra'),
    4, 'Très reposant, parfait en fin de journée.', 'PUBLISHED', '2026-01-05 20:05:00', '2026-01-05 20:05:00'),

  -- Reviews sur dates de février (pour montrer que ça continue)
  ( (SELECT id FROM user WHERE email='clara@mail.com'),
    (SELECT id FROM class_type WHERE title='Vinyasa Flow'),
    5, 'Super flow, idéal pour se remettre en forme.', 'PUBLISHED', '2026-02-17 09:20:00', '2026-02-17 09:30:00'),

  ( (SELECT id FROM user WHERE email='nicolas@mail.com'),
    (SELECT id FROM class_type WHERE title='Hatha Découverte'),
    4, 'Très bon rappel des bases, prof pédagogue.', 'PENDING', '2026-02-18 10:30:00', '2026-02-18 10:30:00'),

  ( (SELECT id FROM user WHERE email='lea@mail.com'),
    (SELECT id FROM class_type WHERE title='Yin Relax'),
    5, 'Détente totale, exactement ce qu’il me fallait.', 'PUBLISHED', '2026-02-19 20:05:00', '2026-02-19 20:05:00')
;

-- ---------- SUSPENSIONS ----------
INSERT INTO suspension
(student_id, admin_res_id, reason, start_at, end_at, status, created_at, updated_at)
VALUES
  ( (SELECT id FROM user WHERE email='martin@mail.com'),
    (SELECT id FROM user WHERE email='admin@namaste.com'),
    'No-show répétés', '2025-10-26 00:00:00', '2025-11-02 23:59:59', 'ACTIVE', '2025-10-26 08:00:00', '2025-10-26 08:00:00')
;

COMMIT;
