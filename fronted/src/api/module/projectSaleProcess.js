import request from '../request'

const Api = {
    page: '/api/sys/projectSaleProcess/page',
    list: '/api/sys/projectSaleProcess/list',
    remove: '/api/sys/projectSaleProcess/remove',
    removeBatch: '/api/sys/projectSaleProcess/removeBatch',
    save: '/api/sys/projectSaleProcess/save',
    edit: '/api/sys/projectSaleProcess/edit',
}

/** 销售报价流程列表 */
export const page = data => {
    return request.request({
        url: Api.page,
        params: data,
        method: 'GET'
    })
}

/** 销售报价流程列表 */
export const list = data => {
    return request.request({
        url: Api.list,
        params: data,
        method: 'GET'
    })
}

/** 销售报价流程岗位 */
export const save = data => {
    return request.request({
        url: Api.save,
        data: data,
        method: 'POST'
    })
}

/** 销售报价流程岗位 */
export const edit = data => {
    return request.request({
        url: Api.edit,
        data: data,
        method: 'PUT'
    })
}

/** 销售报价流程岗位 */
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
