# Spring Boot Security Demo

Учебный проект Spring Boot с настройкой безопасности Spring Security.

## Описание проекта

Этот проект демонстрирует реализацию системы аутентификации и авторизации с использованием Spring Security. Проект включает в себя:

- **Модели данных**: User и Role с поддержкой множественных ролей
- **Безопасность**: Настройка Spring Security с UserDetailsService
- **CRUD операции**: Полный набор операций для управления пользователями
- **Веб-интерфейс**: Современный UI с использованием Bootstrap и Thymeleaf

## Функциональность

### Роли пользователей
- **ADMIN**: Полный доступ к системе, включая CRUD операции с пользователями
- **USER**: Доступ только к своей странице профиля

### Доступные страницы
- `/` - Главная страница (доступна всем)
- `/login` - Страница входа (доступна всем)
- `/user` - Страница пользователя (только для USER и ADMIN)
- `/admin` - Панель администратора (только для ADMIN)
- `/admin/new` - Создание нового пользователя (только для ADMIN)
- `/admin/edit/{id}` - Редактирование пользователя (только для ADMIN)

### CRUD операции
- **Create**: Создание новых пользователей с выбором ролей
- **Read**: Просмотр списка всех пользователей и их профилей
- **Update**: Редактирование данных пользователей
- **Delete**: Удаление пользователей

## Технологии

- **Spring Boot** 2.7.x
- **Spring Security** 5.x
- **Spring Data JPA**
- **Thymeleaf** с Spring Security extras
- **Bootstrap** 5.1.3
- **MySQL**
- **Maven**

## Запуск проекта

### Предварительные требования
- Java 8 или выше
- Maven 3.6+
- MySQL

### Настройка базы данных
1. Создайте базу данных MySQL с именем `user_crud_2`
2. Обновите настройки подключения в `application.properties`:
```properties
spring.datasource.url=jdbc:mysql://localhost:3306/user_crud_2
spring.datasource.username=your_username
spring.datasource.password=your_password
```

### Запуск
1. Клонируйте репозиторий
2. Перейдите в директорию проекта
3. Выполните команду:
```bash
mvn spring-boot:run
```
4. Откройте браузер и перейдите по адресу: `http://localhost:8080`

## Решение проблем

### Ошибка "Table doesn't exist"
Если вы получаете ошибку `Table 'user_crud_2.roles' doesn't exist`:

1. **Убедитесь, что база данных создана**:
   ```sql
   CREATE DATABASE user_crud_2;
   ```

2. **Проверьте настройки подключения** в `application.properties`

3. **Очистите и пересоберите проект**:
   ```bash
   mvn clean compile
   mvn spring-boot:run
   ```

### Ошибка "Maven not found"
Если Maven не установлен:
1. Установите Maven с официального сайта
2. Или используйте Maven Wrapper:
   ```bash
   ./mvnw.cmd spring-boot:run
   ```

### Порт занят
Если порт 8080 занят, измените порт в `application.properties`:
```properties
server.port=8081
```

## Тестовые аккаунты

После запуска приложения в базе данных будут созданы следующие тестовые пользователи:

### Администратор
- **Username**: admin
- **Password**: admin
- **Роли**: ROLE_USER, ROLE_ADMIN

### Пользователь
- **Username**: user
- **Password**: user
- **Роли**: ROLE_USER

## Структура проекта

```
src/main/java/ru/kata/spring/boot_security/demo/
├── configs/                 # Конфигурации Spring Security
│   ├── WebSecurityConfig.java
│   ├── PasswordEncoderConfig.java
│   └── SuccessUserHandler.java
├── controller/              # Контроллеры
│   └── UserController.java
├── model/                   # Модели данных
│   ├── User.java
│   └── Role.java
├── repository/              # Репозитории
│   ├── UserRepository.java
│   └── RoleRepository.java
├── service/                 # Сервисы
│   ├── UserService.java
│   ├── UserServiceImpl.java
│   └── SecurityUserDetailsService.java
└── SpringBootSecurityDemoApplication.java

src/main/resources/
├── templates/               # Thymeleaf шаблоны
│   ├── index.html
│   ├── login.html
│   ├── user.html
│   ├── admin.html
│   ├── create_user.html
│   └── edit_user.html
├── application.properties   # Настройки приложения
└── data.sql                # Начальные данные
```

## Особенности реализации

### Безопасность
- Использование BCrypt для кодирования паролей
- Настройка UserDetailsService вместо inMemory аутентификации
- Конфигурация ролей и разрешений
- Настройка LoginSuccessHandler для перенаправления после входа
- Отдельный конфигурационный класс для PasswordEncoder

### Модели данных
- **User** реализует интерфейс `UserDetails`
- **Role** реализует интерфейс `GrantedAuthority`
- Связь Many-to-Many между User и Role

### Веб-интерфейс
- Современный дизайн с использованием Bootstrap
- Адаптивная верстка
- Интеграция с Spring Security через Thymeleaf extras
- Формы с валидацией

## Логирование

В проекте настроено подробное логирование для отладки:
- Spring Framework: DEBUG
- Hibernate: DEBUG

## Лицензия

Этот проект создан в учебных целях. 