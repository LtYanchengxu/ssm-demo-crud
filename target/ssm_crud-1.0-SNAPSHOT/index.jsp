<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>员工列表</title>
    <!-- Bootstrap -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap-3.4.1-dist/css/bootstrap.css">
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="${pageContext.request.contextPath}/static/js/jquery-3.3.1.js"></script>
    <script src="${pageContext.request.contextPath}/static/bootstrap-3.4.1-dist/js/bootstrap.js"></script>
    <!-- Button trigger modal -->

</head>
<body>


<div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" >员工修改</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="empName_add_input" class="col-sm-2 control-label">姓名</label>
                        <div class="col-sm-10">
                            <p class="form-control-static" id="empName_update_static"></p>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="empEmail_add_input" class="col-sm-2 control-label">员工邮箱</label>
                        <div class="col-sm-10">
                            <input type="email" class="form-control" name="empEmail" id="empEmail_update_input" placeholder="ycx@yanchengxu.top">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group" >
                        <label for="empGender_add_M" class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="empGender" id="empGender_update_M" value="M" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="empGender" id="empGender_update_F" value="F"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group" >
                        <label for="empGender_update_M" class="col-sm-2 control-label">部门</label>
                        <div class="col-sm-4">
                            <%--提交id即可--%>
                            <select class="form-control" name="dId" id="dept_update_select">

                            </select>
                        </div>
                    </div>

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_update_save_btn">更新</button>
            </div>
        </div>
    </div>
</div>


    <!-- 员工添加 -->
    <div class="modal fade" id="empAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">员工添加</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal">
                        <div class="form-group">
                            <label for="empName_add_input" class="col-sm-2 control-label">姓名</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="empName" id="empName_add_input" placeholder="姓名">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="empEmail_add_input" class="col-sm-2 control-label">员工邮箱</label>
                            <div class="col-sm-10">
                                <input type="email" class="form-control" name="empEmail" id="empEmail_add_input" placeholder="ycx@yanchengxu.top">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group" >
                            <label for="empGender_add_M" class="col-sm-2 control-label">性别</label>
                            <div class="col-sm-10">
                                <label class="radio-inline">
                                    <input type="radio" name="empGender" id="empGender_add_M" value="M" checked="checked"> 男
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="empGender" id="empGender_add_F" value="F"> 女
                                </label>
                            </div>
                        </div>
                        <div class="form-group" >
                            <label for="empGender_add_M" class="col-sm-2 control-label">部门</label>
                            <div class="col-sm-4">
                                <%--提交id即可--%>
                                <select class="form-control" name="dId" id="dept_add_select">

                                </select>
                            </div>
                        </div>

                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="emp_add_save_btn">添加</button>
                </div>
            </div>
        </div>
    </div>
<div class="container">
    <%--标题--%>
    <div class="row">
        <div class="col-md-12">
            <h1>SSM_CRUD</h1>
        </div>
    </div>
    <%--按钮--%>
    <div class="row"></div>
    <div class="col-md-4 col-md-offset-8">
        <button class="btn btn-primary" id="emp_add_modal_btn">新增</button>
        <button class="btn btn-danger" id="emp_delete_btn">删除</button>
    </div>
    <%--表格--%>
    <div class="row"></div>
    <div class="col-md-12">
        <table class="table table-hover" id="emps_table">
            <thead>
                <tr>
                    <th>
                        <input type="checkbox" id="check_all"/>
                    </th>
                    <th>#</th>
                    <th>姓名</th>
                    <th>性别</th>
                    <th>邮箱</th>
                    <th>部门</th>
                    <th>操作</th>
                </tr>
            </thead>
            <tbody>

            </tbody>

        </table>
    </div>

    <%--分页--%>
    <div class="row">
        <%--分页信息--%>
        <div class="col-md-6" id="page_info_area">
<%--            当前第页，共 页，共 条记录--%>
        </div>
        <%--导航条--%>
        <div class="col-md-6" id="page_info_nav">

        </div>
    </div>
</div>
<script type="text/javascript" >
<%--    1. 页面加载完成后 直接发送一个ajax请求，要到分页数据--%>
    /*$(function () {
        $.ajax({
            URL:"${pageContext.request.contextPath}/emps",
            data: "pn=1",
            type: "GET",
            success: function (result) {
                console.log(result);
            }
        });
    });*/
    $(function () {
        // 去首页
        to_page(1)
    })

    function clear_pages() {
        $("#emps_table tbody").empty()
        $("#page_info_area").empty()
        $("#page_info_nav").empty()
    }

    function to_page(pn) {
        clear_pages()
        $.ajax({
            url: "${pageContext.request.contextPath}/emps",
            data: "pn=" + pn,
            type: "get",
            success: function (result) {
                // console.log(result);
                // 解析并显示员工数据
                build_emps_table(result)
                // 解析并显示分页数据
                build_page_info(result)
                // 导航条
                build_page_nav(result)
            }
        })
    }

    function build_emps_table(result) {

        var emps = result.extend.pageInfo.list;
        $.each(emps, function (index, item) {
            // alert(item.empName);
            var checkboxTd = $("<td><input type='checkbox' class='check_item' /></td>");
            var empIdTd = $("<td></td>").append(item.empId);
            var empNameTd = $("<td></td>").append(item.empName);
            var empGenderTd = $("<td></td>").append(item.empGender=='M'?"男":"女");
            var empEmailTd = $("<td></td>").append(item.empEmail);
            var deptNameTd = $("<td></td>").append(item.department.deptName);
            /*<button class="btn btn-info btn-sm">
                                    <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改
                                </button>
                                <button class="btn btn-danger btn-sm">
                                    <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>删除
                                </button>*/
            var btnEdit = $("<button></button>").addClass("btn btn-info btn-sm edit_btn")
                        .append("<span></span>").addClass("glyphicon glyphicon-pencil")
                        .append("修改")
            btnEdit.attr("emp-id", item.empId);
            var btnDel = $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
                .append("<span></span>").addClass("glyphicon glyphicon-trash")
                .append("删除")
            btnDel.attr("emp-id", item.empId);
            var btnTd = $("<td></td>").append(btnEdit).append(" ").append(btnDel)
            $("<tr></tr>").append(checkboxTd)
                .append(empIdTd)
                .append(empNameTd)
                .append(empGenderTd)
                .append(empEmailTd)
                .append(deptNameTd)
                .append(btnTd)
                .appendTo("#emps_table tbody");
        })
    }
    var total_record, cur_page;
    function build_page_info(result) {

        var page_info_extend = result.extend.pageInfo
        $("#page_info_area").append("当前第"+page_info_extend.pageNum
                                    + "页，共" + page_info_extend.pages
                                    + "页，共" + page_info_extend.total + "条记录")
        total_record = page_info_extend.total;
        cur_page = page_info_extend.pageNum;
    }
    function build_page_nav(result) {


        var page_info = result.extend.pageInfo

        var ul = $("<ul></ul>").addClass("pagination")
        // 首页
        var firstPageLi = $("<li></li>").append($("<a></a>").attr("href", "#").append("首页"));


        // 前一页
        var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;").attr("href", "#"));

        if (!page_info.hasPreviousPage) {
            // 没有前一页 禁用此按钮
            prePageLi.addClass("disabled")

            firstPageLi.addClass("disabled")
        } else {
            // 有前一页
            prePageLi.click(function () {
                to_page(page_info.pageNum - 1)
            })
            firstPageLi.click(function () {
                to_page(1)
            })
        }

        ul.append(firstPageLi).append(prePageLi)

        // navigatepageNums [1, 2, 3, 4, 5]
        // item  1,...,5
        $.each(page_info.navigatepageNums, function (index, item) {
            var numLi = $("<li></li>").append($("<a></a>").append(item));
            if (page_info.pageNum == item) {
                numLi.addClass("active")
            }
            numLi.click(function () {
                to_page(item)
            })
            ul.append(numLi)
        })
        // 后一页
        var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;").attr("href", "#"));
        // 尾页
        var lastPageLi = $("<li></li>").append($("<a></a>").append("尾页").attr("href", "#"));

        if (!page_info.hasNextPage) {
            // 没有下一页 下页跟最后一页没法点
            nextPageLi.addClass("disabled")
            lastPageLi.addClass("disabled")
        } else {
            // 有下一页
            lastPageLi.click(function () {
                to_page(page_info.pages)
            })
            nextPageLi.click(function () {
                to_page(page_info.pageNum + 1)
            })
        }

        ul.append(nextPageLi).append(lastPageLi)

        var nav = $("<nav></nav>").append(ul)
        $("#page_info_nav").append(nav)
        // nav.appendTo("#page_info_nav")
    }

    function reset_form(ele) {
        $(ele)[0].reset();
        $(ele).find("*").removeClass("has-error has-success");
        $(ele).find(".help-block").text("")

    }
    
    // 点击新增 出现模态框
    $("#emp_add_modal_btn").click(function () {
        // 表单重置->完整重置->包括表单数据及表单样式
        // 发送ajax请求，查询部门列表，显示在下拉列表中
        reset_form("#empAddModal form");
        getDepts("#dept_add_select")
        $("#empAddModal").modal({
            backdrop: "static"
        });
    })

    // 查询所有部门名称
    function getDepts(ele) {
        // $("#dept_add_select").empty()
        $(ele).empty();
        $.ajax({
            url: "${pageContext.request.contextPath}/depts/",
            type: "get",
            success: function (result) {
                // console.log(result)
                // 将所有信息填充在下拉列表中
                // {"code":200,"msg":"成功","extend":{"deptList":[{"deptId":1,"deptName":"开发部"},{"deptId":2,"deptName":"测试部"}]}}
                $.each(result.extend.deptList, function () {
                    // 没有参数时 this代指迭代对象
                    var option = $("<option></option>").append(this.deptName).attr("value",this.deptId)
                    // this
                    option.appendTo(ele)
                })

            }
        })
    }

    function validate_add_form() {
        var empName = $("#empName_add_input").val();
        // alert(empName)
        // var regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/
        var regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;


        // var regName = /[\u4E00-\u9FA5]/
        if (regName.test(empName) == false) {
            // alert("用户名必须是2-5位中文或6-16位英文")
            show_validate_msg("#empName_add_input", "error", "用户名必须是2-5位中文或6-16位英文")
            // 改成显示提示
            return false;
        } else {
            show_validate_msg("#empName_add_input", "success", "")
        }

        var empEmail = $("#empEmail_add_input").val();
        var regEmail = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
        if (regEmail.test(empEmail) == false) {
            // alert("邮箱格式错误");
            show_validate_msg("#empEmail_add_input", "error", "邮箱格式错误")
            return false;
        } else {
            show_validate_msg("#empEmail_add_input", "success", "")
        }
        return true;
    }

    // 显示校验信息
    function show_validate_msg(element, status, message) {
        $(element).parent().removeClass("has-success has-error")
        $(element).next("span").text("")
        if (status == "success") {
            $(element).parent().addClass("has-success")
            $(element).next("span").text(message)
        }
        if (status == "error") {
            $(element).parent().addClass("has-error")
            $(element).next("span").text(message)
        }
    }


    // 保存前服务端 重名校验
    $("#empName_add_input").change(function () {
        // 发送ajax请求检验用户名是否存在
        let empName= this.value;
        $.ajax({
            url: "${pageContext.request.contextPath}/checkempname",
            data: "empName="+empName,
            type: "POST",
            success: function (result) {
                if (result.code == 200 ) {
                    // 可以添加
                    show_validate_msg("#empName_add_input", "success", result.extend.va_msg)
                    $("#emp_add_save_btn").attr("ajax-val", "success");
                } else {
                    // 不可以添加
                    show_validate_msg("#empName_add_input", "error", result.extend.va_msg)
                    $("#emp_add_save_btn").attr("ajax-val", "error");

                }
            }
        })
    })







    // 点击保存 保存员工
    $("#emp_add_save_btn").click(function () {
        /*// 客户端校验
        if (validate_add_form() == false) {
            return false;
        }*/
        // 服务端校验
        if ($(this).attr("ajax-val") === "error") {
            return false;
        }

        // 提交保存
        $.ajax({
            url: "${pageContext.request.contextPath}/emp",
            type: "POST",
            data: $("#empAddModal form").serialize(),
            success: function (result) {
                // alert(result.msg)

                if (result.code == 200) {
                    // 成功
                    // 1. 关闭模态框
                    $("#empAddModal").modal("hide");
                    // 2. 自动跳转到最后一页
                    to_page(total_record)
                } else {
                    if (undefined != result.extend.errorFeilds.empEmail) {
                        show_validate_msg("#empEmail_add_input", "error",result.extend.errorFeilds.empEmail )
                    }
                    if (undefined != result.extend.errorFeilds.empName) {
                        show_validate_msg("#empEmail_add_input", "error",result.extend.errorFeilds.empName )
                    }
                   /* // 失败
                    console.log(result)*/
                }


            }
        });
        // console.log(serialize)
    })

    // 点击编辑按钮
    $(document).on("click", ".edit_btn", function () {
        // alert("edit");
        // 查出员工信息，显示员工列表
        // 查出部门信息，显示部门列表
        getDepts("#dept_update_select")
        getEmp($(this).attr("emp-id"))
        $("#emp_update_save_btn").attr("emp-id", $(this).attr("emp-id"))
        $("#empUpdateModal").modal({
            backdrop: "static"
        });
    });

    // 点击删除按钮
    $(document).on("click", ".delete_btn", function () {
        // 1. 弹出提示框 是否删除
        var empName = $(this).parents("tr").find("td:eq(2)").text();
        var empId = $(this).attr("emp-id");
        if (confirm("确认删除【"+empName+"】吗？")) {
            // 确认 -> 返送ajax请求
            $.ajax({
                url: "${pageContext.request.contextPath}/emp/"+empId,
                type: "delete",
                success: function (result) {
                    alert(result.msg);
                    // 回到本页
                    to_page(cur_page);
                }
            })
        }

    });

    // 全选/全不选按钮
    $("#check_all").click(function () {
        // alert($(this).attr("checked"))  //undefined
        // 原生dom访问属性用prop
        // alert($(this).prop("checked"));
        $(".check_item").prop("checked", $(this).prop("checked"));
    })

    // 全选状态同步
    $(document).on("click", ".check_item", function () {
        var flag = $(".check_item:checked").length === $(".check_item").length;
        $("#check_all").prop("checked", flag);
    })

    $("#emp_delete_btn").click(function () {
        var delEmpNames = ""
        var ids = ""
        $.each($(".check_item:checked"), function () {
            // alert($(this).parents("tr").find("td:eq(2)").text())
            delEmpNames += $(this).parents("tr").find("td:eq(2)").text() + ","
            ids += $(this).parents("tr").find("td:eq(1)").text() + "-"
        })
        // 去除末尾符号
        delEmpNames = delEmpNames.substring(0, delEmpNames.length - 1);
        ids = ids.substring(0, ids.length - 1);
        if (confirm("确定删除【" + delEmpNames + "】吗？")) {
            // 发送ajax请求
            $.ajax({
                url: "${pageContext.request.contextPath}/emp/" + ids,
                type: "delete",
                success: function (result) {
                    alert(result.msg)
                    to_page(cur_page)
                }
            })
        }
    })

    
    function getEmp(id) {
        $.ajax({
            url: "${pageContext.request.contextPath}/emp/"+id,
            type: "get",
            success: function (result) {
                // console.log(result);
                var empData = result.extend.emp;
                $("#empName_update_static").text(empData.empName)
                $("#empEmail_update_input").val(empData.empEmail)
                $("#empUpdateModal input[name=empGender]").val([empData.empGender]);
                $("#empUpdateModal select").val([empData.dId]);
            }
        })
    }
    
    $("#emp_update_save_btn").click(function () {
        // 1. 验证邮箱是否合法
        var empEmail = $("#empEmail_update_input").val();
        var regEmail = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
        if (regEmail.test(empEmail) == false) {
            // alert("邮箱格式错误");
            show_validate_msg("#empEmail_update_input", "error", "邮箱格式错误")
        } else {
            show_validate_msg("#empEmail_update_input", "success", "")
        }
        // 2. 保存更新的员工数据
        /*var empId = $("#emp_update_save_btn").attr("emp-id");
        $.ajax({
            url: "${pageContext.request.contextPath}/emp/" + empId,
            type: "post",
            data: $("#empUpdateModal form").serialize()+"&_method=PUT",
            success: function (result) {

                alert(result.msg)
            }
        })*/

        var empId = $("#emp_update_save_btn").attr("emp-id");
        $.ajax({
            url: "${pageContext.request.contextPath}/emp/" + empId,
            type: "PUT",
            data: $("#empUpdateModal form").serialize(),
            success: function (result) {
                // alert(result.msg)
                // 1. 关闭对话框
                $("#empUpdateModal").modal("hide");
                // 2. 返回当前页面
                to_page(cur_page)
            }
        })
    })
    
</script>
</body>
</html>
