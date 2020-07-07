package com.thd.springboot.framework.example.generator;

import com.thd.springboot.framework.example.generator.impl.MakeCode;
import com.thd.springboot.framework.generator.GeneratorApplication;
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

public class CodeGen {
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

        System.out.println(" 参数1: 表名 , 参数2 ：模板名称 , 参数3：生成文件名称 , 参数4:模板名称 , 参数5：生成文件名称 ...");

        ConfigurableApplicationContext ctx = SpringApplication.run(GeneratorApplication.class, args);
        String[] names = ctx.getBeanDefinitionNames();
        Stream.of(names).forEach(System.out::println);

//        JdbcTemplate j = ctx.getBean(JdbcTemplate.class);
//        System.out.println(j);


        com.thd.springboot.framework.generator.core.CodeGen cg = ctx.getBean(CodeGenUtil.class);


//        tu.generator("sys_user");




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
        String[] argsArr = args;

        if(null == argsArr || argsArr.length == 0){
          throw new RuntimeException("请输入参数");
        }

        if(argsArr.length < 3){
          throw new RuntimeException("参数个数错误，至少3个参数");
        }

        if(args.length % 2 == 0){
            throw new RuntimeException("参数个数错误，必须是奇数个参数");
        }
        String tableName = argsArr[0];
        System.out.println(String.format("表名称:%s",tableName));

        int i = 0;
        Map<String,String> m = new HashMap<String,String>();
        while(i < argsArr.length){
            if(i != 0){
                m.put(argsArr[i++],argsArr[i++]);
            }else{
                i++;
            }

        }

        Set<Map.Entry<String,String>> templateInfos = m.entrySet();
        Iterator<Map.Entry<String,String>> iter = templateInfos.iterator();
        while(iter.hasNext()){
            Map.Entry<String,String> item = iter.next();
            cg.createCode(tableName,item.getKey(),item.getValue());
        }


//        MakeCode mc = ctx.getBean(MakeCode.class);
//        mc.markCode("audit_info");
    }



}
