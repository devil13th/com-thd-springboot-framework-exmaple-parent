<#assign get="${" />
import axios from '@/axios';

const context = process.env.REACT_APP_CONTEXT
export default {
  query${table.nameBigCamel}LikeByPage:function(data){
    return axios({
      method: 'get',
      url: `${get}context}/${table.nameCamel}/query${table.nameBigCamel}LikeByPage`,
      params:data
    });
  },
  add${table.nameBigCamel}:function(data){
    return axios({
      method: 'post',
      url: `${get}context}/${table.nameCamel}/add${table.nameBigCamel}`,
      data
    });
  },
  query${table.nameBigCamel}ById:function(id){
    return axios({
      method: 'get',
      url: `${get}context}/${table.nameCamel}/query${table.nameBigCamel}ById/${get}id}`
    });
  },
  update${table.nameBigCamel}:function(data){
    return axios({
      method: 'post',
      url: `${get}context}/${table.nameCamel}/update${table.nameBigCamel}`,
      data
    });
  },
  logicDelete${table.nameBigCamel}:function(id){
    return axios({
      method: 'delete',
      url: `${get}context}/${table.nameCamel}/logicDelete${table.nameBigCamel}/${get}id}`
    });
  },
  deleteLogicBy${table.nameBigCamel}Ids:function(idList){
    return axios({
      method: 'delete',
      url: `${get}context}/${table.nameCamel}/deleteLogicBy${table.nameBigCamel}Ids`,
      data:idList
    });
  }



}