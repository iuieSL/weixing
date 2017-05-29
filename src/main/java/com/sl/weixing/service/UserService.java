package com.sl.weixing.service;

import com.sl.weixing.entity.User;

import java.util.List;

/**
 * Created by carols on 2017/5/26.
 */
public interface UserService {

    List<User> getAllUser();

    User findUserById(Integer id);
}
