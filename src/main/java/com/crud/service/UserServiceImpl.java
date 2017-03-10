package com.crud.service;

import com.crud.dao.UserDao;
import com.crud.model.User;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("userService")
@Repository
@Transactional
public class UserServiceImpl implements UserService {
    private UserDao userDao;

    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }

    @Transactional
    public void addUser(User user) { this.userDao.addUser(user); }

    @Transactional
    public void updateUser(User user) {
        this.userDao.updateUser(user);
    }

    @Transactional
    public void removeUser(int id) {
        this.userDao.removeUser(id);
    }

    @Transactional
    public User getUserById(int id) {
        return this.userDao.getUserById(id);
    }


    @Transactional
    public List<User> listUsers() {
        return this.userDao.listUsers();
    }

    @Transactional
    public List<User> listSelectUsers(String name) { return this.userDao.listSelectUsers(name); }

    public List<User> listOfUsers(Pageable pageable) {
        return this.userDao.listOfUsers(pageable);
    }
}
