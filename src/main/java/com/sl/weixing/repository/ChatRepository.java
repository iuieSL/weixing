package com.sl.weixing.repository;

import com.sl.weixing.entity.Chat;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by carols on 2017/5/31.
 */
public interface ChatRepository extends JpaRepository<Chat,Integer> {
}
