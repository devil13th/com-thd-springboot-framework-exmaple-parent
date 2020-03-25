package com.thd.springboot.framework.example.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.thd.springboot.framework.db.mapper.BasicMapper;
import com.thd.springboot.framework.db.service.BasicServiceImpl;
import com.thd.springboot.framework.example.entity.CgExampleEntity;
import com.thd.springboot.framework.example.mapper.CgExampleMapper;
import com.thd.springboot.framework.example.service.CgExampleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class CgExampleServiceImpl extends BasicServiceImpl<CgExampleEntity> implements CgExampleService {
    @Autowired
    private CgExampleMapper cgExampleMapper;

    @Override
    public BasicMapper<CgExampleEntity> basicMapper() {
        return cgExampleMapper;
    }

    public List queryAll(){
        return cgExampleMapper.selectList(null);
    };

    public CgExampleEntity queryCgExample(String id){
        QueryWrapper<CgExampleEntity> qw = new QueryWrapper<CgExampleEntity>();
        qw.eq("id",id);
        return cgExampleMapper.selectOne(qw);
    };

    public List<CgExampleEntity> queryCgExample(QueryWrapper<CgExampleEntity> wrapper){
        return cgExampleMapper.selectList(wrapper);
    }

    public List<CgExampleEntity> queryByName (String name){
        CgExampleEntity entity = new CgExampleEntity();
        entity.setName(name);
        List<CgExampleEntity> l = this.cgExampleMapper.queryLike(entity);
        return l;
    }




}
