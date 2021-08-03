<#include "layout/include.ftl" >
<!DOCTYPE html>
<html lang="zh">
<head>
<@meta title="组织架构添加"/>
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
                    <textarea class="form-control" rows="3" name="positionText" id="positionText"></textarea>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label is-required">薪资：</label>
                <div class="col-sm-8">
                    <select class="noselect2 form-control required select-tree" data-placeholder="请选择薪资" id="salary" name="salary" data-msg="请选择薪资">
                        <option value="3000以下">3000以下</option>
                        <option value="3000-5000">3000-5000</option>
                        <option value="5000-8000">3000-5000</option>
                        <option value="8000-12000">3000-5000</option>
                        <option value="12000以上">12000以上</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label is-required">福利待遇：</label>
                <div class="col-sm-8">
                    <input name="socialBenefits" id="socialBenefits" type="checkbox" value="五险一金"> <label>五险一金</label>
                    <input name="socialBenefits" id="socialBenefits" type="checkbox" value="年休"> <label>年休</label>
                    <input name="socialBenefits" id="socialBenefits" type="checkbox" value="奖金"> <label>奖金</label>
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