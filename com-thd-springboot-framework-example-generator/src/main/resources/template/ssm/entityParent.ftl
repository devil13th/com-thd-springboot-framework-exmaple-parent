package ${coding.entityPackageName};

import lombok.Data;

import java.util.Date;
import java.math.BigDecimal;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.lenovo.gsc.tech.framework.base.entity.BaseEntity;

@Data
public class  ${table.nameBigCamel}EntityParent extends BaseEntity {
    <#if table.pkColumn.name!="id">
    // ${table.pkColumn.comment}
    private ${table.pkColumn.dataType} ${table.pkColumn.nameCamel};
    </#if>
    <#list table.normalColumns as col>
    <#if col.name!="is_deleted" &&
        col.name!="create_by" &&
        col.name!="modify_by" &&
        col.name!="create_time" &&
        col.name!="modify_time"
    >
    // ${col.comment}
    <#if col.dbDataType=="date">
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    </#if>
    private ${col.dataType} ${col.nameCamel};
    </#if>
    </#list>
}
