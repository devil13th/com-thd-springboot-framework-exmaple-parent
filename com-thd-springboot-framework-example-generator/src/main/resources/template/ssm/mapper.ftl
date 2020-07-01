<#assign get="#{" />
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper
		PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
		"http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="${coding.mapperPackageName}.${table.nameBigCamel}Mapper">
	<!-- Result Map -->
	<resultMap id="ResultMap" type="${coding.entityPackageName}.${table.nameBigCamel}Entity">
		<result column="${table.pkColumn.name}" property="${table.pkColumn.nameCamel}" />
		<#list table.normalColumns as col>
		<result column="${col.name}" property="${col.nameCamel}" />
		</#list>
	</resultMap>


	<sql id="column_list">
	    <#list table.allColumns as col>
	    ${table.name}.`${col.name}`<#if col_has_next>,</#if> <!-- ${col_index} ${col.comment} -->
        </#list>
	</sql>

	<sql id="where_eq">
		where is_deleted = 0
        <if test="${table.pkColumn.name} != null ">
            and ${table.name}.`${table.pkColumn.name}` = ${get}${table.pkColumn.nameCamel}}
        </if>
    <#list table.normalColumns as col>
        <#if col.name!="is_deleted" &&
            col.name!="create_by" &&
            col.name!="modify_by" &&
            col.name!="create_time" &&
            col.name!="modify_time"
        >
        <#if col.dataType=="java.lang.String">
        <if test="${col.nameCamel} != null and ${col.nameCamel} != '' ">
            and ${table.name}.`${col.name}` = ${get}${col.nameCamel}}
        </if>
        <#elseif col.dataType=="java.util.Date">
        <if test="${col.nameCamel} != null ">
            and ${table.name}.`${col.name}` = ${get}${col.nameCamel}}
        </if>
        <#else>
        <if test="${col.nameCamel} != null ">
            and ${table.name}.`${col.name}` = ${get}${col.nameCamel}}
        </if>
        </#if>
        </#if>
    </#list>
	</sql>

    <sql id="where_like">
        where is_deleted = 0
        <if test="${table.pkColumn.name} != null ">
            and ${table.name}.`${table.pkColumn.name}` like ${get}${table.pkColumn.nameCamel}}
        </if>
    <#list table.normalColumns as col>
        <#if col.name!="is_deleted" &&
            col.name!="create_by" &&
            col.name!="modify_by" &&
            col.name!="create_time" &&
            col.name!="modify_time"
        >
        <#if col.dataType=="java.lang.String">
        <if test="${col.nameCamel} != null and ${col.nameCamel} != '' ">
            and ${table.name}.`${col.name}` like CONCAT('%',${get}${col.nameCamel}},'%')
        </if>
        <#elseif col.dataType=="java.util.Date">
        <if test="${col.nameCamel} != null ">
            and ${table.name}.`${col.name}` = ${get}${col.nameCamel}}
        </if>
        <#else>
        <if test="${col.nameCamel} != null ">
            and ${table.name}.`${col.name}` = ${get}${col.nameCamel}}
        </if>
        </#if>
        </#if>
    </#list>
    </sql>

    <insert id="add" parameterType="${coding.entityPackageName}.${table.nameBigCamel}Entity">
        insert into ${table.name}(
            `${table.pkColumn.name}`,
        <#list table.normalColumns as col>
            `${col.name}`<#if col_has_next>,</#if>
        </#list>
        )
        values(
            ${get}${table.pkColumn.nameCamel}},
        <#list table.normalColumns as col>
            ${get}${col.nameCamel}}<#if col_has_next>,</#if>
        </#list>
        )
    </insert>

    <delete id="physicsDelete" parameterType="${table.pkColumn.dataType}">
        delete from ${table.name} where `${table.pkColumn.name}` = ${get}${table.pkColumn.nameCamel}}
    </delete>

    <update id="logicDelete" parameterType="${table.pkColumn.dataType}">
        update ${table.name} set is_deleted=1 where `${table.pkColumn.name}` = ${get}${table.pkColumn.nameCamel}}
    </update>


	<update id="update" parameterType="${coding.entityPackageName}.${table.nameBigCamel}Entity">
		update ${table.name} set
	    <trim  suffixOverrides="," >
	        <if test="${table.pkColumn.nameCamel} != null ">
	            `${table.pkColumn.name}`=${get}${table.pkColumn.nameCamel}},
	        </if>
	        <#list table.normalColumns as col>
            <if test="${col.nameCamel} != null ">
                `${col.name}`=${get}${col.nameCamel}},
            </if>
            </#list>
	    </trim>
	    where `${table.pkColumn.name}`=${get}${table.pkColumn.nameCamel}}
	</update>

    <select id="queryEq" resultMap="ResultMap" parameterType="${coding.entityPackageName}.${table.nameBigCamel}Entity">
        select
        <include refid="column_list" />
        from ${table.name}
        <include refid="where_eq" />
         <!--
        <if test="orderBy != null and orderBy != ''">
         order by ${get}orderBy}
        </if>
        -->
    </select>

    <select id="queryLike" resultMap="ResultMap" parameterType="${coding.entityPackageName}.${table.nameBigCamel}Entity">
        select
        <include refid="column_list" />
        from ${table.name}
        <include refid="where_like" />
        <!--
        <if test="orderBy != null and orderBy != ''">
         order by  ${get}orderBy}
        </if>
        -->
    </select>


	<delete id="delete" parameterType="${coding.entityPackageName}.${table.nameBigCamel}Entity">
		delete from  ${table.name} where `${table.pkColumn.name}` = ${get}${table.pkColumn.nameCamel}}
	</delete>

	<update id="isDelete" parameterType="${coding.entityPackageName}.${table.nameBigCamel}Entity">
		update  ${table.name} set is_deleted = 1 where `${table.pkColumn.name}` = ${get}${table.pkColumn.nameCamel}}
	</update>

	<select id="queryById" resultMap="ResultMap" parameterType="${coding.entityPackageName}.${table.nameBigCamel}Entity">
		select <include refid="column_list" /> from ${table.name} where is_deleted=0 and `${table.pkColumn.name}` = ${get}${table.pkColumn.nameCamel}}
	</select>


	<select id="queryAllToMapKey" resultType="${coding.entityPackageName}.${table.nameBigCamel}Entity">
        select
        <include refid="column_list" />
        from
        ${table.name}
        <include refid="where_eq" />
    </select>

    <insert id="insertBatch" >
            insert into ${table.name}
            (
                <#list table.allColumns as col>
               ${col.name}<#if col_has_next>,</#if>
                </#list>
            )
            values
            <foreach collection="list" item="r" index="index" separator=",">
                (
                    <#list table.allColumns as col>
                    ${get}r.${col.nameCamel}}<#if col_has_next>,</#if>
                    </#list>
                )
            </foreach>
        </insert>

</mapper>
