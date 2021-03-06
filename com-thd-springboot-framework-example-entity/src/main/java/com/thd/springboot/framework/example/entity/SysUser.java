package com.thd.springboot.framework.example.entity;

import com.thd.springboot.framework.entity.BasicEntity;
import lombok.Data;

import java.util.Date;

/**
 * @author devil13th
 **/
@Data
public class SysUser extends BasicEntity<String> {
    private String userId;
    private String userName;
    private int userSex;
    private String userMail;
    private String userTel;
    private Date userBirthday;
    private String userStatus;
    private String orgId;

}
