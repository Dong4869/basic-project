package com.basic.entity;

import lombok.Data;
import com.baomidou.mybatisplus.annotation.*;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

/**
*员工管理实体类
*@author: kou
*@time: 2021-07-28 09:30:05
*/

@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("employee")
public class Employee extends Model<Employee> {
    private static final long serialVersionUID = 1L;
    /**
    *主键
    */
    @TableId(value = "id", type = IdType.ID_WORKER_STR)
    private String id;

    /**
    *
    */
    private String name;

    /**
    *性别
    */
    private Integer gender;

    /**
    *年龄
    */
    private Integer age;

    /**
    *职位
    */
    private String position;

    /**
     *所属公司id
     */
    private String companyId;

    /**
    *状态
    */
    private String status;

    /**
    *
    */
    @TableField(value = "create_time", fill = FieldFill.INSERT)
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;

    /**
    *类型
    */
    private String type;

    /**
    *
    */
    @TableField(value = "update_time", fill = FieldFill.INSERT_UPDATE)
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date updateTime;

    /**
    *
    */
    @TableField(value = "create_by", fill = FieldFill.INSERT)
    private String createBy;

    /**
    *
    */
    @TableField(value = "update_by", fill = FieldFill.INSERT_UPDATE)
    private String updateBy;


}
