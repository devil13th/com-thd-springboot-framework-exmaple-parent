package com.thd.springboot.framework.example.entity;

import com.thd.springboot.framework.entity.BasicEntity;
import lombok.Data;

import java.util.Date;

@Data
public class  CgExampleEntityParent extends BasicEntity<String> {
    // 主键 - PK
//    @TableField("id")
    private String id;
    // 姓名
//    @TableField("user_name")
    private String userName;
    // 年龄
//    @TableField("user_age")
    private Integer userAge;
    // 生日
//    @TableField("user_birthday")
    private Date userBirthday;
}
