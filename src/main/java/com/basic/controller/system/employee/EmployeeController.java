package com.basic.controller.system.employee;

import com.basic.service.SysOrganizationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import com.basic.controller.common.BasicController;
import com.basic.common.domain.Result;
import com.basic.common.domain.ResultCode;
import com.basic.common.utils.StringUtils;

import com.basic.entity.Employee;
import com.basic.service.EmployeeService;

import java.util.List;
import java.util.Map;


/**
*员工管理控制器
*@author: kou
*@time: 2021-07-28 09:30:05
*/

@Controller
@RequestMapping("/employee")
public class EmployeeController extends BasicController{
    String prefix = "employee";
    @Autowired
    EmployeeService employeeService;
    @Autowired
    SysOrganizationService sysOrganizationService;

    //跳转列表
    @GetMapping("")
    public String list() {
        return prefix + "/employee_list";
    }

    //加载列表分页数据
    @PostMapping("findList")
    @ResponseBody
    public Result findList(@RequestBody Map map) {
        try {
            return employeeService.getPageInfo(map);
        } catch (Exception e) {
            return  Result.alert(ResultCode.COMMON_DATA_OPTION_ERROR);
        }
    }

    //添加页面跳转
    @GetMapping("add/{id}")
    public String add(@PathVariable String id,Model model) {
        model.addAttribute("companyId",id);
        model.addAttribute("orgList",sysOrganizationService.list());
        return prefix + "/employee_add";
    }

    //添加页面数据提交
    @PostMapping("add")
    @ResponseBody
    public Result doAdd(@Validated Employee employee) {
        try {
            employeeService.save(employee);
            return Result.success();
        } catch (Exception e) {
            return Result.alert(ResultCode.COMMON_DATA_OPTION_ERROR);
        }
    }

    //修改页面跳转
    @GetMapping("update/{id}")
    public String update(@PathVariable String id, Model model) {

        Employee employee = employeeService.getById(id);
        if (employee != null) {
            model.addAttribute("employee", employee);
        } else {
            return redirectNoPage();
        }
        return prefix +"/employee_update";
    }

    //修改数据提交
    @PostMapping("update")
    @ResponseBody
    public Result doUpdate(@Validated @ModelAttribute(value = "preloadEmployee") Employee employee) {
        try {
            employeeService.updateById( employee);
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
                employeeService.removeById(id);
            }
            return Result.success();
        } catch (Exception e) {
            return Result.alert(ResultCode.COMMON_DATA_OPTION_ERROR);
        }
    }

    //预加载对象数据
    @ModelAttribute("preloadEmployee")
    public Employee preloadEmployee(@RequestParam(value = "id", required = false) String id) {
        if (StringUtils.isNotBlank(id)) {
            return employeeService.getById(id.trim());
        }
        return null;
    }
}