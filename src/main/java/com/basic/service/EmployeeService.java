package com.basic.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.basic.common.domain.Result;
import com.basic.entity.Employee;

import java.util.Map;

/**
*员工管理 Service
*@author: kou
*@time: 2021-07-28 09:30:05
*/
public interface EmployeeService extends IService<Employee> {
    Result getPageInfo(Map<String, Object> queryParam);
}