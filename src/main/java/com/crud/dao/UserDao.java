package com.crud.dao;

import com.crud.model.User;

import java.util.List;

public interface UserDao {
    void addUser(User user);
    void updateUser(User user);
    void removeUser(int id);
    User getUserById(int id);
    List<User> listUsers();
    List<User> listSelectUsers(String name);

    User getUserByName(String name);
}
