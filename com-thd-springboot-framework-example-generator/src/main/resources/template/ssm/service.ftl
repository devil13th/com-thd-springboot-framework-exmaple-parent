package com.thd.springboottest.mybatisplus.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import ${coding.entityPackageName}.${table.nameBigCamel}Entity;
import org.springframework.stereotype.Service;
import com.thd.springboot.framework.db.service.BasicService;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import java.util.List;
import java.util.Map;
@Service
public interface ${table.nameBigCamel}Service  extends BasicService<${table.nameBigCamel}Entity>{
    public List queryAll${table.nameBigCamel}();
    public ${table.nameBigCamel}Entity query${table.nameBigCamel}ById(${table.pkColumn.dataType} ${table.pkColumn.nameCamel});
    public List<${table.nameBigCamel}Entity> query${table.nameBigCamel}Eq(${table.nameBigCamel}Entity entity);
    public List<${table.nameBigCamel}Entity> query${table.nameBigCamel}Like(${table.nameBigCamel}Entity entity);
    public List<${table.nameBigCamel}Entity> query${table.nameBigCamel}(QueryWrapper<${table.nameBigCamel}Entity> wrapper);
    public IPage<${table.nameBigCamel}Entity> queryCgExampleByPage(QueryWrapper<${table.nameBigCamel}Entity> wrapper, Page page);
    public Map<${table.pkColumn.dataType},${table.nameBigCamel}Entity> queryAllToMapKey();
}
