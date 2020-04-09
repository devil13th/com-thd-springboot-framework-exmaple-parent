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
    @TableField("user_name")
    private String userName;
    // 年龄
    @TableField("user_age")
    private Integer userAge;
    // 生日
    @TableField("user_birthday")
    private Date userBirthday;
}
