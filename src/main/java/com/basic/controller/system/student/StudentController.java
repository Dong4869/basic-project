package com.basic.controller.system.student;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import com.basic.controller.common.BasicController;
import com.basic.common.domain.Result;
import com.basic.common.domain.ResultCode;
import com.basic.common.utils.StringUtils;

import com.basic.entity.Student;
import com.basic.service.StudentService;

import java.util.List;
import java.util.Map;


/**
*学生信息控制器
*@author: lee
*@time: 2021-07-31 14:57:51
*/

@Controller
@RequestMapping("/student")
public class StudentController extends BasicController{
    String prefix = "system/student";
    @Autowired
    StudentService studentService;

    //跳转列表
    @GetMapping("")
    public String list() {
        return prefix + "/student_list";
    }

    //加载列表分页数据
    @PostMapping("findList")
    @ResponseBody
    public Result findList(@RequestBody Map map) {
        try {
            return studentService.getPageInfo(map);
        } catch (Exception e) {
            return  Result.alert(ResultCode.COMMON_DATA_OPTION_ERROR);
        }
    }

    //添加页面跳转
    @GetMapping("add")
    public String add() {

        return prefix + "/student_add";
    }

    //添加页面数据提交
    @PostMapping("add")
    @ResponseBody
    public Result doAdd(@Validated Student student) {
        try {
            studentService.save(student);
            return Result.success();
        } catch (Exception e) {
            return Result.alert(ResultCode.COMMON_DATA_OPTION_ERROR);
        }
    }

    //修改页面跳转
    @GetMapping("update/{id}")
    public String update(@PathVariable String id, Model model) {
        Student student = studentService.getById(id);
        if (student != null) {
            model.addAttribute("student", student);
        } else {
            return redirectNoPage();
        }
        return prefix +"/student_update";
    }

    //修改数据提交
    @PostMapping("update")
    @ResponseBody
    public Result doUpdate(@Validated @ModelAttribute(value = "preloadStudent") Student student) {
        try {
            studentService.updateById( student);
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
                studentService.removeById(id);
            }
            return Result.success();
        } catch (Exception e) {
            return Result.alert(ResultCode.COMMON_DATA_OPTION_ERROR);
        }
    }

    //预加载对象数据
    @ModelAttribute("preloadStudent")
    public Student preloadStudent(@RequestParam(value = "id", required = false) String id) {
        if (StringUtils.isNotBlank(id)) {
            return studentService.getById(id.trim());
        }
        return null;
    }
}