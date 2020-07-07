package com.thd.springboot.framework.example.generator.impl;

import com.thd.springboot.framework.generator.core.tool.CodeGenUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

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
        util.createCode(tableName,"entityParent.ftl","${table.nameBigCamel}ParentEntity.java");
        util.createCode(tableName,"mapper.ftl","${table.nameBigCamel}Mapper.xml");
        util.createCode(tableName,"dao.ftl","${table.nameBigCamel}Mapper.java");
        util.createCode(tableName,"service.ftl","${table.nameBigCamel}Service.java");
        util.createCode(tableName,"serviceImpl.ftl","${table.nameBigCamel}ServiceImpl.java");
        util.createCode(tableName,"controller.ftl","${table.nameBigCamel}Controller.java");

    }
}
