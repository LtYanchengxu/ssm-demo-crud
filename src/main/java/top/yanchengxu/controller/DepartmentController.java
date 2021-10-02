package top.yanchengxu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import top.yanchengxu.bean.Department;
import top.yanchengxu.bean.Message;
import top.yanchengxu.service.DepartmentService;

import java.util.List;

@Controller
public class DepartmentController {

    @Autowired
    private DepartmentService departmentService;

    @RequestMapping("/depts")
    @ResponseBody
    public Message getDepts() {
        List<Department> departmentList = departmentService.getDepts();
        Message deptList = Message.succeed().add("deptList", departmentList);
        return deptList;
    }

}
