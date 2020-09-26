package com.thd.springboot.framework.example.entity;

import lombok.Data;
import com.thd.springboot.framework.entity.BasicEntity;
import java.util.Date;
import java.math.BigDecimal;
import com.fasterxml.jackson.annotation.JsonFormat;


@Data
public class  CgTestEntityParent extends BasicEntity {
    // 用户
    private String userId;
    // 
    private String userName;
    // 
    private Integer userSex;
    // 
    private String userMail;
    // 
    private String userTel;
    // 
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    private Date userBirthday;
    // 
    private String userStatus;
    // 
    private String orgId;
}
