package com.basic.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.basic.common.domain.Result;
import com.basic.entity.TestPosition;

import java.util.Map;

/**
*公司管理 Service
*@author: lee
*@time: 2021-07-31 18:45:26
*/
public interface TestPositionService extends IService<TestPosition> {
    Result getPageInfo(Map<String, Object> queryParam);
}