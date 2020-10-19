package com.thd.springboot.framework.example.entity;

import lombok.Data;
import com.thd.springboot.framework.entity.BasicEntity;
import java.util.Date;
import java.math.BigDecimal;
import com.fasterxml.jackson.annotation.JsonFormat;


@Data
public class  CgTestEntityParent extends BasicEntity {
    // 主键
    private String userId;
    // 姓名
    private String userName;
    // 年龄
    private Integer userAge;
    // 生日
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    private Date userBirthday;
}
