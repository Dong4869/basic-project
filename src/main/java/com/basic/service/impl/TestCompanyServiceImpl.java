package com.basic.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import com.basic.common.domain.Result;
import com.basic.common.utils.PageUtil;

import com.basic.entity.TestCompany;
import com.basic.service.TestCompanyService;
import com.basic.mapper.TestCompanyMapper;

import java.util.List;
import java.util.Map;
/**
*公司管理ServiceImpl
*@author: lee
*@time: 2021-07-31 16:31:45
*/
@Service
public class TestCompanyServiceImpl extends ServiceImpl<TestCompanyMapper, TestCompany> implements TestCompanyService {

    //分页查询
    public Result getPageInfo(Map<String, Object> queryParam){
        Page<TestCompany> page = new PageUtil<TestCompany>(queryParam).getPage();
        QueryWrapper<TestCompany> queryWrapper = new QueryWrapper();
        //填充查询、排序条件
        IPage mapIPage = baseMapper.selectPage(page, queryWrapper);
        return Result.success(PageUtil.initPage(mapIPage));
    }


    public List<TestCompany> getAllCompany(QueryWrapper<TestCompany> queryWrapper){
        List<TestCompany> list = baseMapper.selectList(queryWrapper);
        return  list;
    }

}
