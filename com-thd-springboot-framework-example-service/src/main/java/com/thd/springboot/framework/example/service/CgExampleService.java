package com.thd.springboot.framework.example.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.thd.springboot.framework.db.service.BasicService;
import com.thd.springboot.framework.example.entity.CgExampleEntity;
import org.springframework.stereotype.Service;
import java.util.List;
@Service
public interface CgExampleService  extends BasicService<CgExampleEntity> {
    public List queryAll();
    public CgExampleEntity queryCgExample(String id);
    public List<CgExampleEntity> queryCgExample(QueryWrapper<CgExampleEntity> wrapper);
    public List<CgExampleEntity> queryByName (String name);
}
