package com.hg.service;

import com.hg.pojo.User;

public interface UserService {
    User login(String username, String password);
}
