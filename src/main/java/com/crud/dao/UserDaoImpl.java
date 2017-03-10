package com.crud.dao;

import com.crud.model.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;


@Repository

public class UserDaoImpl implements UserDao {
    private static final Logger logger = LoggerFactory.getLogger(UserDaoImpl.class);
    private static final int PAGE_SIZE = 10;


    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public void addUser(User user) {
        Session session = this.sessionFactory.getCurrentSession();
        session.persist(user);
        logger.info("user successfully added. details: " + user);
    }

    public void updateUser(User user) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(user);
        logger.info("user successfully updated. details: " + user);
    }

    public void removeUser(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        User user = (User) session.load(User.class, new Integer(id));

        if (user != null) {
            session.delete(user);
        }
        logger.info("user successfully removed. details: " + user);
    }

    public User getUserById(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        User user = (User) session.load(User.class, new Integer(id));
        logger.info("user successfully loaded. details: " + user);
        return user;
    }

    @SuppressWarnings("unchecked")
    public List<User> listUsers() {
        Session session = this.sessionFactory.getCurrentSession();
        List<User> userList = session.createQuery("from User").list();

        for (User user : userList) {
            logger.info("list of users: " + user);
        }
        return userList;
    }

    @SuppressWarnings("unchecked")
    public List<User> listSelectUsers(String name) {
        List<User> result = new ArrayList<User>();
        if (name != null) {

            Session session = this.sessionFactory.getCurrentSession();
            List<User> userList = session.createQuery("from User").list();
            for (User user : userList) {
                if (user.getName().equals(name))
                    result.add(user);
                logger.info("list of users: " + user);
            }
        }
        return result;
    }

    public List<User> listOfUsers(Pageable pageable) {
        Session session = this.sessionFactory.getCurrentSession();
        int currentPage = pageable.getPageNumber();
        List<User> result = new ArrayList<User>();
        List<User> userList = session.createQuery("from User").list();
        for (int i = (currentPage * 10) - 10; i < currentPage * 10 && i < userList.size(); i++ ) {
            result.add(userList.get(i));
            logger.info("list of users: " + userList.get(i));
        }

        return result;
    }
}
