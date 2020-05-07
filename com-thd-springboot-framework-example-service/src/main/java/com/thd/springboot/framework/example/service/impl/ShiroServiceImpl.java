package com.thd.springboot.framework.example.service.impl;

import com.thd.springboot.framework.shiro.bean.ShiroUser;
import com.thd.springboot.framework.shiro.service.ShiroService;

/**
 * com.thd.springboot.framework.example.service.impl.ShiroServiceImpl
 *
 * @author: wanglei62
 * @DATE: 2020/5/7 18:58
 **/
public class ShiroServiceImpl implements ShiroService {
    @Override
    public ShiroUser loadUserByAccount(String account) {
        return null;
    }

    @Override
    public ShiroUser loadUserByPhone(String phone) {
        return null;
    }
}
