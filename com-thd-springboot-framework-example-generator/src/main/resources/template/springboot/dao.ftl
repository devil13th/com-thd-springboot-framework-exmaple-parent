package ${coding.basicPackageName}.${coding.mapperPackageName};
import com.thd.springboot.framework.db.mapper.BasicMapper;
import org.springframework.stereotype.Repository;
import org.apache.ibatis.annotations.MapKey;
import ${coding.basicPackageName}.${coding.entityPackageName}.${table.nameBigCamel}Entity;
import java.util.Map;
import org.apache.ibatis.annotations.Mapper;

@Repository
@Mapper
public interface ${table.nameBigCamel}Mapper extends BasicMapper<${table.nameBigCamel}Entity> {

    // 返回map, key为指定属性，value为实体类结果集
    @MapKey("id")  // 指定key属性取哪列
    public Map<String,${table.nameBigCamel}Entity> queryAllToMapKey();

}
