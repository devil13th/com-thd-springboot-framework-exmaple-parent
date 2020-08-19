<#assign get="${" />
<template>
  <a-spin :spinning="loading" :tip="loadingMsg">
    <div class="spin-content">
      <a-card :body-style="{padding: '24px 32px'}" :bordered="false">
        <a-form class="ant-advanced-search-form" :form="form" layout="inline">
          <a-row :gutter="24">
            <#list table.normalColumns as col>
              <#if col.name!="is_deleted" &&
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
              <a-button type="primary" icon="search" @click="search${table.nameBigCamel}">Search</a-button>
              <a-divider type="vertical"/>
              <a-button type="default" icon="rollback" @click="${table.nameCamel}Query= {};search${table.nameBigCamel}(true,false)">Reset</a-button>
            </a-col>
          </a-row>
        </a-form>
        <a-divider type="horizontal" style="margin:8px 0px;"></a-divider>
        <div style="margin-bottom:8px; text-align:right;">

          <a-popover title="Columns" placement="topLeft">
            <template slot="content">
              <a-checkbox-group :options="allColumnsArray" v-model="${table.nameCamel}Data.showColumns" />
            </template>
            <a-button icon="profile">
            </a-button>
          </a-popover>
          <a-divider type="vertical"></a-divider>
          <a-tooltip placement="topRight">
            <template slot="title">
              <span>Create</span>
            </template>
            <a-button type="primary" icon="plus" @click="create"></a-button>
          </a-tooltip>
        </div>

        <a-table
          size="small"
          :columns="${table.nameCamel}Columns"
          :data-source="${table.nameCamel}Data.data"
          :row-key="record => record.tid"
          :pagination="${table.nameCamel}Data.pagination"
          @change="handle${table.nameBigCamel}Change"
          :row-selection="{ selectedRowKeys:selectedRowKeys, onChange: onSelectChange }"
        >
          <span slot="operateSlot" slot-scope="text,data">
            <a-button type="primary" icon="search" @click="edit${table.nameBigCamel}(data.${table.pkColumn.nameCamel})">
              Edit
            </a-button>
          </span>
          <span slot="jsonDataSlot" slot-scope="text,data">
            <a-button type="primary" icon="search" @click="edit${table.nameBigCamel}(data.${table.pkColumn.nameCamel})">
              Edit
            </a-button>
            {{ data }}
          </span>


          
        </a-table>
      </a-card>

    </div>
  </a-spin>
</template>
<script>
import { ${table.nameCamel}Api } from '@/api/${table.nameCamel}Api'


import { toPagination, toPage } from '@/utils/util'
import { message } from 'ant-design-vue'

export default {
  data () {
    return {
      loading: false,
      colon: false,
      loadingMsg: 'please waiting',
      labelCol: { span: 8 },
      size: 'small',
      wrapperCol: { span: 16 },
      form: this.$form.createForm(this),
      queryColSpan: 8, // 查询的栅格宽度
      //选择的行id数组
      selectedRowKeys: [],
      // ${table.nameBigCamel}表格数据
      ${table.nameCamel}Data: {

        allColumns: [
        <#list table.normalColumns as col>
              <#if col.name!="is_deleted" &&
                col.name!="create_by" &&
                col.name!="modify_by" &&
                col.name!="create_time" &&
                col.name!="modify_time"
              >{ title: '${col.nameCamel}', dataIndex: '${col.nameCamel}', key: '${col.nameCamel}', sorter: true },</#if>
          </#list>
          { title: 'Operate', dataIndex: 'operate', key: 'operate', scopedSlots: { customRender: 'operateSlot' }},
          { title: 'jsonData', dataIndex: 'jsonData', key: 'jsonData', scopedSlots: { customRender: 'jsonDataSlot' }}
        ], // 所有字段
        showColumns: [

        <#list table.normalColumns as col>
              <#if col.name!="is_deleted" &&
                col.name!="create_by" &&
                col.name!="modify_by" &&
                col.name!="create_time" &&
                col.name!="modify_time"
              >'${col.nameCamel}',</#if>
          </#list>'operate'
         
        ], // 展示字段
        data: [], // 表格数据
        pagination: { pageSize: 10, pageNum: 1, showSizeChanger: true }, // 分页信息
        sort: { sortField: 'tid', sortOrder: 'desc' }// 排序信息
      }

    }
  },
  computed: {
    ${table.nameCamel}Columns () {
      const _this = this
      return this.${table.nameCamel}Data.allColumns.filter(item => {
        return _this.${table.nameCamel}Data.showColumns.indexOf(item.dataIndex) >= 0
      })
    },
    allColumnsArray () {
      return this.${table.nameCamel}Data.allColumns.map(item => {
        return item.dataIndex
      })
    }
  },
  filters: {
    toYYYYMMDD: function (value) {
      return value
    }
  },
  mounted: function () {
    this.pageInit()
  },
  methods: {
   
    create: function () {
      this.$router.push({ path: `/${table.nameCamel}/${table.nameCamel}Form` })
    },
    pageInit () {
      this.search${table.nameBigCamel}(true,false)
    },
    doLoading (msg) {
      if (msg) {
        this.loadingMsg = msg
      } else {
        this.loadingMsg = ' please wait'
      }
      this.loading = true
    },
    unLoading () {
      this.loading = false
    },

    handle${table.nameBigCamel}Change (pagination, filters, sorter) {
      console.log(pagination, sorter)
      this.${table.nameCamel}Data.pagination = toPage(pagination, sorter)

      if (this.${table.nameCamel}Data.pagination.sortField) {
        this.${table.nameCamel}Data.sort = {
          sortField: this.${table.nameCamel}Data.pagination.sortField,
          sortOrder: this.${table.nameCamel}Data.pagination.sortOrder
        }
      }


     
      this.search${table.nameBigCamel}(false,false)
    },
    search${table.nameBigCamel} (clearPage = false, clearSort = false) {
      const _this = this
      this.doLoading()

      if (clearPage) {
        this.llInfoTableData.pagination.pageNum = 1
      }
      if (clearSort) {
        delete this.${table.nameCamel}Data.sort.sortField
        delete this.${table.nameCamel}Data.sort.sortOrder
      }
      const ${table.nameCamel}Query = { ...this.${table.nameCamel}Data.pagination, ...this.${table.nameCamel}Data.sort, ...this.form.getFieldsValue() }

      _m.momentAttrToDateStr(${table.nameCamel}Query)

      ${table.nameCamel}Api.find${table.nameBigCamel}Page(${table.nameCamel}Query).then(function (r) {
        if (r.code !== '0') {
          message.error('err')
          _this.unLoading()
          return
        }
        _this.${table.nameCamel}Data.data = r.result.list
        // _this.pagination = { total: r.result.total, pageSize: r.result.pageSize, page: r.result.pageNum }
        _this.${table.nameCamel}Data.pagination = toPagination(r.result)
        _this.unLoading()
      })
    },
    edit${table.nameBigCamel} (id) {
      this.$router.push(`/${table.nameCamel}/${table.nameCamel}Form?${table.pkColumn.nameCamel}=${get}id}`)
    },
    onSelectChange (selectedRowKeys) {
      console.log('selectedRowKeys changed: ', selectedRowKeys)
      this.selectedRowKeys = selectedRowKeys
    }
  }
}
</script>
<style scoped>
.ant-form-item {
  margin-bottom: 0px;
}

</style>
