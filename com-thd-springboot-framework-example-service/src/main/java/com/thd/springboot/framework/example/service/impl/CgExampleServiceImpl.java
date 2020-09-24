package com.thd.springboot.framework.example.service.impl;

import com.github.pagehelper.Page;
import com.thd.springboot.framework.db.mapper.BasicMapper;
import com.thd.springboot.framework.db.service.BasicServiceImpl;
import com.thd.springboot.framework.example.entity.CgExampleEntity;
import com.thd.springboot.framework.example.mapper.CgExampleMapper;
import com.thd.springboot.framework.example.service.CgExampleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;
import java.util.Map;

@Service
@Transactional
public class CgExampleServiceImpl extends BasicServiceImpl<CgExampleEntity> implements CgExampleService {
    @Autowired
    private CgExampleMapper cgExampleMapper;

    @Override
    public BasicMapper<CgExampleEntity> basicMapper() {
        return cgExampleMapper;
    }

    public List queryAllCgExample(){
        CgExampleEntity queryCondition = new CgExampleEntity();
        return cgExampleMapper.queryEq(null);
    };

    public CgExampleEntity queryCgExampleById(String id){
        return cgExampleMapper.queryById(id);
    };


    public List<CgExampleEntity> queryCgExampleEq(CgExampleEntity entity){
        return cgExampleMapper.queryEq(entity);
    }

    public List<CgExampleEntity> queryCgExampleLike(CgExampleEntity entity){
        return cgExampleMapper.queryLike(entity);
    }

    public Map<String,CgExampleEntity> queryAllToMapKey(){
        return cgExampleMapper.queryAllToMapKey();
    }

}
