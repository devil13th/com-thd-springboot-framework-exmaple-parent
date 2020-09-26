package com.thd.springboot.framework.example.service.impl;



import com.thd.springboot.framework.db.service.BasicServiceImpl;
import com.thd.springboot.framework.example.entity.CgTestEntity;
import com.thd.springboot.framework.example.mapper.CgTestMapper;
import com.thd.springboot.framework.example.service.CgTestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;

@Service("cgTestService")
@Transactional
public class CgTestServiceImpl extends BasicServiceImpl<CgTestEntity> implements CgTestService {

	@Autowired
    private CgTestMapper cgTestMapper;

	@Override
	public CgTestMapper getMapper() {
		return cgTestMapper;
	}

	@Override
    public void insertBatch(List<CgTestEntity> list){
        cgTestMapper.insertBatch(list);
    }

}
