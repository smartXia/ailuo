<template>
  <a-modal
    :visible="visible"
    title="新增字典"
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
      <a-form-item ref="label" label="标签" name="label">
        <a-input v-model:value="formState.label" />
      </a-form-item>
      <a-form-item ref="value" label="值" name="value">
        <a-input v-model:value="formState.value" />
      </a-form-item>
      <a-form-item ref="code" label="类型" name="code">
        <a-input v-model:value="formState.code" />
      </a-form-item>
      <a-form-item ref="sort" label="排序" name="sort">
        <a-input-number v-model:value="formState.sort" />
      </a-form-item>
      <a-form-item label="状态" name="enable">
        <a-switch v-model:checked="formState.enable" />
      </a-form-item>
      <a-form-item label="备注" name="remark">
        <a-textarea v-model:value="formState.remark" />
      </a-form-item>
    </a-form>
  </a-modal>
</template>
<script>
import { message } from 'ant-design-vue';
import { save } from "@/api/module/dictData";
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
    
    const formState = reactive({
        sort: 0,
        enable: "true",
    });

    watch(props,(props)=>{
        formState.code = props.record.code
    })

    const formRules = {
      name: [
        { required: true, message: '请输入名称', trigger: 'blur'},
      ],
      code: [
        { required: true, message: '请输入标识', trigger: 'blur'},
      ]
    };

    const submit = (e) => {
      formRef.value
        .validate()
        .then(() => {
          save(toRaw(formState)).then((response)=>{
              if(response.success){
                message.success({ content: '保存成功', duration: 1 }).then(()=>{
                  cancel();
                });
              }else{
                message.success({ content: '保存失败', duration: 1 }).then(()=>{
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