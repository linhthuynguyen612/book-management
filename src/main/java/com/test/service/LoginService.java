package com.test.service;

import com.test.model.User;
import com.test.repository.UserRepository;

import java.util.List;

public class LoginService {

    private UserRepository userRepository;

    public LoginService() {
        this.userRepository = new UserRepository();
    }
    public boolean checkLogin(String username, String password) {
        List<User> list = this.userRepository.getUserByUsernameAndPassword(username, password);
        return list.size() > 0 ? true : false;
    }
}
