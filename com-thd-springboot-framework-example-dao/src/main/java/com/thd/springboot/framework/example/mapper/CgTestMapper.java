package com.thd.springboot.framework.example.mapper;
import com.thd.springboot.framework.db.mapper.BasicMapper;
import org.springframework.stereotype.Repository;
import org.apache.ibatis.annotations.MapKey;
import com.thd.springboot.framework.example.entity.CgTestEntity;
import java.util.Map;

@Repository
public interface CgTestMapper extends BasicMapper<CgTestEntity> {

    // 返回map, key为指定属性，value为实体类结果集
    @MapKey("id")  // 指定key属性取哪列
    public Map<String,CgTestEntity> queryAllToMapKey();

}
