<#assign get="${" />
import { ${table.nameCamel}RPC } from '@/utils/request'
// const rootPath = '/ll'
const rootPath = ''

const  ${table.nameCamel}Api = {
  find${table.nameBigCamel}Page (${table.nameCamel}Entity) {
    return ${table.nameCamel}RPC({
      url: `${get}rootPath}/find${table.nameBigCamel}Page`,
      method: 'get',
      params: ${table.nameCamel}Entity
    })
  },
  add${table.nameBigCamel} (${table.nameCamel}Entity) {
    return ${table.nameCamel}RPC({
      url: `${get}rootPath}/add${table.nameBigCamel}`,
      method: 'post',
      data: ${table.nameCamel}Entity
    })
  },
  update${table.nameBigCamel} (${table.nameCamel}Entity) {
    return ${table.nameCamel}RPC({
      url: `${get}rootPath}/update${table.nameBigCamel}`,
      method: 'put',
      data: ${table.nameCamel}Entity
    })
  },
  find${table.nameBigCamel}ById (id) {
    return ${table.nameCamel}RPC({
      url: `${get}rootPath}/find${table.nameBigCamel}ById/${get}id}`,
      method: 'get'
    })
  },
  delete${table.nameBigCamel} (id) {
    return ${table.nameCamel}RPC({
      url: `${get}rootPath}/delete${table.nameBigCamel}/${get}id}`,
      method: 'delete'
    })
  }

}


export { ${table.nameCamel}Api  }