package com.thd.springboot.framework.example.web;

import com.github.pagehelper.PageInfo;
import com.thd.springboot.framework.example.entity.SysUser;
import com.thd.springboot.framework.example.service.SysUserService;
import com.thd.springboot.framework.model.Message;
import com.thd.springboot.framework.web.BasicController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * com.thd.springboot.framework.example.web.SysUserController
 *
 * @author: wanglei62
 * @DATE: 2020/1/21 17:04
 **/
@Controller
@RequestMapping("/sysUser")
public class SysUserController extends BasicController {

    @Autowired
    private SysUserService sysUserService;

    @RequestMapping("/queryAll")
    @ResponseBody
    public Message queryAll(){
        List<SysUser> l = this.sysUserService.getAll();
        return Message.success(l);
    }


    /**
     * 测试分页插件
     * @return
     */
    @ResponseBody
    @RequestMapping(value="/queryByName/{name}/{page}/{pageSize}")
    //http://127.0.0.1:8899/thd/mybatis/queryByName/{name}/{page}/{pageSize}
    public ResponseEntity queryByName(@PathVariable String name, @PathVariable int page, @PathVariable int pageSize){
        PageInfo<SysUser> pi = this.sysUserService.queryByNamePage(name,pageSize,page);
        return ResponseEntity.ok(pi);
    }
}
