package com.lwh.service.impl;

import com.lwh.dao.UserDao;
import com.lwh.pojo.User;
import com.lwh.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    public User getLogin(User user) {
        User userLogin = userDao.login(user);

        return userLogin;
    }
}
