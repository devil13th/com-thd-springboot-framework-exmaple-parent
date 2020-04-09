package com.thd.springboot.framework.example.web;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.github.pagehelper.PageInfo;
import com.thd.springboot.framework.example.entity.CgExampleEntity;
import com.thd.springboot.framework.example.service.CgExampleService;
import com.thd.springboot.framework.model.Message;
import com.thd.springboot.framework.web.BasicController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * com.thd.springboot.framework.example.web.TestController
 *
 * @author: wanglei62
 * @DATE: 2020/1/20 19:14
 **/
@Controller
@RequestMapping("/cg")
public class CGExampleController extends BasicController {

    @Autowired
    private CgExampleService cgExampleServiceImpl;
    @ResponseBody
    @RequestMapping("/test")
    // url : http://127.0.0.1:8899/thd/cg/test
    public Message test(){
        System.out.println("123412341234");
        List<CgExampleEntity> l = this.cgExampleServiceImpl.queryAllCgExample();
        return Message.success(l);
    }


    @ResponseBody
    @RequestMapping("/queryByName/{name}")
    // url : http://127.0.0.1:8899/thd/cg/queryByName/s
    public Message queryByName(@PathVariable String name){
        QueryWrapper<CgExampleEntity> q = new QueryWrapper<CgExampleEntity>();
        q.eq("user_name",name);
        List<CgExampleEntity> l = this.cgExampleServiceImpl.queryCgExample(q);
        return Message.success(l);
    }


    @ResponseBody
    @RequestMapping("/queryCgExample/{id}")
    // url : http://127.0.0.1:8899/thd/cg/queryCgExample/2
    public Message queryCgExample(@PathVariable String id){
        CgExampleEntity entity = this.cgExampleServiceImpl.queryCgExampleById(id);
        return Message.success(entity);
    }

    @ResponseBody
    @RequestMapping("/queryCgExampleByPage")
    // url : http://127.0.0.1:8899/thd/cg/queryCgExampleByPage
    public Message queryCgExampleByPage(@RequestBody CgExampleEntity entity){

        PageInfo pi = this.cgExampleServiceImpl.queryEqByPage(entity);
        return Message.success(pi);
    }



}
