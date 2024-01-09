import request from '../request'

const Api = {
    page: '/api/sys/projectTechnicalProcess/page',
    list: '/api/sys/projectTechnicalProcess/list',
    remove: '/api/sys/projectTechnicalProcess/remove',
    removeBatch: '/api/sys/projectTechnicalProcess/removeBatch',
    save: '/api/sys/projectTechnicalProcess/save',
    edit: '/api/sys/projectTechnicalProcess/edit',
}

/** 审批状态流列表 */
export const page = data => {
    return request.request({
        url: Api.page,
        params: data,
        method: 'GET'
    })
}

/** 审批状态流列表 */
export const list = data => {
    return request.request({
        url: Api.list,
        params: data,
        method: 'GET'
    })
}

/** 审批状态流岗位 */
export const save = data => {
    return request.request({
        url: Api.save,
        data: data,
        method: 'POST'
    })
}

/** 审批状态流岗位 */
export const edit = data => {
    return request.request({
        url: Api.edit,
        data: data,
        method: 'PUT'
    })
}

/** 审批状态流岗位 */
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
