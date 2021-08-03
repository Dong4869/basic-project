package com.basic.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.basic.common.domain.Result;
import com.basic.entity.Student;

import java.util.Map;

/**
*学生信息 Service
*@author: lee
*@time: 2021-07-31 14:57:51
*/
public interface StudentService extends IService<Student> {
    Result getPageInfo(Map<String, Object> queryParam);
}