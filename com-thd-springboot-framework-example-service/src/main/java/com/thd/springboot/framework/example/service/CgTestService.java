package com.thd.springboot.framework.example.service;

import com.thd.springboot.framework.example.entity.CgTestEntity;
import org.springframework.stereotype.Service;
import com.thd.springboot.framework.db.service.BasicService;

import java.util.List;
import java.util.Map;

public interface CgTestService extends BasicService<CgTestEntity> {

    // 批量插入
    public void insertBatch(List<CgTestEntity> list);
}
