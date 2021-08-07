<#include "layout/include.ftl" >
<!DOCTYPE html>
<html lang="zh">
<head>
<@meta title="员工管理添加"/>
<@css_common/>

    <link href="${ctx}/static/plugins/select-tree/select-tree.css" rel="stylesheet"/>
</head>
<body class="white-bg">
<div class="wrapper wrapper-content animated fadeInRight ibox-content">
    <form class="form-horizontal m" id="form_employee_add">
            <div class="form-group">
                <label class="col-sm-3 control-label is-required">姓名：</label>
                <div class="col-sm-8">
                    <input class="form-control required" type="text" name="name"
                           id="name"  placeholder="请输入" data-msg="请输入">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label is-required">性别：</label>
                <div class="col-sm-8">
                    <input class="form-control required" type="text" name="gender"
                           id="gender"  placeholder="请输入性别" data-msg="请输入性别">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label is-required">年龄：</label>
                <div class="col-sm-8">
                    <input class="form-control required" type="text" name="age"
                           id="age"  placeholder="请输入年龄" data-msg="请输入年龄">
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-3 control-label is-required">职位：</label>
                <div class="col-sm-8">
                    <input class="form-control required" type="text" name="position"
                           id="position"  placeholder="请输入职位" data-msg="请输入职位">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label is-required">状态：</label>
                <div class="col-sm-8">
                    <input class="form-control required" type="text" name="status"
                           id="status"  placeholder="请输入状态" data-msg="请输入状态">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label is-required">类型：</label>
                <div class="col-sm-8">
                    <input class="form-control required" type="text" name="type"
                           id="type"  placeholder="请输入类型" data-msg="请输入类型">
                </div>
            </div>
        <input class="form-control required" type="hidden" name="companyId"
               id="status" value="${companyId}">

    </form>
</div>
<@js_common/>
<script src="${ctx}/static/plugins/select-tree/select-tree.js"></script>
<script type="text/javascript">
    var prefix = "${ctx}/employee";
    $("#form_employee_add").validate({
        onkeyup: false,
        ignore: ":hidden",
        ignore: "",
        rules: {
            //example
        },
        messages: {},
        focusCleanup: true
    });

    $(function () {
        $(".select-tree").selectTree({
            expandAll:false,
            expandLevel:0
        });

    })

    function submitHandler() {
        if ($.validate.form()) {
            $.operate.save(prefix + "/add", $('#form_employee_add').serialize());
        }
    }
</script>
</body>
</html>