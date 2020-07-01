package com.thd.springboot.framework.example.web;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.github.pagehelper.PageInfo;
import ${coding.entityPackageName}.${table.nameBigCamel}Entity;
import ${coding.servicePackageName}.${table.nameBigCamel}Service;
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
 * ${coding.controllerPackageName}.${table.nameBigCamel}Controller
 **/
@Controller
@RequestMapping("/cg")
public class ${table.nameBigCamel}Controller extends BasicController {

    @Autowired
    private ${table.nameBigCamel}Service ${table.nameCamel}ServiceImpl;


    @ResponseBody
    @RequestMapping("/test")
    // url : http://127.0.0.1:8899/thd/cg/test
    public Message test(){
        System.out.println("test");
        List<${table.nameBigCamel}Entity> l = this.${table.nameCamel}ServiceImpl.queryAll${table.nameBigCamel}();
        return Message.success(l);
    }

    @ResponseBody
    @PostMapping("/add${table.nameBigCamel}")
    // url : http://127.0.0.1:8899/thd/cg/add${table.nameBigCamel}
    public Message add${table.nameBigCamel}(@RequestBody ${table.nameBigCamel}Entity entity){
        this.${table.nameCamel}ServiceImpl.add(entity);
        return Message.success("SUCCESS");
    }
    @ResponseBody
    @PostMapping("/update${table.nameBigCamel}")
    // url : http://127.0.0.1:8899/thd/cg/update${table.nameBigCamel}
    public Message update${table.nameBigCamel}(@RequestBody ${table.nameBigCamel}Entity entity){
        this.${table.nameCamel}ServiceImpl.update(entity);
        return Message.success("SUCCESS");
    }
    @ResponseBody
    @DeleteMapping("/physicsDelete${table.nameBigCamel}/{id}")
    // url : http://127.0.0.1:8899/thd/cg/physicsDelete${table.nameBigCamel}/15
    public Message physicsDelete${table.nameBigCamel}(@PathVariable String id){
        this.${table.nameCamel}ServiceImpl.physicsDelete(id);
        return Message.success("SUCCESS");
    }


    @ResponseBody
    @DeleteMapping("/logicDelete${table.nameBigCamel}/{id}")
    // url : http://127.0.0.1:8899/thd/cg/logicDelete${table.nameBigCamel}/15
    public Message logicDelete${table.nameBigCamel}(@PathVariable String id){
        this.${table.nameCamel}ServiceImpl.logicDelete(id);
        return Message.success("SUCCESS");
    }




    @ResponseBody
    @RequestMapping("/query${table.nameBigCamel}/{id}")
    // url : http://127.0.0.1:8899/thd/cg/query${table.nameBigCamel}/2
    public Message query${table.nameBigCamel}(@PathVariable String id){
        ${table.nameBigCamel}Entity entity = this.${table.nameCamel}ServiceImpl.query${table.nameBigCamel}ById(id);
        return Message.success(entity);
    }

    @ResponseBody
    @RequestMapping("/query${table.nameBigCamel}EqByPage")
    // url : http://127.0.0.1:8899/thd/cg/query${table.nameBigCamel}EqByPage
    public Message query${table.nameBigCamel}EqByPage(@RequestBody ${table.nameBigCamel}Entity entity){
        PageInfo pi = this.${table.nameCamel}ServiceImpl.queryEqByPage(entity);
        return Message.success(pi);
    }


    @ResponseBody
    @RequestMapping("/query${table.nameBigCamel}LikeByPage")
    // url : http://127.0.0.1:8899/thd/cg/query${table.nameBigCamel}LikeByPage
    public Message query${table.nameBigCamel}LikeByPage(@RequestBody ${table.nameBigCamel}Entity entity){
        PageInfo pi = this.${table.nameCamel}ServiceImpl.queryLikeByPage(entity);
        return Message.success(pi);
    }


    @ResponseBody
    @RequestMapping("/query${table.nameBigCamel}ByWrapper")
    // url : http://127.0.0.1:8899/thd/cg/queryLikeByPage
    public Message queryByWrapper(@RequestBody ${table.nameBigCamel}Entity entity){
        QueryWrapper<${table.nameBigCamel}Entity> query = new QueryWrapper<>();
        query.eq("user_name","c");
        List<${table.nameBigCamel}Entity> list = this.${table.nameCamel}ServiceImpl.queryByWrapper(query);
        return Message.success(list);
    }

    @ResponseBody
    @RequestMapping("/queryAll${table.nameBigCamel}ToMapKey")
    // url : http://127.0.0.1:8899/thd/cg/queryAll${table.nameBigCamel}ToMapKey
    public Message queryAll${table.nameBigCamel}ToMapKey(){
        QueryWrapper<${table.nameBigCamel}Entity> query = new QueryWrapper<>();
        query.eq("user_name","c");
        Map<String,${table.nameBigCamel}Entity> list = this.${table.nameCamel}ServiceImpl.queryAllToMapKey();
        return Message.success(list);
    }




    @ResponseBody
    @RequestMapping("/insert${table.nameBigCamel}Batch")
    // url : http://127.0.0.1:8899/thd/cg/insert${table.nameBigCamel}Batch
    public Message insert${table.nameBigCamel}Batch(){

        List<${table.nameBigCamel}Entity> l = new ArrayList<${table.nameBigCamel}Entity>();
        for(int i = 0 , j = 10 ; i < j ; i++){
            ${table.nameBigCamel}Entity entity = new ${table.nameBigCamel}Entity();
            entity.setId("id_" + i );
            entity.setUserAge(i);
            entity.setUserBirthday(new Date());
            entity.setUserName("devil13th_" + i);
            l.add(entity);

        }
        this.${table.nameCamel}ServiceImpl.insertBatch(l);
        return Message.success("Success");
    }






}
