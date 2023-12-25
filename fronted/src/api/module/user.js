import request from '../request'

/** 接口 */
const Api = {
  save: '/api/sys/user/save',
  page: '/api/sys/user/page',
  list: '/api/sys/user/list',
  give: '/api/sys/user/give',
  edit: '/api/sys/user/edit',
  editPassword: '/api/sys/user/password/edit',
  resetPassword: '/api/sys/user/password/reset',
  menu: '/api/sys/user/menu',
  power: '/api/sys/user/power',
  remove: '/api/sys/user/remove',
  removeBatch: '/api/sys/user/removeBatch',
  role: '/api/sys/user/role',
  login: '/api/login',
  logout: '/api/logout',
  profile: '/api/sys/user/profile',
  syncWxUser: '/api/sys/user/syncWxUser',


}

/** 登录 */
export const syncWxUser = data => {
  return request.request({
    url: Api.syncWxUser,
    params: data,
    method: 'get'
  })
}

/** 登录 */
export const login = data => {
  return request.request({
    url: Api.login,
    params: data,
    method: 'POST'
  })
}

/** 注销 */
export const logout = data => {
  return request.request({
    url: Api.logout,
    data: data,
    method: 'GET'
  })
}

/** 修改密码 */
export const editPassword = data => {
  return request.request({
    url: Api.editPassword,
    data: data,
    method: 'PUT'
  })
}

/** 重置密码 */
export const resetPassword = data => {
  return request.request({
    url: Api.resetPassword,
    params: data,
    method: 'PUT'
  })
}

/** 个人信息 */
export const profile = data => {
  return request.request({
    url: Api.profile,
    data: data,
    method: 'GET'
  })
}

/** 用户菜单 */
export const menu = data => {
  return request.request({
    url: Api.menu,
    params: data,
    method: 'GET'
  })
}

/** 用户角色 */
export const role = data => {
  return request.request({
    url: Api.role,
    params: data,
    method: 'GET'
  })
}

/** 用户权限 */
export const power = data => {
  return request.request({
    url: Api.power,
    params: data,
    method: 'GET'
  })
}

/** 用户列表 */
export const page = data => {
  return request.request({
    url: Api.page,
    params: data,
    method: 'GET'
  })
}

/** 用户列表 */
export const list = data => {
  return request.request({
    url: Api.list,
    params: data,
    method: 'GET'
  })
}

/** 用户新增 */
export const save = data => {
  return request.request({
    url: Api.save,
    data: data,
    method: 'POST'
  })
}

/** 新增用户 */
export const give = data => {
  return request.request({
    url: Api.give,
    data: data,
    method: 'POST'
  })
}

/** 修改用户 */
export const edit = data => {
  return request.request({
    url: Api.edit,
    data: data,
    method: 'PUT'
  })
}

/** 用户删除 */
export const remove = data => {
  return request.request({
    url: Api.remove,
    params: data,
    method: 'DELETE'
  })
}

/** 批量删除 */
export const removeBatch = data => {
  return request.request({
    url: Api.removeBatch,
    params: data,
    method: 'DELETE'
  })
}