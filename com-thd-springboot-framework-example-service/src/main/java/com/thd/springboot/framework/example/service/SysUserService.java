package com.thd.springboot.framework.example.service;

import com.github.pagehelper.PageInfo;
import com.thd.springboot.framework.example.entity.SysUser;

import java.util.List;

/**
 * com.thd.springboot.framework.example.service.SysUserService
 *
 * @author: wanglei62
 * @DATE: 2020/1/21 17:02
 **/
public interface SysUserService {
    public SysUser getByUserId(String id);
    //获取全部用户
    public List<SysUser> getAll();

    public int insert(SysUser user);

    public List<SysUser> queryByName(String name);

    // 分页查询
    public PageInfo<SysUser> queryByNamePage(String username, int limit, int page);
}
