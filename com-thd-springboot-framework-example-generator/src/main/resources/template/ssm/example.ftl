<#assign get="${" />
<#assign listStart="<#list" />
<#assign listEnd="</#list>" />
<#assign ifStart="<#if " />
<#assign ifEnd="</#if> " />
===========  表信息  ==========
${get}schema}   ${table.schema}
${get}table.name}   ${table.name}
${get}table.nameCamel} ${table.nameCamel}
${get}table.nameBigCamel} ${table.nameBigCamel}
${get}table.schema} ${table.schema}
${get}table.getter} ${table.getter}
${get}table.setter} ${table.setter}

===========  主键字段信息  ==========
${get}table.pkColumn.name} ${table.pkColumn.name}
${get}table.pkColumn.nameCamel} ${table.pkColumn.nameCamel}
${get}table.pkColumn.nameBigCamel} ${table.pkColumn.nameBigCamel}
${get}table.pkColumn.comment} ${table.pkColumn.comment}
${get}table.pkColumn.dataType} ${table.pkColumn.dataType}
${get}table.pkColumn.dbDataType} ${table.pkColumn.dbDataType}
${get}table.pkColumn.isPk?string("true","false")} ${table.pkColumn.isPk?string("true","false")}
${get}table.pkColumn.isNullAble?c} ${table.pkColumn.isNullAble?c}

===========  非主键字段信息  ==========
<#list table.normalColumns as col>
${get}col.name} ${col.name}
${get}col.nameCamel} ${col.nameCamel}
${get}col.nameBigCamel} ${col.nameBigCamel}
${get}col.len!"空值"} ${col.len!"空值"}
${get}col.comment} ${col.comment}
${get}col.dataType} ${col.dataType}
${get}col.dbDataType} ${col.dbDataType}
${get}col.isNullAble?c} ${col.isNullAble?c}
${get}col.isPk?c} ${col.isPk?c}
<#if col_has_next>------</#if>
</#list>


===========  Coding信息  ==========
${coding.mapperPackageName}
${coding.servicePackageName}
${coding.controllerPackageName}
${coding.entityPackageName}


===========  自定义信息  ==========
name : ${customData.map.name}
version : ${customData.map.version}
a : ${customData.map.a}
b : ${customData.map.b}
c : ${customData.map.c}


=========== 循环字段 及判断 =============

${listStart} table.normalColumns as col>
    ${ifStart} col.name!="is_deleted" &&
        col.name!="create_by" &&
        col.name!="modify_by" &&
        col.name!="create_time" &&
        col.name!="modify_time"
    >
    @TableField("${get}col.name}")
    ${ifStart} col.dbDataType=="date">
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    ${ifEnd}
    private ${get}col.dataType} ${get}col.nameCamel};
    ${ifStart} col_has_next> // end ${ifEnd}
    ${ifEnd}
${listEnd}
--------------------------------------
<#list table.normalColumns as col>
    @TableField("${col.name}")
    <#if  col.dbDataType=="date">
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    </#if>
    private ${col.dataType} ${col.nameCamel};
    <#if  col_has_next> // 还有下次循环 </#if>
</#list>