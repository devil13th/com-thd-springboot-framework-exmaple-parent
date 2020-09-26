package com.thd.springboot.framework.example.web;

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
        System.out.println("test");
        List<CgExampleEntity> l = this.cgExampleServiceImpl.queryAllCgExample();
        return Message.success(l);
    }

    @ResponseBody
    @PostMapping("/addCgExample")
    // url : http://127.0.0.1:8899/thd/cg/addCgExample
    public Message addCgExample(@RequestBody CgExampleEntity entity){
        this.cgExampleServiceImpl.insert(entity);
        return Message.success("SUCCESS");
    }
    @ResponseBody
    @PostMapping("/updateCgExample")
    // url : http://127.0.0.1:8899/thd/cg/updateCgExample
    public Message updateCgExample(@RequestBody CgExampleEntity entity){
        int updateCount = this.cgExampleServiceImpl.update(entity);
        if(updateCount!=1){
            throw new RuntimeException(" Update Failed !");
        }
        return Message.success("SUCCESS");
    }
    @ResponseBody
    @DeleteMapping("/physicsDeleteCgExample/{id}")
    // url : http://127.0.0.1:8899/thd/cg/physicsDeleteCgExample/15
    public Message physicsDeleteCgExample(@PathVariable String id){
        this.cgExampleServiceImpl.deletePhysics(id);
        return Message.success("SUCCESS");
    }


    @ResponseBody
    @DeleteMapping("/logicDeleteCgExample/{id}")
    // url : http://127.0.0.1:8899/thd/cg/logicDeleteCgExample/15
    public Message logicDeleteCgExample(@PathVariable String id){
        this.cgExampleServiceImpl.deleteLogic(id);
        return Message.success("SUCCESS");
    }




    @ResponseBody
    @RequestMapping("/queryCgExampleById/{id}")
    // url : http://127.0.0.1:8899/thd/cg/queryCgExampleById/2
    public Message queryCgExample(@PathVariable String id){
        CgExampleEntity entity = this.cgExampleServiceImpl.queryCgExampleById(id);
        return Message.success(entity);
    }

    @ResponseBody
    @RequestMapping("/queryCgExampleEqByPage")
    // url : http://127.0.0.1:8899/thd/cg/queryCgExampleEqByPage
    public Message queryCgExampleEqByPage(@RequestBody CgExampleEntity entity){
        PageInfo pi = this.cgExampleServiceImpl.queryListEqByPage(entity);
        return Message.success(pi);
    }


    @ResponseBody
    @RequestMapping("/queryCgExampleLikeByPage")
    // url : http://127.0.0.1:8899/thd/cg/queryCgExampleLikeByPage
    public Message queryCgExampleLikeByPage(@RequestBody CgExampleEntity entity){
        PageInfo pi = this.cgExampleServiceImpl.queryListLikeByPage(entity);
        return Message.success(pi);
    }





    @ResponseBody
    @RequestMapping("/insertCgExampleBatch")
    // url : http://127.0.0.1:8899/thd/cg/insertCgExampleBatch
    public Message insertCgExampleBatch(){

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
