<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE hibernate-mapping PUBLIC "-//Hibernate/Hibernate Mapping DTD 3.0//EN"
"http://hibernate.sourceforge.net/hibernate-mapping-3.0.dtd">
<!-- 
    Mapping file autogenerated by ThirdteenDevils's CodeGenUtil
-->
<hibernate-mapping>
    <class name="${cfg.pojoPackage}.${cfg.tableCodeForClass}" table="${cfg.tableCode}" >
    <#--  主键字段      -->
    <!-- PK ${cfg.pkColumn.columnName} ${cfg.pkColumn.columnDesc}-->
        <id name="${cfg.pkColumn.columnCodeForProperty}" type="${cfg.pkColumn.columnType}">
            <column name="${cfg.pkColumn.columnCode}"  />
            <generator class="${cfg.generator}" />
        </id>
    <#--  非主键字段      -->
	<#list cfg.columnList as col> 
		<!-- ${col.columnName} ${col.columnDesc} -->
		<property name="${col.columnCodeForProperty}" type="${col.columnType}">
		    <column name="${col.columnCode}" />
		</property>
	</#list>

    </class>
</hibernate-mapping>




