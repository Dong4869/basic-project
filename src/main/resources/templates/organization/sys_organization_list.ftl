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
            <form id="sys_organization-form">
                <div class="select-list">
                    <ul>
                        <li>
                            组织id：<input type="text" name="id"/>
                        </li>
                        <li>
                            父级组织id：<input type="text" name="pid"/>
                        </li>
                        <li>
                            祖级列表：<input type="text" name="ancestors"/>
                        </li>
                        <li>
                            组织名称：<input type="text" name="name"/>
                        </li>
                        <li>
                            显示顺序：<input type="text" name="sort"/>
                        </li>
                        <li>
                            负责人：<input type="text" name="leader"/>
                        </li>
                        <li>
                            联系电话：<input type="text" name="phone"/>
                        </li>
                        <li>
                            邮箱：<input type="text" name="email"/>
                        </li>
                        <li>
                            状态（0正常 1停用）：<input type="text" name="status"/>
                        </li>
                        <li>
                            删除标志（0代表存在 1代表删除）：<input type="text" name="isdel"/>
                        </li>
                        <li>
                            创建者：<input type="text" name="create_by"/>
                        </li>
                        <li>
                            创建时间：<input type="text" name="create_time"/>
                        </li>
                        <li>
                            更新者：<input type="text" name="update_by"/>
                        </li>
                        <li>
                            更新时间：<input type="text" name="update_time"/>
                        </li>
                        <li>
                            组织类型：0公司 1部门：<input type="text" name="org_type"/>
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
    var prefix = "${ctx}/sysOrganization";

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
                field: 'id',
                title: '组织id'
            },
            {
                field: 'pid',
                title: '父级组织id'
            },
            {
                field: 'ancestors',
                title: '祖级列表'
            },
            {
                field: 'name',
                title: '组织名称'
            },
            {
                field: 'sort',
                title: '显示顺序'
            },
            {
                field: 'leader',
                title: '负责人'
            },
            {
                field: 'phone',
                title: '联系电话'
            },
            {
                field: 'email',
                title: '邮箱'
            },
            {
                field: 'status',
                title: '状态（0正常 1停用）'
            },
            {
                field: 'isdel',
                title: '删除标志（0代表存在 1代表删除）'
            },
            {
                field: 'createBy',
                title: '创建者'
            },
            {
                field: 'createTime',
                title: '创建时间'
            },
            {
                field: 'updateBy',
                title: '更新者'
            },
            {
                field: 'updateTime',
                title: '更新时间'
            },
            {
                field: 'orgType',
                title: '组织类型：0公司 1部门'
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