<#include "layout/include.ftl" >
<!DOCTYPE html>
<html lang="zh">
<head>
<@meta title="学生信息列表"/>
<@css_common/>
</head>
<body class="gray-bg">
<div class="container-div">
    <div class="row">
        <div class="col-sm-12 search-collapse">
            <form id="student-form">
                <div class="select-list">
                    <ul>
                        <li>
                            班级：<input type="text" name="classes"/>
                        </li>
                        <li>
                            性别：<input type="text" name="sex"/>
                        </li>
                        <li>
                            爱好：<input type="text" name="hobbies"/>
                        </li>
                        <li>
                            自我评价：<input type="text" name="evaluation"/>
                        </li>
                        <li>
                            创建时间：<input type="text" name="create_time"/>
                        </li>
                        <li>
                            修改时间：<input type="text" name="update_time"/>
                        </li>
                        <li>
                            <a class="btn btn-primary btn-rounded btn-sm" onclick="$.table.search()"><i
                                        class="fa fa-search"></i>&nbsp;搜索</a>
                            <a class="btn btn-warning btn-rounded btn-sm" onclick="$.form.reset()"><i
                                        class="fa fa-refresh"></i>&nbsp;重置</a>
                        </li>
                    </ul>
                </div>
            </form>
        </div>

        <div class="btn-group-sm" id="toolbar" role="group">
            <a class="btn btn-success" onclick="$.operate.add()">
                <i class="fa fa-plus"></i> 新增
            </a>
            <a class="btn btn-danger multiple " onclick="$.operate.removeAll()">
                <i class="fa fa-remove"></i> 删除
            </a>
        </div>

        <div class="col-sm-12 select-table table-striped">
            <table id="bootstrap-table"></table>
        </div>
    </div>
</div>
<@js_common/>
<script>
    var prefix = "${ctx}/student";

    $(function () {
        var options = {
            url: prefix + "/findList",
            createUrl: prefix + "/add",
            updateUrl: prefix + "/update/{id}",
            removeUrl: prefix + "/delete",
            modalName: "学生信息",
            uniqueId: "id",
            columns: [
                {
                    checkbox: true
                },
            {
                title: '序号',
                width: 5,
                align: "center",
                formatter: function (value, row, index) {
                    return $.table.serialNumber(index);
                }
            },
            {
                field: 'classes',
                title: '班级'
            },
            {
                field: 'sex',
                title: '性别',
                formatter: function (value, row, index) {
                    if (value == 1) {
                        return '女';
                    } else if (value == 2) {
                        return '男';
                    }
                    return '-';
                }
            },
            {
                field: 'hobbies',
                title: '爱好'
            },
            {
                field: 'evaluation',
                title: '自我评价'
            },
            {
                field: 'createTime',
                title: '创建时间'
            },
            {
                field: 'updateTime',
                title: '修改时间'
            },
            {
                title: '操作',
                align: 'center',
                formatter: function (value, row, index) {
                    var actions = [];
                    actions.push('<a class="btn btn-success btn-xs " href="javascript:void(0)" onclick="$.operate.edit(\'' + row.id + '\')"><i class="fa fa-edit"></i>编辑</a> ');
                    actions.push('<a class="btn btn-danger btn-xs " href="javascript:void(0)" onclick="$.operate.remove(\'' + row.id + '\')"><i class="fa fa-remove"></i>删除</a>');
                    return actions.join('');
                }
            }]
        };
        $.table.init(options);
    });
</script>
</body>
</html>