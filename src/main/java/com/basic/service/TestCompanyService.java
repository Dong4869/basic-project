package com.basic.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.IService;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.basic.common.domain.Result;
import com.basic.entity.TestCompany;

import java.util.List;
import java.util.Map;

/**
*公司管理 Service
*@author: lee
*@time: 2021-07-31 16:31:45
*/
public interface TestCompanyService extends IService<TestCompany> {
    Result getPageInfo(Map<String, Object> queryParam);

    List<TestCompany> getAllCompany(QueryWrapper<TestCompany> queryWrapper);
}