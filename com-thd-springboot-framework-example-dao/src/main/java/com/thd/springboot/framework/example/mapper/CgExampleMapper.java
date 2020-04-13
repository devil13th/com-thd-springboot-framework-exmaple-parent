package com.thd.springboot.framework.example.mapper;
import com.thd.springboot.framework.db.mapper.BasicMapper;
import org.springframework.stereotype.Repository;
import org.apache.ibatis.annotations.MapKey;
import com.thd.springboot.framework.example.entity.CgExampleEntity;
import java.util.Map;

@Repository
public interface CgExampleMapper extends BasicMapper<CgExampleEntity> {

    // 返回map, key为指定属性，value为实体类结果集
    @MapKey("id")  // 指定key属性取哪列
    public Map<String,CgExampleEntity> queryAllToMapKey();

}
