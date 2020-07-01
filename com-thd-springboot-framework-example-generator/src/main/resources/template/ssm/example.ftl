<#assign get="${" />
===========  表信息  ==========
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
${get}table.pkColumn.isPk?string("true","false")} ${table.pkColumn.isPk?string("true","false")}
${get}table.pkColumn.isNullAble?c} ${table.pkColumn.isNullAble?c}

===========  非主键字段信息  ==========
<#list table.normalColumns as col>
${get}col.name} ${col.name}
${get}col.nameCamel} ${col.nameCamel}
${get}col.nameBigCamel} ${col.nameBigCamel}
${get}col.comment} ${col.comment}
${get}col.dataType} ${col.dataType}
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