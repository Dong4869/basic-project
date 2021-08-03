<#include "layout/include.ftl" >
<!DOCTYPE html>
<html lang="zh">
<head>
<@meta title="职位管理修改"/>
<@css_common/>
</head>
<body class="white-bg">
<div class="wrapper wrapper-content animated fadeInRight ibox-content">
    <form class="form-horizontal m" id="form_test_position_update">
        <input id="id" name="id" type="hidden" value="${testPosition.id}">

        <div class="form-group">
            <label class="col-sm-3 control-label is-required">职位名称：</label>
            <div class="col-sm-8">
                <input class="form-control required" type="text" name="positionName" value="${testPosition.positionName}"
                       id="positionName"  placeholder="请输入职位名称" data-msg="请输入职位名称">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label is-required">公司名称：</label>
            <div class="col-sm-8">
                <input class="form-control required" type="text" name="company" value="${testPosition.company}"
                       id="company"  placeholder="请输入公司名称" data-msg="请输入公司名称">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label is-required">薪资待遇：</label>
            <div class="col-sm-8">
                <select name="salary" class="form-control required">
                    <option value="">请选择薪资待遇</option>
                    <option value="3000以下" <#if testPosition.salary == '3000以下'>selected</#if> >3000以下</option>
                    <option value="3000-5000" <#if testPosition.salary == '3000-5000'>selected</#if> >3000-5000</option>
                    <option value="5000-8000" <#if testPosition.salary == '5000-8000'>selected</#if> >5000-8000</option>
                    <option value="8000-12000" <#if testPosition.salary == '8000-12000'>selected</#if> >8000-12000</option>
                    <option value="12000以上" <#if testPosition.salary == '12000以上'>selected</#if> >12000以上</option>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label is-required">职位简介：</label>
            <div class="col-sm-8">
                <textarea class="form-control required" placeholder="请输入职位简介" name="remark">${testPosition.remark}</textarea>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label is-required">福利待遇：</label>
            <div class="col-sm-8">
                <label class="checkbox-inline " title="五险一金">
                    <input type="checkbox" name="fuli"  value="五险一金" >五险一金
                </label>
                <label class="checkbox-inline " title="五险一金">
                    <input type="checkbox" name="fuli"  value="双休" >双休
                </label>
                <label class="checkbox-inline " title="五险一金">
                    <input type="checkbox" name="fuli"  value="年假" >年假
                </label>
            </div>
        </div>
    </form>
</div>
<@js_common/>
<script type="text/javascript">
    var prefix = "${ctx}/testPosition";

    var fuli_list = "${testPosition.fuli}";
    $(function () {
        var urs = new Array();
        if(fuli_list) {
            urs = fuli_list.split(",");
            $("input[name=fuli]").each(function () {
                var roleId = $(this).val();
                for (var value of urs) {
                    if(value == roleId) {
                        $(this).attr("checked", 'checked');
                        break;
                    }
                }
            });
        }
    });


    $("#form_test_position_update").validate({
        onkeyup: false,
        ignore: ":hidden",
        ignore: "",
        rules: {},
        messages: {},
        focusCleanup: true
    });


    function submitHandler() {
        if ($.validate.form()) {
            $.operate.save(prefix + "/update", $('#form_test_position_update').serialize());
        }
    }
</script>
</body>
</html>