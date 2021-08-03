<#include "layout/include.ftl" >
<!DOCTYPE html>
<html lang="zh">
<head>
<@meta title="公司管理添加"/>
<@css_common/>
</head>
<body class="white-bg">
<div class="wrapper wrapper-content animated fadeInRight ibox-content">
    <form class="form-horizontal m" id="form_test_company_add">
            <div class="form-group">
                <label class="col-sm-3 control-label is-required">公司名称：</label>
                <div class="col-sm-8">
                    <input class="form-control required" type="text" name="name"
                           id="name"  placeholder="请输入公司名称" data-msg="请输入公司名称">
                </div>
            </div>
    </form>
</div>
<@js_common/>
<script type="text/javascript">
    var prefix = "${ctx}/testCompany";
    $("#form_test_company_add").validate({
        onkeyup: false,
        ignore: ":hidden",
        ignore: "",
        rules: {
            //example
        },
        messages: {},
        focusCleanup: true
    });


    function submitHandler() {
        if ($.validate.form()) {
            $.operate.save(prefix + "/add", $('#form_test_company_add').serialize());
        }
    }
</script>
</body>
</html>