<#assign get="${" />


####################### 路由 ##########################
将下面代码粘贴到routerUtils.js中的 RouterDetailMap 对象中的随意一个属性中


=========================================================
{
  path: '/${table.nameCamel}/${table.nameCamel}List',
  name: '${table.nameCamel}',
  hidden: true,
  component: () => import('@/views/${table.nameCamel}/${table.nameBigCamel}List'),
  meta: {
    title: '${table.nameCamel}'
  }
},
{
  path: '/${table.nameCamel}/${table.nameCamel}Form',
  name: '${table.nameCamel}',
  hidden: true,
  props: (route) => ({
    ${table.pkColumn.name}  : route.query.${table.pkColumn.name},
  }),
  component: () => import('@/views/${table.nameCamel}/${table.nameBigCamel}Form'),
  meta: {
    title: 'create ${table.nameCamel}'
  }
}
=========================================================
访问地址：http://localhost:8001/#/cgTest/cgTestList
'${table.nameCamel}List': () => import('@/views/${table.nameCamel}/${table.nameBigCamel}List')




