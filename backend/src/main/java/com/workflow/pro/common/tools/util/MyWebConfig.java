package com.workflow.pro.common.tools.util;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;


@Configuration
public class MyWebConfig implements WebMvcConfigurer {

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
//文件访问拦截器
        registry.addResourceHandler(  "/file/*")
        // registry.addResourceHandler(System.getProperty("user.dir") + "/file/*")
                .addResourceLocations(System.getProperty("user.dir") + "/file/");
        registry.addResourceHandler("/file/**").addResourceLocations(
                "file:"+System.getProperty("user.dir")+System.getProperty("file.separator")+"file"
                        +System.getProperty("file.separator")+System.getProperty("file.separator")
        );
    }

}
