package com.workflow.pro.modules.job.demo;

import com.workflow.pro.common.quartz.base.BaseQuartz;
import org.springframework.stereotype.Component;

@Component("failure")
public class FailureJob implements BaseQuartz {

    @Override
    public void run(String param) throws Exception {
        System.out.println("执行 failure 任务");
    }
}
