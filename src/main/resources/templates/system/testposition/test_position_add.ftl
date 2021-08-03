<#include "layout/include.ftl" >
<!DOCTYPE html>
<html lang="zh">
<head>
<@meta title="公司管理添加"/>
<@css_common/>
</head>
<body class="white-bg">
<div class="wrapper wrapper-content animated fadeInRight ibox-content">
    <form class="form-horizontal m" id="form_test_position_add">
            <div class="form-group">
                <label class="col-sm-3 control-label is-required">职位名称：</label>
                <div class="col-sm-8">
                    <input class="form-control required" type="text" name="positionName"
                           id="positionName"  placeholder="请输入职位名称" data-msg="请输入职位名称">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label is-required">公司名称：</label>
                <div class="col-sm-8">
                    <input class="form-control required" type="text" name="company"
                           id="company"  placeholder="请输入公司名称" data-msg="请输入公司名称">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label is-required">职位简介：</label>
                <div class="col-sm-8">
                    <input class="form-control required" type="text" name="positionText"
                           id="positionText"  placeholder="请输入职位简介" data-msg="请输入职位简介">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label is-required">福利待遇：</label>
                <div class="col-sm-8">
                    <input class="form-control required" type="text" name="socialBenefits"
                           id="socialBenefits"  placeholder="请输入福利待遇" data-msg="请输入福利待遇">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label is-required">薪资：</label>
                <div class="col-sm-8">
                    <input class="form-control required" type="text" name="salary"
                           id="salary"  placeholder="请输入薪资" data-msg="请输入薪资">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label is-required">状态：</label>
                <div class="col-sm-8">
                    <input class="form-control required" type="text" name="states"
                           id="states"  placeholder="请输入状态" data-msg="请输入状态">
                </div>
            </div>
    </form>
</div>
<@js_common/>
<script type="text/javascript">
    var prefix = "${ctx}/testPosition";
    $("#form_test_position_add").validate({
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
            $.operate.save(prefix + "/add", $('#form_test_position_add').serialize());
        }
    }
</script>
</body>
</html>