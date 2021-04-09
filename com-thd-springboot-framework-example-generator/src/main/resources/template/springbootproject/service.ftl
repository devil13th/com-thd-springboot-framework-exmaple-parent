package ${coding.basicPackageName}.${coding.servicePackageName};

import org.springframework.stereotype.Service;
import com.thd.springboot.framework.db.service.BasicService;
import ${coding.basicPackageName}.${coding.entityPackageName}.${table.nameBigCamel}Entity;
import java.util.List;
import java.util.Map;

public interface ${table.nameBigCamel}Service extends BasicService<${table.nameBigCamel}Entity> {

    // 批量插入
    public void insertBatch(List<${table.nameBigCamel}Entity> list);
}
