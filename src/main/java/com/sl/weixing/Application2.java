package com.sl.weixing;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;

/**
 * Created by carols on 2017/5/26.
 */
@SpringBootApplication
@ServletComponentScan("com.sl.weixing.servlet")
public class Application2 {

    public static void main(String[] args) throws Exception {
        SpringApplication.run(Application2.class, args);
    }

}
