package com.lenovo.dqm.lenovo.service.Impl;

import com.lenovo.gsc.tech.framework.base.service.impl.BaseServiceImpl;
import ${coding.entityPackageName}.${table.nameBigCamel}Entity;
import ${coding.mapperPackageName}.${table.nameBigCamel}Mapper;
import ${coding.servicePackageName}.${table.nameBigCamel}Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;

@Service("${table.nameCamel}Service")
@Transactional
public class ${table.nameBigCamel}ServiceImpl extends BaseServiceImpl<${table.nameBigCamel}Entity> implements ${table.nameBigCamel}Service {

	@Autowired
    private ${table.nameBigCamel}Mapper ${table.nameCamel}Mapper;

	@Override
	public ${table.nameBigCamel}Mapper baseMapper() {
		return ${table.nameCamel}Mapper;
	}

	@Override
    public void insertBatch(List<${table.nameBigCamel}Entity> list){
        ${table.nameCamel}Mapper.insertBatch(list);
    }

}
