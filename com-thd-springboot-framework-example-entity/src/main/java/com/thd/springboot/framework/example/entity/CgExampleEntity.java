package com.thd.springboot.framework.example.entity;

import lombok.Data;

import java.util.Date;
import com.thd.springboot.framework.db.entity.BasicEntity;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;

@Data
@TableName("cg_example")
public class  CgExampleEntity extends BasicEntity<String> {
    // 主键 - PK
    @TableField("id")
    private String id;
    // 姓名
    @TableField("name")
    private String name;
    // 年龄
    @TableField("age")
    private Integer age;
    // 生日
    @TableField("birthday")
    private Date birthday;
}
