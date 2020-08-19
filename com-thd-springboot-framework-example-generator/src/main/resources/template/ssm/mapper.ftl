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

    <!-- 表名 -->
    <sql id="Table_Name">
        ${table.schema}.${table.name}
    </sql>

	<!-- 所有字段 -->
	<sql id="Column_List">
	    <#list table.allColumns as col>
        ${table.name}.`${col.name}`<#if col_has_next>,</#if> <!-- ${col_index} ${col.comment} -->
        </#list>
	</sql>

	<!-- 查询条件 -->
	<sql id="Example_Where_Clause">
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

	<!-- like查询条件 -->
	<sql id="Like_Where_Clause">
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
                and ${table.name}.`${col.name}` like concat('%',${get}${col.nameCamel}},'%')
                
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

	<!-- 插入记录 -->
	<insert id="add" parameterType="Object">
	    insert into <include refid="Table_Name"/> (
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
	<update id="update" parameterType="Object">
		update <include refid="Table_Name"/> set
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


	 <delete id="delete" parameterType="Object">
        delete from <include refid="Table_Name"/> where `${table.pkColumn.name}` = ${get}${table.pkColumn.nameCamel}}
    </delete>

    <update id="isDelete" parameterType="Object">
        update <include refid="Table_Name"/> set is_deleted=1 where `${table.pkColumn.name}` = ${get}${table.pkColumn.nameCamel}}
    </update>



	<!-- 根据id查询 -->
	<select id="findById" resultMap="ResultMap" parameterType="Object">
		select <include refid="Column_List" /> from <include refid="Table_Name"/> where is_deleted=0 and `${table.pkColumn.name}` = ${get}${table.pkColumn.nameCamel}}
	</select>

	<!-- 查询列表 -->
	<select id="findList" resultMap="ResultMap"
		parameterType="Object">
		select
        <include refid="Column_List" />
        from <include refid="Table_Name"/>
        <include refid="Example_Where_Clause" />
         <!--
        <if test="orderBy != null and orderBy != ''">
         order by ${get}orderBy}
        </if>
        -->
	</select>

	<!-- 查询列表 -->
	<select id="findListByLike" resultMap="ResultMap"
		parameterType="Object">
		select
        <include refid="Column_List" />
        from <include refid="Table_Name"/>
        <include refid="Like_Where_Clause" />
        <!--
        <if test="orderBy != null and orderBy != ''">
         order by  ${get}orderBy}
        </if>
        -->
	</select>

    <insert id="insertBatch" >
        insert into <include refid="Table_Name"/>
        (
            <#list table.normalColumns as col>
           ${col.name}<#if col_has_next>,</#if>
            </#list>
        )
        values
        <foreach collection="list" item="r" index="index" separator=",">
            (
                <#list table.normalColumns as col>
                ${get}r.${col.nameCamel}}<#if col_has_next>,</#if>
                </#list>
            )
        </foreach>
    </insert>
</mapper>

