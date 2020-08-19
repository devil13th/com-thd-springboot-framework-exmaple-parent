<#assign get="${" />
<template>
  <a-spin :spinning="loading" :tip="loadingMsg">
    <div class="spin-content">
      <a-card :body-style="{padding: '24px 32px'}" :bordered="false">
        ID:[{{ id }}]
        <a-form class="ant-advanced-search-form" :form="form" layout="inline">
          <a-row :gutter="24">

            <a-col :span="queryColSpan">
              <a-form-item
                label="${table.pkColumn.nameCamel}"
                :label-col="labelCol"
                :wrapper-col="wrapperCol"
                :colon="colon"
              >
                <a-input v-decorator="['${table.pkColumn.nameCamel}', { rules: [] }]"></a-input>
              </a-form-item>
            </a-col>



            <#list table.normalColumns as col>
			    <#if  col.name!="is_deleted" &&
			        col.name!="create_by" &&
			        col.name!="modify_by" &&
			        col.name!="create_time" &&
			        col.name!="modify_time"
			    >
			   
			    <#if col.dataType=="Date" >
  			    <a-col :span="queryColSpan">
              <a-form-item
                label="${col.nameCamel}"
                :label-col="labelCol"
                :wrapper-col="wrapperCol"
                :colon="colon"
              >
                <a-date-picker v-decorator="['${col.nameCamel}', { rules: [] }]" />
              </a-form-item>
            </a-col>
			    <#elseif col.dataType=="String" >
            <a-col :span="queryColSpan">
              <a-form-item
                label="${col.nameCamel}"
                :label-col="labelCol"
                :wrapper-col="wrapperCol"
                :colon="colon"
              >
                <a-input v-decorator="['${col.nameCamel}', { rules: [<#if col.dbDataType=="varchar">{max:${col.len}}</#if>] }]"></a-input>
              </a-form-item>
            </a-col>
			    <#elseif col.dataType=="Integer" || col.dataType=="Float" || col.dataType=="Double" >
            <a-col :span="queryColSpan">
              <a-form-item
                label="${col.nameCamel}"
                :label-col="labelCol"
                :wrapper-col="wrapperCol"
                :colon="colon"
              >
                <a-input-number :max="9999999" :min="0" v-decorator="['${col.nameCamel}', { rules: [] }]"></a-input-number>
              </a-form-item>
            </a-col>
          <#else> 
            <a-col :span="queryColSpan">
              <a-form-item
                label="${col.nameCamel}"
                :label-col="labelCol"
                :wrapper-col="wrapperCol"
                :colon="colon"
              >
                <a-input v-decorator="['${col.nameCamel}', { rules: [<#if col.dbDataType=="varchar">{max:${col.len}}</#if>] }]"></a-input>
              </a-form-item>
            </a-col>
			    </#if> 
			  
			    </#if> 
			</#list>



            <a-col :span="8">
              <a-button type="primary" icon="Save" @click="save${table.nameBigCamel}">Save</a-button>
              <a-button type="primary" icon="Save" @click="goBack">Cancel</a-button>
            </a-col>
          </a-row>
        </a-form>

      </a-card>
    </div>
  </a-spin>
</template>
<script>
import { ${table.nameCamel}Api } from '@/api/${table.nameCamel}Api'
import { message } from 'ant-design-vue'

import _m from '@/utils/momentAttrUtil'
import _ from 'lodash'
export default {
  props: {
    ${table.pkColumn.nameCamel}: {
      type: String,
      default: () => {
        return null
      }
    }
  },
  data () {
    return {
      // loading 的文字
      loadingMsg: 'Please Wait',
      // 是否loading
      loading: false,
      // FORM是否带有冒号
      colon: false,
      // 每个输入项(标题+组件)的宽度(总计24)
      queryColSpan: 8,
      // 每个输入项标题的宽度(总计24)
      labelCol: { span: 8 },
      // 每个输入项组件的宽度(总计24)
      wrapperCol: { span: 16 },
      // 尺寸
      size: 'small',

      form: this.$form.createForm(this),
      // 主键 - 控制保存是新增还是更新 有值则更新否则新增
      id: ''
    }
  },
  computed: {

  },

  mounted: function () {
    this.pageInit()
  },
  methods: {
    pageInit () {
      if (this.${table.pkColumn.nameCamel}) {
        this.id = this.${table.pkColumn.nameCamel}
        if (this.${table.pkColumn.nameCamel}) { // 加载数据
          this.load${table.nameBigCamel}()
        }
      }
    },
    // 加载数据
    load${table.nameBigCamel} () {
      this.loading = true
      const _this = this
      ${table.nameCamel}Api.find${table.nameBigCamel}ById(this.id).then(function (r) {
        _this.loading = false
        if (r.code === '0') {

          const dateAttrArray = [];

          <#list table.normalColumns as col>
		    <#if  col.dbDataType=="date">
		   		dateAttrArray.push("${col.nameCamel}");
		    </#if> 
		  </#list>
          if(dateAttrArray.length > 0){
          	_m.autoStringToMomentObj(r.result, dateAttrArray)
          }
          
          _this.form.setFieldsValue(r.result)
        } else {
          message.error(r.msg)
        }
      })
    },
    // 保存 / 更新
    save${table.nameBigCamel} () {
      const ${table.nameCamel}ValueObject = this.form.getFieldsValue()

      // 深度复制，为了避免改变${table.nameCamel}Obj的属性(moment转字符串)后 表单会报错
      const ${table.nameCamel}Obj = _.cloneDeep(${table.nameCamel}ValueObject)
      // 处理日期类型的对象
      _m.momentAttrToDateStr(${table.nameCamel}Obj)

      console.log(${table.nameCamel}Obj)
      // 打开loading遮罩
      this.loading = true
      const _this = this
      if (${table.nameCamel}Obj.${table.pkColumn.nameCamel}) { // 更新
        ${table.nameCamel}Api.update${table.nameBigCamel}(${table.nameCamel}Obj).then(function (r) {
          _this.loading = false
          if (r.code === '0') {
            message.success('SAVE SUCCESS')
          } else {
            message.error(r.msg)
          }
        }).catch(function (e) {
          _this.loading = false
          message.error(e)
        })
      } else { // 保存
        ${table.nameCamel}Api.add${table.nameBigCamel}(${table.nameCamel}Obj).then(function (r) {
          _this.loading = false
          if (r.code === '0') {
            _this.id = r.result.${table.pkColumn.nameCamel}
            _this.form.setFieldsValue({ ${table.pkColumn.nameCamel}: r.result.${table.pkColumn.nameCamel} })
            message.success('SAVE SUCCESS')
          } else {
            message.error(r.msg)
          }
        }).catch(function (e) {
          _this.loading = false
          message.error(e)
        })
      }
    },
    goBack () {
      this.$router.back()
    }
  }
}
</script>
<style scoped>
.ant-form-item {
  margin-bottom: 0px;
}

</style>
