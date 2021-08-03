package com.basic.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import com.basic.common.domain.Result;
import com.basic.common.utils.PageUtil;

import com.basic.entity.Student;
import com.basic.service.StudentService;
import com.basic.mapper.StudentMapper;

import java.util.Map;
/**
*学生信息ServiceImpl
*@author: lee
*@time: 2021-07-31 14:57:51
*/
@Service
public class StudentServiceImpl extends ServiceImpl<StudentMapper, Student> implements StudentService {

    //分页查询
    public Result getPageInfo(Map<String, Object> queryParam){
        Page<Student> page = new PageUtil<Student>(queryParam).getPage();
        QueryWrapper<Student> queryWrapper = new QueryWrapper();
        //填充查询、排序条件
        IPage mapIPage = baseMapper.selectPage(page, queryWrapper);
        return Result.success(PageUtil.initPage(mapIPage));
    }

}
