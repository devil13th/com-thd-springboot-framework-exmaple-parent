package com.thd.springboot.framework.example.web;

import com.thd.springboot.framework.model.Message;
import com.thd.springboot.framework.web.BasicController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * com.thd.springboot.framework.example.web.TestController
 *
 * @author: wanglei62
 * @DATE: 2020/1/20 19:14
 **/
@Controller
@RequestMapping("/example")
public class ExampleController extends BasicController {
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


}
