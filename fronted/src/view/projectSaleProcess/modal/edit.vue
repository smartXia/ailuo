<template>
  <a-modal
    :visible="visible"
    title="新增销售报价流程"
    cancelText="取消"
    okText="提交"
    @ok="submit"
    @cancel="cancel"
  >
    <a-form
       ref="formRef"
      :model="formState"
      :rules="formRules"
      :label-col="labelCol"
      :wrapper-col="wrapperCol"
    >
                                            <a-form-item label="id" name="id">
             <a-input v-model:value ="formState.id" />
          </a-form-item>
                                                                                                           <a-form-item label="名称" name="name">
             <a-input v-model:value ="formState.name" />
          </a-form-item>
                                                                                                           <a-form-item label="单位联系方式" name="phone">
             <a-input v-model:value ="formState.phone" />
          </a-form-item>
                                                                                                           <a-form-item label="类型" name="type">
             <a-input v-model:value ="formState.type" />
          </a-form-item>
                                                                                                           <a-form-item label="描述" name="desc">
             <a-input v-model:value ="formState.desc" />
          </a-form-item>
                                                                                                           <a-form-item label="单位" name="company">
             <a-input v-model:value ="formState.company" />
          </a-form-item>
                                                                                                           <a-form-item label="状态1:未开始 2：处理中 3：技术审核中 4：报价终审中 5：审核完成 6：审核通过 -1：审核不通过" name="status">
             <a-input v-model:value ="formState.status" />
          </a-form-item>
                                                                                                           <a-form-item label="图标" name="img">
             <a-input v-model:value ="formState.img" />
          </a-form-item>
                                                                                                           <a-form-item label="销售经理" name="salesManager">
             <a-input v-model:value ="formState.salesManager" />
          </a-form-item>
                                                                                                           <a-form-item label="阀门参数" name="valveDetail">
             <a-input v-model:value ="formState.valveDetail" />
          </a-form-item>
                                                                                                           <a-form-item label="产品规格书" name="specificationDetail">
             <a-input v-model:value ="formState.specificationDetail" />
          </a-form-item>
                                                                                                           <a-form-item label="其他技术文件" name="otherFile">
             <a-input v-model:value ="formState.otherFile" />
          </a-form-item>
                                                                                                           <a-form-item label="扭矩/推力" name="torqueThrust">
             <a-input v-model:value ="formState.torqueThrust" />
          </a-form-item>
                                                                                                           <a-form-item label="其他技术需求" name="otherTechnicalRequirements">
             <a-input v-model:value ="formState.otherTechnicalRequirements" />
          </a-form-item>
                                                                                                           <a-form-item label="执行机构形式" name="mechanismForm">
             <a-input v-model:value ="formState.mechanismForm" />
          </a-form-item>
                                                                                                           <a-form-item label="选型型号" name="typeSelection">
             <a-input v-model:value ="formState.typeSelection" />
          </a-form-item>
                                                                                                           <a-form-item label="货币" name="currency">
             <a-input v-model:value ="formState.currency" />
          </a-form-item>
                                                                                                           <a-form-item label="报价开始时间" name="quotationBegin">
             <a-input v-model:value ="formState.quotationBegin" />
          </a-form-item>
                                                                                                           <a-form-item label="报价交期" name="quotationEnd">
             <a-input v-model:value ="formState.quotationEnd" />
          </a-form-item>
                                                                                                           <a-form-item label="质保" name="qualityTime">
             <a-input v-model:value ="formState.qualityTime" />
          </a-form-item>
                                                                                                           <a-form-item label="出口项目" name="exportItem">
             <a-input v-model:value ="formState.exportItem" />
          </a-form-item>
                                                                                                           <a-form-item label="贸易方式" name="modeTrade">
             <a-input v-model:value ="formState.modeTrade" />
          </a-form-item>
                                                                                                           <a-form-item label="关联评审" name="relationReview">
             <a-input v-model:value ="formState.relationReview" />
          </a-form-item>
                                                                                                           <a-form-item label="关联报价" name="relationSale">
             <a-input v-model:value ="formState.relationSale" />
          </a-form-item>
                                                                                                           <a-form-item label="支付方式" name="payType">
             <a-input v-model:value ="formState.payType" />
          </a-form-item>
                                                                                                           <a-form-item label="删除表示(0:No,1:Yes)" name="deleted">
             <a-input v-model:value ="formState.deleted" />
          </a-form-item>

    </a-form>
  </a-modal>
</template>
<script>
import { message } from 'ant-design-vue';
import { edit } from "@/api/module/projectSaleProcess";
import { defineComponent, reactive, ref, toRaw, watch } from "vue";
export default defineComponent({
  props: {
    visible: {
      type: Boolean,
    },
    record: {
      type: Object,
    }
  },
  emit: ["close"],
  setup(props, context) {

    const formRef = ref();

    const formState = reactive({});

    watch(props, (props) => {
                            formState.id = props.record.id
                                                                                formState.name = props.record.name
                                                                                formState.phone = props.record.phone
                                                                                formState.type = props.record.type
                                                                                formState.desc = props.record.desc
                                                                                formState.company = props.record.company
                                                                                formState.status = props.record.status
                                                                                formState.img = props.record.img
                                                                                formState.salesManager = props.record.salesManager
                                                                                formState.valveDetail = props.record.valveDetail
                                                                                formState.specificationDetail = props.record.specificationDetail
                                                                                formState.otherFile = props.record.otherFile
                                                                                formState.torqueThrust = props.record.torqueThrust
                                                                                formState.otherTechnicalRequirements = props.record.otherTechnicalRequirements
                                                                                formState.mechanismForm = props.record.mechanismForm
                                                                                formState.typeSelection = props.record.typeSelection
                                                                                formState.currency = props.record.currency
                                                                                formState.quotationBegin = props.record.quotationBegin
                                                                                formState.quotationEnd = props.record.quotationEnd
                                                                                formState.qualityTime = props.record.qualityTime
                                                                                formState.exportItem = props.record.exportItem
                                                                                formState.modeTrade = props.record.modeTrade
                                                                                formState.relationReview = props.record.relationReview
                                                                                formState.relationSale = props.record.relationSale
                                                                                formState.payType = props.record.payType
                                                                                formState.deleted = props.record.deleted
                                                                                })

    const formRules = {
      name: [ { required: true, message: '请输入名称', trigger: 'blur'} ],
      code: [ { required: true, message: '请输入编号', trigger: 'blur'} ]
    };

    const editKey = "add";

    const submit = (e) => {
      message.loading({ content: '提交中...', key: editKey });
      formRef.value
        .validate()
        .then(() => {
          edit(toRaw(formState)).then((response)=>{
              if(response.success){
                message.success({ content: '保存成功', key: editKey, duration: 1 }).then(()=>{
                  cancel();
                });
              }else{
                message.success({ content: '保存失败', key: editKey, duration: 1 }).then(()=>{
                  cancel();
                });
              }
          });
        })
        .catch(error => {
          console.log('error', error);
        });
    };

    const cancel = (e) => {
      formRef.value.resetFields();
      context.emit("close", false);
    };

    return {

      submit,
      cancel,
      formRef,
      formState,
      formRules,

      labelCol: { span: 6 },
      wrapperCol: { span: 18 },
    };
  },
});
</script>
