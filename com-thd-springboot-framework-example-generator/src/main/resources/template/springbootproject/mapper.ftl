<#assign get="#{" />
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper
		PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
		"http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="${coding.basicPackageName}.${coding.mapperPackageName}.${table.nameBigCamel}Mapper">
		<!-- Result Map -->
    	<resultMap id="ResultMap" type="${coding.basicPackageName}.${coding.entityPackageName}.${table.nameBigCamel}Entity">
    		<result column="${table.pkColumn.name}" property="${table.pkColumn.nameCamel}" />
    		<#list table.normalColumns as col>
    		<result column="${col.name}" property="${col.nameCamel}" />
    		</#list>
    	</resultMap>

    <!-- 表名 -->
    <sql id="table_name">
        <#if dbType=="pgsql" || dbType="greenplum">
            ${table.schema}.${table.name}
        <#else>
            ${table.name}
        </#if>
    </sql>

	<!-- 所有字段 -->
	<sql id="column_list">
	    <#list table.allColumns as col>
        ${table.name}.`${col.name}`<#if col_has_next>,</#if> <!-- ${col_index} ${col.comment} -->
        </#list>
	</sql>

	<!-- 查询条件 -->
	<sql id="where_eq">
		where is_deleted = 0


		 <#if table.pkColumn.dataType=="java.lang.String" || table.pkColumn.dataType=="String">
         <if test="${table.pkColumn.nameCamel} != null and ${table.pkColumn.nameCamel} != '' ">
             and ${table.name}.`${table.pkColumn.name}` = ${get}${table.pkColumn.nameCamel}}
         </if>
         <#else>
         <if test="${table.pkColumn.nameCamel} != null ">
          and ${table.name}.`${table.pkColumn.name}` = ${get}${table.pkColumn.nameCamel}}
         </if>
         </#if>




        <#list table.normalColumns as col>
            <#if col.name!="is_deleted" &&
                col.name!="create_by" &&
                col.name!="modify_by" &&
                col.name!="create_time" &&
                col.name!="modify_time"
            >
            <#if col.dataType=="java.lang.String" || col.dataType=="String">
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

	<!-- like查询条件 -->
	<sql id="where_like">
		where is_deleted = 0




         <#if table.pkColumn.dataType=="java.lang.String" || table.pkColumn.dataType=="String">
                 <if test="${table.pkColumn.nameCamel} != null and ${table.pkColumn.nameCamel} != '' ">
                     and ${table.name}.`${table.pkColumn.name}` like concat('%',${get}${table.pkColumn.nameCamel}},'%')
                 </if>
                 <#else>
                 <if test="${table.pkColumn.nameCamel} != null ">
                     and ${table.name}.`${table.pkColumn.name}` = ${get}${table.pkColumn.nameCamel}}
                 </if>
                 </#if>




        <#list table.normalColumns as col>
            <#if col.name!="is_deleted" &&
                col.name!="create_by" &&
                col.name!="modify_by" &&
                col.name!="create_time" &&
                col.name!="modify_time"
            >
            <#if col.dataType=="java.lang.String" || col.dataType=="String">
            <if test="${col.nameCamel} != null and ${col.nameCamel} != '' ">
                and ${table.name}.`${col.name}` like concat('%',${get}${col.nameCamel}},'%')
            </if>
            <#elseif col.dataType=="Date">
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

	<!-- 插入记录 -->
	<insert id="insert" parameterType="${coding.basicPackageName}.${coding.entityPackageName}.${table.nameBigCamel}Entity">
	    insert into <include refid="table_name"/> (
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

	<!-- 根据id，修改记录 -->
	<update id="update" parameterType="${coding.basicPackageName}.${coding.entityPackageName}.${table.nameBigCamel}Entity">
		update <include refid="table_name"/> set
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

    <!-- 批量修改记录 -->
    <update id="updateBatch" >
        update <include refid="table_name"/> set
        <trim  suffixOverrides="," >
            <#list table.normalColumns as col>
            <if test="targetBean.${col.nameCamel} != null ">
                `${col.name}`=${get}targetBean.${col.nameCamel}},
            </if>
            </#list>
        </trim>
        where
        is_deleted = 0
        <#list table.normalColumns as col>
        <if test="conditionBean.${col.nameCamel} != null ">
            and `${col.name}`=${get}conditionBean.${col.nameCamel}}
        </if>
        </#list>
    </update>

	<delete id="deletePhysics" parameterType="${table.pkColumn.dataType}">
        delete from <include refid="table_name"/> where `${table.pkColumn.name}` = ${get}${table.pkColumn.nameCamel}}
    </delete>

    <update id="deleteLogic" parameterType="${table.pkColumn.dataType}">
        update <include refid="table_name"/> set is_deleted=1 where `${table.pkColumn.name}` = ${get}${table.pkColumn.nameCamel}}
    </update>

    <update id="deleteLogicByCondition" parameterType="${coding.basicPackageName}.${coding.entityPackageName}.${table.nameBigCamel}Entity">
        update <include refid="table_name"/> set is_deleted=1
        <include refid="where_eq" />
    </update>

    <update id="deleteLogicByIds" parameterType="${table.pkColumn.dataType}">
        update <include refid="table_name"/> set is_deleted=1
        where
        `${table.pkColumn.name}` in (
        <foreach collection="ids" item="r" index="index" separator=",">
            ${get}r}
        </foreach>
        )
    </update>





	<!-- 根据id查询 -->
	<select id="queryById" resultMap="ResultMap" parameterType="${table.pkColumn.dataType}">
		select <include refid="column_list" /> from <include refid="table_name"/> where is_deleted=0 and `${table.pkColumn.name}` = ${get}${table.pkColumn.nameCamel}}
	</select>

    <!-- 根据条件查询唯一一条数据 -->
    <select id="queryByCondition" resultMap="ResultMap" parameterType="${coding.basicPackageName}.${coding.entityPackageName}.${table.nameBigCamel}Entity">
        select
        <include refid="column_list" />
        from
        <include refid="table_name" />
        <include refid="where_eq" />
    </select>

	<!-- 查询列表 -->
	<select id="queryListEq" resultMap="ResultMap"
		parameterType="${coding.basicPackageName}.${coding.entityPackageName}.${table.nameBigCamel}Entity">
		select
        <include refid="column_list" />
        from <include refid="table_name"/>
        <include refid="where_eq" />
         <!--
        <if test="orderBy != null and orderBy != ''">
         order by ${get}orderBy}
        </if>
        -->
	</select>

	<!-- 查询列表 -->
	<select id="queryListLike" resultMap="ResultMap"
		parameterType="${coding.basicPackageName}.${coding.entityPackageName}.${table.nameBigCamel}Entity">
		select
        <include refid="column_list" />
        from <include refid="table_name"/>
        <include refid="where_like" />
        <!--
        <if test="orderBy != null and orderBy != ''">
         order by  ${get}orderBy}
        </if>
        -->
	</select>

    <!-- 查询列表 返回map-->
    <select id="queryAllToMapKey" resultType="${coding.basicPackageName}.${coding.entityPackageName}.${table.nameBigCamel}Entity">
        select
        <include refid="column_list" />
        from
        <include refid="table_name"/>
        <include refid="where_eq" />
    </select>

    <insert id="insertBatch" >
        insert into <include refid="table_name"/>
        (
	    ${table.pkColumn.name},
            <#list table.normalColumns as col>
           ${col.name}<#if col_has_next>,</#if>
            </#list>
        )
        values
        <foreach collection="list" item="r" index="index" separator=",">
            (
		${get}r.${table.pkColumn.nameCamel}},
                <#list table.normalColumns as col>
                ${get}r.${col.nameCamel}}<#if col_has_next>,</#if>
                </#list>
            )
        </foreach>
    </insert>
</mapper>

