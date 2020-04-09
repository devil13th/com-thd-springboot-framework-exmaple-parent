package com.thd.springboot.framework.example.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.github.pagehelper.PageInfo;
import com.thd.springboot.framework.db.mapper.BasicMapper;
import com.thd.springboot.framework.db.service.BasicServiceImpl;
import com.thd.springboot.framework.db.utils.PageUtils;
import com.thd.springboot.framework.example.entity.CgExampleEntity;
import com.thd.springboot.framework.example.mapper.CgExampleMapper;
import com.thd.springboot.framework.example.service.CgExampleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.core.metadata.IPage;
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

    public List queryAllCgExample(){
        return cgExampleMapper.selectList(null);
    };

    public CgExampleEntity queryCgExampleById(String id){
        QueryWrapper<CgExampleEntity> qw = new QueryWrapper<CgExampleEntity>();
        qw.eq("id",id);
        return cgExampleMapper.selectOne(qw);
    };

    public List<CgExampleEntity> queryCgExample(QueryWrapper<CgExampleEntity> wrapper){
        return cgExampleMapper.selectList(wrapper);
    }

    public List<CgExampleEntity> queryCgExampleEq(CgExampleEntity entity){
        return cgExampleMapper.queryEq(entity);
    }

    public List<CgExampleEntity> queryCgExampleLike(CgExampleEntity entity){
        return cgExampleMapper.queryLike(entity);
    }



    public IPage<CgExampleEntity> queryCgExampleByPage(QueryWrapper<CgExampleEntity> wrapper, Page page){
        return cgExampleMapper.selectPage(page,wrapper);
    }



}
