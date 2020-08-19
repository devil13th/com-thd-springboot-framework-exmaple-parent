package ${coding.mapperPackageName};
import com.lenovo.gsc.tech.framework.base.mapper.BaseMapper;
import ${coding.entityPackageName}.${table.nameBigCamel}Entity;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ${table.nameBigCamel}Mapper extends BaseMapper<${table.nameBigCamel}Entity> {
    
    // 批量插入
    public void insertBatch(@Param(value="list") List<${table.nameBigCamel}Entity> list);
}
