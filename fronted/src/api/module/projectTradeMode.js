import request from '../request'

const Api = {
    page: '/api/sys/projectTradeMode/page',
    list: '/api/sys/projectTradeMode/list',
    remove: '/api/sys/projectTradeMode/remove',
    removeBatch: '/api/sys/projectTradeMode/removeBatch',
    save: '/api/sys/projectTradeMode/save',
    edit: '/api/sys/projectTradeMode/edit',
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
