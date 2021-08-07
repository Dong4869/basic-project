<#include "layout/include.ftl" >
<!DOCTYPE html>
<html lang="zh">
<head>
<@meta title="员工管理列表"/>
<@css_common/>
<@css_layout/>
<@css_ztree/>
</head>
<body class="gray-bg">
<div class="ui-layout-west">
    <div class="box box-main">
        <div class="box-header">
            <div class="box-title">
                <i class="fa icon-grid"></i> 组织架构
            </div>
            <div class="box-tools pull-right">
<#--                <a type="button" class="btn btn-box-tool" href="#" onclick="organizationList()" title="管理组织架构"><i-->
<#--                                class="fa fa-edit"></i></a>-->
                <button type="button" class="btn btn-box-tool" id="btnExpand" title="展开" style="display:none;"><i
                            class="fa fa-chevron-up"></i></button>
                <button type="button" class="btn btn-box-tool" id="btnCollapse" title="折叠"><i
                            class="fa fa-chevron-down"></i></button>
                <button type="button" class="btn btn-box-tool" id="btnRefresh" title="刷新部门"><i
                            class="fa fa-refresh"></i></button>
            </div>
        </div>
        <div class="ui-layout-content">
            <div id="tree" class="ztree"></div>
        </div>
    </div>
</div>
<div class="ui-layout-center">
<div class="container-div">
            <div class="row">
                <div class="col-sm-12 search-collapse">
                    <form id="employee-form">
                        <input type="hidden" id="deptId" name="deptId">
                        <input type="hidden" id="parentId" name="parentId">
                        <div class="select-list">
                            <ul>
                                <li>
                                    姓名：<input type="text" name="name"/>
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
                    <a class="btn btn-success" onclick="newAdd()">
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
</div>
<@js_common/>
<@js_layout/>
<@js_ztree/>
<script>

    function newAdd(){
        var companyId = $("#deptId").val();
        if (companyId == '')
        {
            alert('请选择组织架构');
            return;
        }
        $.modal.open("新增员工",prefix + "/add/"+companyId);
    }
    var prefix = "${ctx}/employee";
    function loadOrgTree() {

        var url = "${ctx}/organization/findAllTree";


        var options = {
            url: url,
            expandLevel: -1,
            onClick: zOnClick
        };
        $.tree.init(options);

        function zOnClick(event, treeId, treeNode) {
            $("#deptId").val(treeNode.id);
            $("#parentId").val(treeNode.pId);
            $.table.search();
        }
    }

    $('#btnExpand').click(function () {
        $._tree.expandAll(true);
        $(this).hide();
        $('#btnCollapse').show();
    });

    $('#btnCollapse').click(function () {
        $._tree.expandAll(false);
        $(this).hide();
        $('#btnExpand').show();
    });

    $('#btnRefresh').click(function () {
        loadOrgTree();
    });

    $(function () {
        var panehHidden = false;
        $('body').layout({initClosed: panehHidden, west__size: 250});
        loadOrgTree();
        var options = {
            url: prefix + "/findList",
            createUrl: prefix + "/add",
            updateUrl: prefix + "/update/{id}",
            removeUrl: prefix + "/delete",
            modalName: "员工管理",
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
                title: '主键'
            },
            {
                field: 'name',
                title: ''
            },
            {
                field: 'gender',
                title: '性别'
            },
            {
                field: 'age',
                title: '年龄'
            },
            {
                field: 'position',
                title: '职位'
            },
            {
                field: 'status',
                title: '状态'
            },
            {
                field: 'createTime',
                title: ''
            },
            {
                field: 'type',
                title: '类型'
            },
            {
                field: 'updateTime',
                title: ''
            },
            {
                field: 'createBy',
                title: ''
            },
            {
                field: 'updateBy',
                title: ''
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