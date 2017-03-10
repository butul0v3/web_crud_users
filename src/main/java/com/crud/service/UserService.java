package com.crud.service;

import com.crud.model.User;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface UserService {
    void addUser(User user);
    void updateUser(User user);
    void removeUser(int id);
    User getUserById(int id);
    List<User> listUsers();
    List<User> listSelectUsers(String name);
    List<User> listOfUsers(Pageable pageable);
}
