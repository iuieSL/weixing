package com.sl.weixing.service.impl;

import com.sl.weixing.entity.User;
import com.sl.weixing.repository.UserRepository;
import com.sl.weixing.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by carols on 2017/5/26.
 */
@Service
public class UserServiceImpl implements UserService{

    @Autowired
    private UserRepository userRepository;

    @Override
    public List<User> getAllUser() {
        return userRepository.findAll();
    }

    @Override
    public User findUserById(Integer id) {
        return userRepository.findOne(id);
    }

    @Override
    public User findUserByName(String nickname) {
         return userRepository.findByUserName(nickname);
    }
}
