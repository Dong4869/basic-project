package com.basic.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import com.basic.common.domain.Result;
import com.basic.common.utils.PageUtil;

import com.basic.entity.Employee;
import com.basic.service.EmployeeService;
import com.basic.mapper.EmployeeMapper;

import java.util.Map;
/**
*员工管理ServiceImpl
*@author: kou
*@time: 2021-07-28 09:30:05
*/
@Service
public class EmployeeServiceImpl extends ServiceImpl<EmployeeMapper, Employee> implements EmployeeService {

    //分页查询
    public Result getPageInfo(Map<String, Object> queryParam){
        Page<Employee> page = new PageUtil<Employee>(queryParam).getPage();
        QueryWrapper<Employee> queryWrapper = new QueryWrapper();
        if (queryParam.get("deptId") != null) {
            queryWrapper.eq("company_id", queryParam.get("deptId"));
        }
        //填充查询、排序条件
        IPage mapIPage = baseMapper.selectPage(page, queryWrapper);
        return Result.success(PageUtil.initPage(mapIPage));
    }

}
