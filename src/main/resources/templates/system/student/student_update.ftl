<#include "layout/include.ftl" >
<!DOCTYPE html>
<html lang="zh">
<head>
<@meta title="学生信息修改"/>
<@css_common/>
</head>
<body class="white-bg">
<div class="wrapper wrapper-content animated fadeInRight ibox-content">
    <form class="form-horizontal m" id="form_student_update">
        <input id="id" name="id" type="hidden" value="${student.id}">
            <div class="form-group">
                <label class="col-sm-3 control-label is-required">班级：</label>
                <div class="col-sm-8">
                    <select class="noselect2 form-control required select-tree" data-placeholder="请输入班级" id="classes" name="classes" data-msg="请输入班级">
                        <option value="研一">研一</option>
                        <option value="研二">研二</option>
                        <option value="研三">研三</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label is-required">性别：</label>
                <div class="col-sm-8">
                    <input type="radio" name="sex" id="sex"  value="1"><label>女</label>
                    <input type="radio" name="sex" id="sex"  value="2"><label>男</label>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label is-required">爱好：</label>
                <div class="col-sm-8">
                    <input name="hobbies" id="hobbies" type="checkbox" value="运动"> <label>运动</label>
                    <input name="hobbies" id="hobbies" type="checkbox" value="唱歌"> <label>唱歌</label>
                    <input name="hobbies" id="hobbies" type="checkbox" value="画画"> <label>画画</label>
                    <input name="hobbies" id="hobbies" type="checkbox" value="阅读"> <label>阅读</label>
                    <input name="hobbies" id="hobbies" type="checkbox" value="编程"> <label>编程</label>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label is-required">自我评价：</label>
                <div class="col-sm-8">
                    <textarea class="form-control" rows="3" name="evaluation" id="evaluation" placeholder="请输入自我评价" data-msg="请输入自我评价"></textarea>
                </div>
            </div>
    </form>
</div>
<@js_common/>
<script type="text/javascript">
    var prefix = "${ctx}/student";
    $("#form_student_update").validate({
        onkeyup: false,
        ignore: ":hidden",
        ignore: "",
        rules: {},
        messages: {},
        focusCleanup: true
    });


    function submitHandler() {
        if ($.validate.form()) {
            $.operate.save(prefix + "/update", $('#form_student_update').serialize());
        }
    }
</script>
</body>
</html>