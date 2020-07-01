package com.thd.springboot.framework.example.generator;

import com.thd.springboot.framework.generator.GeneratorApplication;
import com.thd.springboot.framework.generator.core.tool.CodeGenUtil;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ConfigurableApplicationContext;

/**
 * com.thd.springboot.framework.example.generator.CodeGen
 *
 * @author: wanglei62
 * @DATE: 2020/7/1 17:45
 **/

@SpringBootApplication
public class CodeGen {
    public static void main(String[] args) throws Exception{
        ConfigurableApplicationContext ctx = SpringApplication.run(GeneratorApplication.class, args);
        String[] names = ctx.getBeanDefinitionNames();
        // Stream.of(names).forEach(System.out::println);

//        JdbcTemplate j = ctx.getBean(JdbcTemplate.class);
//        System.out.println(j);


        com.thd.springboot.framework.generator.core.CodeGen cg = ctx.getBean(CodeGenUtil.class);
//        System.out.println(tu);

//        tu.generator("sys_user");




//        cg.createCode("cg_example","example.ftl","example.txt");
//        cg.createCode("cg_example","mapper.ftl","CgExampleMapper.xml");
//        cg.createCode("cg_example","entity.ftl","CgExampleEntity.java");
//        cg.createCode("cg_example","entityParent.ftl","CgExampleEntityParent.java");
//        cg.createCode("cg_example","dao.ftl","CgExampleMapper.java");
//        cg.createCode("cg_example","serviceImpl.ftl","CgExampleServiceImpl.java");
//        cg.createCode("cg_example","service.ftl","CgExampleService.java");
//        cg.createCode("cg_example","controller.ftl","CgExampleController.java");

        cg.createCode("t_painting_actual_input_output","entityParent.ftl","${table.nameBigCamel}ParentEntity.java");
        cg.createCode("t_painting_actual_input_output","controller.ftl","AController.java");
        cg.createCode("t_painting_actual_input_output","mapper.ftl","${table.nameBigCamel}Mapper.xml");
        cg.createCode("t_painting_actual_input_output","entity.ftl","${table.nameBigCamel}Entity.java");
        cg.createCode("t_painting_actual_input_output","example.ftl","/${table.nameBigCamel}/${table.nameBigCamel}Example.java");
    }
}
