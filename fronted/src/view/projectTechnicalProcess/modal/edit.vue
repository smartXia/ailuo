<template>
  <a-modal
    :visible="visible"
    title="新增审批状态流"
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
                                                                                                           <a-form-item label="分析结果" name="result">
             <a-input v-model:value ="formState.result" />
          </a-form-item>
                                                                                                           <a-form-item label="选型分析" name="selectionAnalysis">
             <a-input v-model:value ="formState.selectionAnalysis" />
          </a-form-item>
                                                                                                           <a-form-item label="生产分析" name="productionAnalysis">
             <a-input v-model:value ="formState.productionAnalysis" />
          </a-form-item>
                                                                                                           <a-form-item label="附件" name="attach">
             <a-input v-model:value ="formState.attach" />
          </a-form-item>
                                                                                                           <a-form-item label="其他评论" name="commitMsg">
             <a-input v-model:value ="formState.commitMsg" />
          </a-form-item>
                                                                                                           <a-form-item label="关联报价" name="linkSale">
             <a-input v-model:value ="formState.linkSale" />
          </a-form-item>
                                                                                                           <a-form-item label="删除表示(0:No,1:Yes)" name="deleted">
             <a-input v-model:value ="formState.deleted" />
          </a-form-item>

    </a-form>
  </a-modal>
</template>
<script>
import { message } from 'ant-design-vue';
import { edit } from "@/api/module/projectTechnicalProcess";
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
                                                                                formState.result = props.record.result
                                                                                formState.selectionAnalysis = props.record.selectionAnalysis
                                                                                formState.productionAnalysis = props.record.productionAnalysis
                                                                                formState.attach = props.record.attach
                                                                                formState.commitMsg = props.record.commitMsg
                                                                                formState.linkSale = props.record.linkSale
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
