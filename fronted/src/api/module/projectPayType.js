import request from '../request'

const Api = {
    page: '/api/sys/projectPayType/page',
    list: '/api/sys/projectPayType/list',
    remove: '/api/sys/projectPayType/remove',
    removeBatch: '/api/sys/projectPayType/removeBatch',
    save: '/api/sys/projectPayType/save',
    edit: '/api/sys/projectPayType/edit',
}

/** 付款方式列表 */
export const page = data => {
    return request.request({
        url: Api.page,
        params: data,
        method: 'GET'
    })
}

/** 付款方式列表 */
export const list = data => {
    return request.request({
        url: Api.list,
        params: data,
        method: 'GET'
    })
}

/** 付款方式岗位 */
export const save = data => {
    return request.request({
        url: Api.save,
        data: data,
        method: 'POST'
    })
}

/** 付款方式岗位 */
export const edit = data => {
    return request.request({
        url: Api.edit,
        data: data,
        method: 'PUT'
    })
}

/** 付款方式岗位 */
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
