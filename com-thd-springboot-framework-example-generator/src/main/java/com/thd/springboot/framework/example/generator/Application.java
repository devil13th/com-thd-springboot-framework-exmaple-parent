package com.thd.springboot.framework.example.generator;

import com.thd.springboot.framework.example.generator.impl.MakeCode;
import com.thd.springboot.framework.generator.GeneratorApplication;
import com.thd.springboot.framework.generator.core.CodeGen;
import com.thd.springboot.framework.generator.core.tool.CodeGenUtil;
import org.springframework.boot.SpringApplication;
import org.springframework.context.ConfigurableApplicationContext;

import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.Stream;

/**
 * com.thd.springboot.framework.example.generator.CodeGen
 *
 * @author: wanglei62
 * @DATE: 2020/7/1 17:45
 **/

public class Application {
    /**
     * args0 : 表名称
     *
     * args1 : 模板名称
     * args2 ：生成的文件名称
     *
     * @param args
     * @throws Exception
     */
    public static void main(String[] args) throws Exception{


        ConfigurableApplicationContext ctx = SpringApplication.run(GeneratorApplication.class, args);
        String[] names = ctx.getBeanDefinitionNames();
        Stream.of(names).forEach(System.out::println);

        // 打印出spring ioc 所有的bean
//        JdbcTemplate j = ctx.getBean(JdbcTemplate.class);
//        System.out.println(j);


        CodeGen cg = ctx.getBean(CodeGenUtil.class);




        //==============================  方法1  直接调用 cg.createCode()方法生成代码

//        cg.createCode("cg_example","example.ftl","example.txt");
//        cg.createCode("cg_example","mapper.ftl","CgExampleMapper.xml");
//        cg.createCode("cg_example","entity.ftl","CgExampleEntity.java");
//        cg.createCode("cg_example","entityParent.ftl","CgExampleEntityParent.java");
//        cg.createCode("cg_example","dao.ftl","CgExampleMapper.java");
//        cg.createCode("cg_example","serviceImpl.ftl","CgExampleServiceImpl.java");
//        cg.createCode("cg_example","service.ftl","CgExampleService.java");
//        cg.createCode("cg_example","controller.ftl","CgExampleController.java");

//        cg.createCode("t_painting_actual_input_output","entityParent.ftl","${table.nameBigCamel}ParentEntity.java");
//        cg.createCode("t_painting_actual_input_output","controller.ftl","AController.java");
//        cg.createCode("t_painting_actual_input_output","mapper.ftl","${table.nameBigCamel}Mapper.xml");
//        cg.createCode("t_painting_actual_input_output","entity.ftl","${table.nameBigCamel}Entity.java");
//        cg.createCode("t_painting_actual_input_output","example.ftl","/${table.nameBigCamel}/${table.nameBigCamel}Example.java");



        //==============================  方法3  直接生成所有代码(entity dao mapper service controller... )
//        MakeCode mc = ctx.getBean(MakeCode.class);
//        mc.markCode("sys_dic");




        //==============================  方法2 java -jar 的方式调用生成代码

        MakeCode mc = ctx.getBean(MakeCode.class);
        mc.makeCodeByJavaJar(args);

        /*
        example:
        java -jar com-thd-springboot-framework-example-generator-1.0.0-SNAPSHOT.jar t_bonding_bom entity.ftl entity/${table.nameBigCamel}Entity.java entityParent.ftl ${table.nameBigCamel}EntityParent.java mapper.ftl ${table.nameBigCamel}Mapper.xml dao.ftl ${table.nameBigCamel}Mapper.java service.ftl ${table.nameBigCamel}Service.java serviceImpl.ftl ${table.nameBigCamel}ServiceImpl.java controller.ftl ${table.nameBigCamel}Controller.java example.ftl example.txt
         */






    }



}
