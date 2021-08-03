<#include "layout/include.ftl" >
<!DOCTYPE html>
<html lang="zh">
<head>
<@meta title="组织架构列表"/>
<@css_common/>
</head>
<body class="gray-bg">
<div class="container-div">
    <div class="row">
        <div class="col-sm-12 search-collapse">
            <form id="test_position-form">
                <div class="select-list">
                    <ul>
                        <li>
                            职位名称：<input type="text" name="position_name"/>
                        </li>
                        <li>
                            公司名称：<input type="text" name="company"/>
                        </li>
                        <li>
                            职位简介：<input type="text" name="position_text"/>
                        </li>
                        <li>
                            福利待遇：<input type="text" name="social_benefits"/>
                        </li>
                        <li>
                            薪资：<input type="text" name="salary"/>
                        </li>
                        <li>
                            状态：<input type="text" name="states"/>
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
    var prefix = "${ctx}/testPosition";

    /* 职位管理停用 */
    function disable(id) {
        $.modal.confirm("确认要停用管理员用户吗？", function () {
            $.operate.post(prefix + "/state", {"id": id});
        })
    }

    /* 职位管理启用 */
    function enable(id) {
        $.modal.confirm("确认要启用管理员用户吗？", function () {
            $.operate.post(prefix + "/state", {"id": id});
        })
    }

    $(function () {
        var options = {
            url: prefix + "/findList",
            createUrl: prefix + "/add",
            updateUrl: prefix + "/update/{id}",
            removeUrl: prefix + "/delete",
            modalName: "组织架构",
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
                field: 'positionName',
                title: '职位名称'
            },
            {
                field: 'company',
                title: '公司名称'
            },
            {
                field: 'positionText',
                title: '职位简介'
            },
            {
                field: 'socialBenefits',
                title: '福利待遇'
            },
            {
                field: 'salary',
                title: '薪资'
            },
            {
                field: 'states',
                title: '状态',
                align: 'center',
                formatter: function (value, row, index) {
                    if (row.states == 1) {
                        return '<i class=\"fa fa-toggle-on text-info fa-2x\" onclick="disable(\'' + row.id + '\')"></i> ';
                    } else {
                        return '<i class=\"fa fa-toggle-off text-info fa-2x\" onclick="enable(\'' + row.id + '\')"></i> ';

                    }
                }
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