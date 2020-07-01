package com.thd.springboottest.mybatisplus.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.thd.springboot.framework.db.mapper.BasicMapper;
import com.thd.springboot.framework.db.service.BasicServiceImpl;
import ${coding.entityPackageName}.${table.nameBigCamel}Entity;
import ${coding.mapperPackageName}.${table.nameBigCamel}Mapper;
import ${coding.servicePackageName}.${table.nameBigCamel}Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.core.metadata.IPage;
import java.util.List;
import java.util.Map;

@Service
@Transactional
public class ${table.nameBigCamel}ServiceImpl extends BasicServiceImpl<${table.nameBigCamel}Entity> implements ${table.nameBigCamel}Service {
    @Autowired
    private ${table.nameBigCamel}Mapper ${table.nameCamel}Mapper;

    @Override
    public BasicMapper<${table.nameBigCamel}Entity> basicMapper() {
        return ${table.nameCamel}Mapper;
    }

    public List queryAll${table.nameBigCamel}(){
        return ${table.nameCamel}Mapper.selectList(null);
    };

    public ${table.nameBigCamel}Entity query${table.nameBigCamel}ById(${table.pkColumn.dataType} ${table.pkColumn.nameCamel}){
        QueryWrapper<${table.nameBigCamel}Entity> qw = new QueryWrapper<${table.nameBigCamel}Entity>();
        qw.eq("${table.pkColumn.name}",${table.pkColumn.nameCamel});
        return ${table.nameCamel}Mapper.selectOne(qw);
    };


    public List<${table.nameBigCamel}Entity> query${table.nameBigCamel}Eq(${table.nameBigCamel}Entity entity){
        return ${table.nameCamel}Mapper.queryEq(entity);
    }

    public List<${table.nameBigCamel}Entity> query${table.nameBigCamel}Like(${table.nameBigCamel}Entity entity){
        return ${table.nameCamel}Mapper.queryLike(entity);
    }



    public List<${table.nameBigCamel}Entity> query${table.nameBigCamel}(QueryWrapper<${table.nameBigCamel}Entity> wrapper){
        return ${table.nameCamel}Mapper.selectList(wrapper);
    }


    public IPage<${table.nameBigCamel}Entity> query${table.nameBigCamel}ByPage(QueryWrapper<${table.nameBigCamel}Entity> wrapper, Page page){
        return ${table.nameCamel}Mapper.selectPage(page,wrapper);
    }


    public Map<${table.pkColumn.dataType},${table.nameBigCamel}Entity> queryAllToMapKey(){
        return ${table.nameCamel}Mapper.queryAllToMapKey();
    }

}
