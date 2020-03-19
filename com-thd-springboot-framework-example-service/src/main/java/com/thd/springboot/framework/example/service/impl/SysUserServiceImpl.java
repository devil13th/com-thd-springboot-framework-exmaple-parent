package com.thd.springboot.framework.example.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.thd.springboot.framework.example.entity.SysUser;
import com.thd.springboot.framework.example.mapper.SysUserMapper;
import com.thd.springboot.framework.example.service.SysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

/**
 * com.thd.springboot.framework.example.service.impl.SysUserServiceImpl
 *
 * @author: wanglei62
 * @DATE: 2020/1/21 17:03
 **/
@Service
public class SysUserServiceImpl implements SysUserService {
    @Autowired
    private SysUserMapper sysUserMapper;
    // 根据id查询用户
    public SysUser queryById(String id){
        return sysUserMapper.selectById(id);
    }
    //获取全部用户
    public List<SysUser> getAll(){
        return sysUserMapper.selectAll();
    }

    public List<Map<String,String>> selectAllForMap(){
        return this.sysUserMapper.selectAllForMap();
    };

    public Map<String,SysUser> selectAllForMapKey(){
        return this.sysUserMapper.selectAllForMapKey();
    };
    @Transactional
    //保存用户
    public int insert(SysUser user){
        return sysUserMapper.insert(user);
    }


    public List<SysUser> queryByName(String name){
        return sysUserMapper.queryByName(name);
    }

    // 分页查询
    public PageInfo<SysUser> queryByNamePage(String username, int limit, int page){
        PageHelper.startPage(page, limit).setOrderBy("user_name desc");
        PageInfo<SysUser> userPageInfo = new PageInfo<SysUser>(sysUserMapper.queryByName(username));
        return userPageInfo;
    }
}
