package com.basic.controller.system.testcompany;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import com.basic.controller.common.BasicController;
import com.basic.common.domain.Result;
import com.basic.common.domain.ResultCode;
import com.basic.common.utils.StringUtils;

import com.basic.entity.TestCompany;
import com.basic.service.TestCompanyService;

import java.util.List;
import java.util.Map;


/**
*公司管理控制器
*@author: lee
*@time: 2021-07-31 16:31:45
*/

@Controller
@RequestMapping("/testCompany")
public class TestCompanyController extends BasicController{
    String prefix = "system/testcompany";
    @Autowired
    TestCompanyService testCompanyService;

    //跳转列表
    @GetMapping("")
    public String list() {
        return prefix + "/test_company_list";
    }

    //加载列表分页数据
    @PostMapping("findList")
    @ResponseBody
    public Result findList(@RequestBody Map map) {
        try {
            return testCompanyService.getPageInfo(map);
        } catch (Exception e) {
            return  Result.alert(ResultCode.COMMON_DATA_OPTION_ERROR);
        }
    }

    //添加页面跳转
    @GetMapping("add")
    public String add() {
        return prefix + "/test_company_add";
    }

    //添加页面数据提交
    @PostMapping("add")
    @ResponseBody
    public Result doAdd(@Validated TestCompany testCompany) {
        try {
            testCompanyService.save(testCompany);
            return Result.success();
        } catch (Exception e) {
            return Result.alert(ResultCode.COMMON_DATA_OPTION_ERROR);
        }
    }

    //修改页面跳转
    @GetMapping("update/{id}")
    public String update(@PathVariable String id, Model model) {
        TestCompany testCompany = testCompanyService.getById(id);
        if (testCompany != null) {
            model.addAttribute("testCompany", testCompany);
        } else {
            return redirectNoPage();
        }
        return prefix +"/test_company_update";
    }

    //修改数据提交
    @PostMapping("update")
    @ResponseBody
    public Result doUpdate(@Validated @ModelAttribute(value = "preloadTestCompany") TestCompany testCompany) {
        try {
            testCompanyService.updateById( testCompany);
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
                testCompanyService.removeById(id);
            }
            return Result.success();
        } catch (Exception e) {
            return Result.alert(ResultCode.COMMON_DATA_OPTION_ERROR);
        }
    }

    //预加载对象数据
    @ModelAttribute("preloadTestCompany")
    public TestCompany preloadTestCompany(@RequestParam(value = "id", required = false) String id) {
        if (StringUtils.isNotBlank(id)) {
            return testCompanyService.getById(id.trim());
        }
        return null;
    }
}