package com.thd.springboot.framework.example.generator.impl;

import com.thd.springboot.framework.generator.core.CodeGen;
import com.thd.springboot.framework.generator.core.tool.CodeGenUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

/**
 * com.thd.springboot.framework.example.generator.MarkCode
 *
 * @author: wanglei62
 * @DATE: 2020/7/6 15:47
 **/
@Component
public class MakeCode {
    @Autowired
    private CodeGenUtil util;

    public void markCode(String tableName) throws Exception{
        util.createCode(tableName,"entity.ftl","${table.nameBigCamel}Entity.java");
        util.createCode(tableName,"entityParent.ftl","${table.nameBigCamel}EntityParent.java");
        util.createCode(tableName,"dao.ftl","${table.nameBigCamel}Mapper.java");
        util.createCode(tableName,"mapper.ftl","${table.nameBigCamel}Mapper.xml");
        util.createCode(tableName,"example.ftl","example.txt");
        util.createCode(tableName,"service.ftl","${table.nameBigCamel}Service.java");
        util.createCode(tableName,"serviceImpl.ftl","${table.nameBigCamel}ServiceImpl.java");
        util.createCode(tableName,"controller.ftl","${table.nameBigCamel}Controller.java");

        util.createCode(tableName,"reactList.ftl","${table.nameBigCamel}List.jsx");
        util.createCode(tableName,"reactAPI.ftl","${table.nameBigCamel}Api.js");
        util.createCode(tableName,"reactForm.ftl","${table.nameBigCamel}Form.jsx");
        util.createCode(tableName,"reactView.ftl","${table.nameBigCamel}View.jsx");


//        util.createCode(tableName,"viewList.ftl","${table.nameBigCamel}List.vue");
//        util.createCode(tableName,"viewForm.ftl","${table.nameBigCamel}Form.vue");
//        util.createCode(tableName,"viewApi.ftl","${table.nameBigCamel}Api.js");
//        util.createCode(tableName,"viewOther.ftl","${table.nameBigCamel}Other.js");

    }

    /**
     * java -jar方式来生成
     *
     * @param argsArr
     * @throws Exception
     */
    public void makeCodeByJavaJar(String[] argsArr) throws Exception{
        System.out.println(" 参数1: 表名 , 参数2 ：模板名称 , 参数3：生成文件名称 , 参数4:模板名称 , 参数5：生成文件名称 ...");

        if(null == argsArr || argsArr.length == 0){
            throw new RuntimeException("请输入参数");
        }

        if(argsArr.length < 3){
            throw new RuntimeException("参数个数错误，至少3个参数");
        }

        if(argsArr.length % 2 == 0){
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
            util.createCode(tableName,item.getKey(),item.getValue());
        }
    }
}
