package com.thd.springboot.framework.example.service;

import com.thd.springboot.framework.example.entity.SysUser;

import java.util.List;
import java.util.Map;

/**
 * com.thd.springboot.framework.example.service.SysUserService
 *
 * @author: wanglei62
 * @DATE: 2020/1/21 17:02
 **/
public interface SysUserService {
    public SysUser queryById(String id);
    //获取全部用户
    public List<SysUser> getAll();

    public int insert(SysUser user);

    public List<SysUser> queryByName(String name);

    // 分页查询
//    public PageInfo<SysUser> queryByNamePage(String username, int limit, int page);

    public List<Map<String,String>> selectAllForMap();
    public Map<String,SysUser> selectAllForMapKey();

    // 测试mybatis-plugs 方法
    public SysUser queryOneByName(String name);

}
