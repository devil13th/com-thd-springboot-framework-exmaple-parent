package com.thd.springboot.framework.example.web;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.github.pagehelper.PageInfo;
import com.thd.springboot.framework.example.entity.CgExampleEntity;
import com.thd.springboot.framework.example.service.CgExampleService;
import com.thd.springboot.framework.model.Message;
import com.thd.springboot.framework.web.BasicController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * com.thd.springboot.framework.example.controller.CgExampleController
 **/
@Controller
@RequestMapping("/cg")
public class CgExampleController extends BasicController {

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
    @PostMapping("/add")
    // url : http://127.0.0.1:8899/thd/cg/add
    public Message add(@RequestBody CgExampleEntity entity){
        this.cgExampleServiceImpl.add(entity);
        return Message.success("SUCCESS");
    }
    @ResponseBody
    @PostMapping("/update")
    // url : http://127.0.0.1:8899/thd/cg/update
    public Message update(@RequestBody CgExampleEntity entity){
        this.cgExampleServiceImpl.update(entity);
        return Message.success("SUCCESS");
    }
    @ResponseBody
    @DeleteMapping("/physicsDelete/{id}")
    // url : http://127.0.0.1:8899/thd/cg/physicsDelete/15
    public Message physicsDelete(@PathVariable String id){
        this.cgExampleServiceImpl.physicsDelete(id);
        return Message.success("SUCCESS");
    }


    @ResponseBody
    @DeleteMapping("/logicDelete/{id}")
    // url : http://127.0.0.1:8899/thd/cg/logicDelete/15
    public Message logicDelete(@PathVariable String id){
        this.cgExampleServiceImpl.logicDelete(id);
        return Message.success("SUCCESS");
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
    @RequestMapping("/queryCgExampleEqByPage")
    // url : http://127.0.0.1:8899/thd/cg/queryCgExampleEqByPage
    public Message queryCgExampleEqByPage(@RequestBody CgExampleEntity entity){
        PageInfo pi = this.cgExampleServiceImpl.queryEqByPage(entity);
        return Message.success(pi);
    }


    @ResponseBody
    @RequestMapping("/queryCgExampleLikeByPage")
    // url : http://127.0.0.1:8899/thd/cg/queryCgExampleLikeByPage
    public Message queryCgExampleLikeByPage(@RequestBody CgExampleEntity entity){
        PageInfo pi = this.cgExampleServiceImpl.queryLikeByPage(entity);
        return Message.success(pi);
    }


    @ResponseBody
    @RequestMapping("/queryByWrapper")
    // url : http://127.0.0.1:8899/thd/cg/queryLikeByPage
    public Message queryByWrapper(@RequestBody CgExampleEntity entity){
        QueryWrapper<CgExampleEntity> query = new QueryWrapper<>();
        query.eq("user_name","c");
        List<CgExampleEntity> list = this.cgExampleServiceImpl.queryByWrapper(query);
        return Message.success(list);
    }

    @ResponseBody
    @RequestMapping("/queryAllToMapKey")
    // url : http://127.0.0.1:8899/thd/cg/queryAllToMapKey
    public Message queryAllToMapKey(){
        QueryWrapper<CgExampleEntity> query = new QueryWrapper<>();
        query.eq("user_name","c");
        Map<String,CgExampleEntity> list = this.cgExampleServiceImpl.queryAllToMapKey();
        return Message.success(list);
    }




    @ResponseBody
    @RequestMapping("/insertBatch")
    // url : http://127.0.0.1:8899/thd/cg/insertBatch
    public Message insertBatch(){

        List<CgExampleEntity> l = new ArrayList<CgExampleEntity>();
        for(int i = 0 , j = 10 ; i < j ; i++){
            CgExampleEntity entity = new CgExampleEntity();
            entity.setId("id_" + i );
            entity.setUserAge(i);
            entity.setUserBirthday(new Date());
            entity.setUserName("devil13th_" + i);
            l.add(entity);

        }
        this.cgExampleServiceImpl.insertBatch(l);
        return Message.success("Success");
    }






}
