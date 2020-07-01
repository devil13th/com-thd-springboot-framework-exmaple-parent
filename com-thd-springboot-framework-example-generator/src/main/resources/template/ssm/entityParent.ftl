package ${coding.entityPackageName};

import lombok.Data;

import java.util.Date;
import com.thd.springboot.framework.db.entity.BasicEntity;
import com.baomidou.mybatisplus.annotation.TableField;

@Data
public class  ${table.nameBigCamel}EntityParent extends BasicEntity<${table.pkColumn.dataType}> {
    // ${table.pkColumn.comment} - PK
    @TableField("${table.pkColumn.name}")
    private ${table.pkColumn.dataType} ${table.pkColumn.nameCamel};
    <#list table.normalColumns as col>
    <#if col.name!="is_deleted" &&
        col.name!="create_by" &&
        col.name!="modify_by" &&
        col.name!="create_time" &&
        col.name!="modify_time"
    >
    // ${col.comment}
    @TableField("${col.name}")
    private ${col.dataType} ${col.nameCamel};
    </#if>
    </#list>
}
