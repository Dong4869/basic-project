package com.basic.controller.system.testposition;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import com.basic.controller.common.BasicController;
import com.basic.common.domain.Result;
import com.basic.common.domain.ResultCode;
import com.basic.common.utils.StringUtils;

import com.basic.entity.TestPosition;
import com.basic.service.TestPositionService;

import java.util.List;
import java.util.Map;


/**
*公司管理控制器
*@author: lee
*@time: 2021-07-31 18:45:26
*/

@Controller
@RequestMapping("/testPosition")
public class TestPositionController extends BasicController{
    String prefix = "system/testposition";
    @Autowired
    TestPositionService testPositionService;

    //跳转列表
    @GetMapping("")
    public String list() {
        return prefix + "/test_position_list";
    }

    //加载列表分页数据
    @PostMapping("findList")
    @ResponseBody
    public Result findList(@RequestBody Map map) {
        try {
            return testPositionService.getPageInfo(map);
        } catch (Exception e) {
            return  Result.alert(ResultCode.COMMON_DATA_OPTION_ERROR);
        }
    }

    //添加页面跳转
    @GetMapping("add")
    public String add() {
        return prefix + "/test_position_add";
    }

    //添加页面数据提交
    @PostMapping("add")
    @ResponseBody
    public Result doAdd(@Validated TestPosition testPosition) {
        try {
            testPositionService.save(testPosition);
            return Result.success();
        } catch (Exception e) {
            return Result.alert(ResultCode.COMMON_DATA_OPTION_ERROR);
        }
    }

    //修改页面跳转
    @GetMapping("update/{id}")
    public String update(@PathVariable String id, Model model) {
        TestPosition testPosition = testPositionService.getById(id);
        if (testPosition != null) {
            model.addAttribute("testPosition", testPosition);
        } else {
            return redirectNoPage();
        }
        return prefix +"/test_position_update";
    }

    //修改数据提交
    @PostMapping("update")
    @ResponseBody
    public Result doUpdate(@Validated @ModelAttribute(value = "preloadTestPosition") TestPosition testPosition) {
        try {
            testPositionService.updateById( testPosition);
            return Result.success();
        } catch (Exception e) {
            return Result.alert(ResultCode.COMMON_DATA_OPTION_ERROR);
        }
    }

    //删除根据ids数组删除数据
    @PostMapping("delete")
    @ResponseBody
    public Result delete(@RequestParam(value = "ids") List<String> ids) {
        try {
            for (String id : ids) {
                testPositionService.removeById(id);
            }
            return Result.success();
        } catch (Exception e) {
            return Result.alert(ResultCode.COMMON_DATA_OPTION_ERROR);
        }
    }

    //预加载对象数据
    @ModelAttribute("preloadTestPosition")
    public TestPosition preloadTestPosition(@RequestParam(value = "id", required = false) String id) {
        if (StringUtils.isNotBlank(id)) {
            return testPositionService.getById(id.trim());
        }
        return null;
    }
}