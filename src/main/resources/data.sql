-- Роли
INSERT INTO roles (id, name) VALUES (1, 'ROLE_USER');
INSERT INTO roles (id, name) VALUES (2, 'ROLE_ADMIN');

-- Пользователи
INSERT INTO users (id, username, password, name, last_name, email)
VALUES (1, 'user', '$2a$10$ZrO9xIHhjzCcBjiabPxf9OW0lJJBoO.cCDE9KfltkOZKk9P8KOkb2',
        'UserName', 'UserLast', 'user@mail.com');

INSERT INTO users (id, username, password, name, last_name, email)
VALUES (2, 'admin', '$2a$10$uBtRGuL4ExJIBrMgGZkM9uGnpNvtw0ZoUcOPLOQlbb9aix4.0Gn2K',
        'AdminName', 'AdminLast', 'admin@mail.com');

-- Связи users_roles
INSERT INTO users_roles (user_id, role_id) VALUES (1, 1);
INSERT INTO users_roles (user_id, role_id) VALUES (2, 1);
INSERT INTO users_roles (user_id, role_id) VALUES (2, 2);
