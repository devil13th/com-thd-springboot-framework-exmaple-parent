package ${coding.basicPackageName}.${coding.servicePackageName}.impl;

import com.github.pagehelper.Page;
import com.thd.springboot.framework.db.mapper.BasicMapper;
import com.thd.springboot.framework.db.service.BasicServiceImpl;

import ${coding.basicPackageName}.${coding.servicePackageName}.${table.nameBigCamel}Service;
import ${coding.basicPackageName}.${coding.entityPackageName}.${table.nameBigCamel}Entity;
import ${coding.basicPackageName}.${coding.mapperPackageName}.${table.nameBigCamel}Mapper;


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
