package com.sl.weixing.repository;

import com.sl.weixing.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by carols on 2017/5/26.
 */
public interface UserRepository extends JpaRepository<User,Integer> {
     User findByUserName(String userName);

}
