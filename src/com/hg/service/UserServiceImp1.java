package com.hg.service;

import com.hg.mapper.UserMapper;
import com.hg.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImp1 implements UserService{
    @Autowired
    private UserMapper userMapper;

    @Override
    public User login(String username, String password) {
        User user = userMapper.selectByPrimaryKey(username);
        if (user!=null){
            if (password.equalsIgnoreCase(user.getPassword())){
                return user;
            }
        }

        return null;
    }
}
