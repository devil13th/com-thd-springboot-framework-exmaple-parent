package com.lenovo.dqm.lenovo.service;

import com.lenovo.gsc.tech.framework.base.service.BaseService;
import ${coding.entityPackageName}.${table.nameBigCamel}Entity;
import java.util.List;

public interface ${table.nameBigCamel}Service extends BaseService<${table.nameBigCamel}Entity> {

     // 批量插入
    public void insertBatch(List<${table.nameBigCamel}Entity> list);
}
