package com.basic.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import com.basic.common.domain.Result;
import com.basic.common.utils.PageUtil;

import com.basic.entity.TestPosition;
import com.basic.service.TestPositionService;
import com.basic.mapper.TestPositionMapper;

import java.util.Map;
/**
*公司管理ServiceImpl
*@author: lee
*@time: 2021-07-31 18:45:26
*/
@Service
public class TestPositionServiceImpl extends ServiceImpl<TestPositionMapper, TestPosition> implements TestPositionService {

    //分页查询
    public Result getPageInfo(Map<String, Object> queryParam){
        Page<TestPosition> page = new PageUtil<TestPosition>(queryParam).getPage();
        QueryWrapper<TestPosition> queryWrapper = new QueryWrapper();
        //填充查询、排序条件
        IPage mapIPage = baseMapper.selectPage(page, queryWrapper);
        return Result.success(PageUtil.initPage(mapIPage));
    }

}
