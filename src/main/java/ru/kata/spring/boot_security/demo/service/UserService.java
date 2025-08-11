package ru.kata.spring.boot_security.demo.service;

import ru.kata.spring.boot_security.demo.model.Role;
import ru.kata.spring.boot_security.demo.model.User;

import java.util.List;
import java.util.Optional;

public interface UserService {
    List<User> getAllUser();
    void saveUser(User user);
    User getUserById(Long id);
    void deleteUserById(Long id);
    User findByUsername(String username);
    List<Role> getAllRoles();
}
