package com.thd.springboot.framework.example.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.github.pagehelper.PageInfo;
import com.thd.springboot.framework.example.entity.CgExampleEntity;
import org.springframework.stereotype.Service;
import com.thd.springboot.framework.db.service.BasicService;
import com.baomidou.mybatisplus.core.metadata.IPage;
import java.util.List;
@Service
public interface CgExampleService  extends BasicService<CgExampleEntity>{
    public List queryAllCgExample();
    public CgExampleEntity queryCgExampleById(String id);
    public List<CgExampleEntity> queryCgExample(QueryWrapper<CgExampleEntity> wrapper);
    public List<CgExampleEntity> queryCgExampleEq(CgExampleEntity entity);
    public List<CgExampleEntity> queryCgExampleLike(CgExampleEntity entity);
    public IPage<CgExampleEntity> queryCgExampleByPage(QueryWrapper<CgExampleEntity> wrapper, Page page);
}
