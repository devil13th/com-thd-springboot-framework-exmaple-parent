package com.thd.springboot.framework.example.service;

import com.thd.springboot.framework.example.entity.CgExampleEntity;
import org.springframework.stereotype.Service;
import com.thd.springboot.framework.db.service.BasicService;
import java.util.List;
import java.util.Map;
@Service
public interface CgExampleService  extends BasicService<CgExampleEntity>{
    public List queryAllCgExample();
    public CgExampleEntity queryCgExampleById(String id);
    public List<CgExampleEntity> queryCgExampleEq(CgExampleEntity entity);
    public List<CgExampleEntity> queryCgExampleLike(CgExampleEntity entity);
    public Map<String,CgExampleEntity> queryAllToMapKey();
}
