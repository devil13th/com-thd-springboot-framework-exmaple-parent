package com.thd.springboot.framework.example.web;

import com.thd.springboot.framework.example.entity.CgExampleEntity;
import com.thd.springboot.framework.model.Message;
import com.thd.springboot.framework.web.BasicController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.*;

/**
 * com.thd.springboot.framework.example.web.TestController
 *
 * @author: wanglei62
 * @DATE: 2020/1/20 19:14
 **/
@Controller
@RequestMapping("/example")
public class ExampleController extends BasicController {
    @Autowired
    private RedisTemplate myRedisTemplate;

    @ResponseBody
    @RequestMapping("/testLog")
    // url : http://127.0.0.1:8899/thd/example/testLog
    public Message testLog(){
        this.getLogger().info("test()");
        this.getLogger().debug("debug");
        this.getLogger().error("error");
        this.getLogger().warn("warn");
        return Message.success();
    }


    @ResponseBody
    @RequestMapping("/testRedisSet/{key}/{value}")
    // url : http://127.0.0.1:8899/thd/example/testRedisSet/name/thd
    public Message testRedisSet(@PathVariable String key,@PathVariable String value){
        this.getLogger().info("testRedisSet()");
        this.myRedisTemplate.opsForValue().set(key,value);


        Map<String,String> m = new HashMap<String,String>();
        m.put("a","a");
        m.put("b","b");
        m.put("c","c");
        this.myRedisTemplate.opsForHash().putAll("map",m);

        List<String> l = new ArrayList<String>();
        l.add("1");
        l.add("2");
        l.add("3");
        this.myRedisTemplate.opsForList().leftPushAll("list",l);


        CgExampleEntity entity = new CgExampleEntity();
        entity.setUserName("devil13th");
        entity.setUserBirthday(new Date());
        entity.setUserAge(5);
        entity.setId("5");
        this.myRedisTemplate.opsForValue().set("obj",entity);

        this.getLogger().info( this.myRedisTemplate.opsForValue().get("name").toString());
        return Message.success();
    }
    @ResponseBody
    @RequestMapping("/testRedisGet/{key}")
    // url : http://127.0.0.1:8899/thd/example/testRedisGet/name
    public Message testRedisGet(@PathVariable String key){
        this.getLogger().info("testRedisGet()");

        System.out.println(myRedisTemplate.getKeySerializer().toString());
        System.out.println(myRedisTemplate.getValueSerializer().toString());

        this.getLogger().info(this.myRedisTemplate.opsForValue().get(key).toString());
        return Message.success(this.myRedisTemplate.opsForValue().get(key));
    }


}
