package top.yanchengxu.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import jdk.nashorn.internal.ir.ReturnNode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import top.yanchengxu.bean.Employee;
import top.yanchengxu.bean.Message;
import top.yanchengxu.service.EmployeeService;

import javax.validation.Valid;
import java.security.PrivateKey;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * 处理员工的CRUD请求
 */
@Controller
public class EmployeeController {

    @Autowired
    private EmployeeService employeeService;


    /**
     * 保存员工
     * @param employee
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/emp", method = RequestMethod.POST)
    @ResponseBody
    public Message saveEmp(@Valid Employee employee, BindingResult bindingResult) {
        // 保存前先校验关键字段
        if (bindingResult.hasErrors()) {
            // 校验失败
            Map<String, Object> map = new HashMap<String, Object>();
            List<FieldError> fieldErrors = bindingResult.getFieldErrors();
            for (FieldError fieldError : fieldErrors) {
                System.out.println();
                map.put(fieldError.getField(), fieldError.getDefaultMessage());
            }
            return Message.fail().add("errorFeilds", map);

        }
        employeeService.saveEmp(employee);
        return Message.succeed();
    }

    /**
     * 用户名重复校验
     * @param empName
     * @return
     */
    @RequestMapping(value = "/checkempname")
    @ResponseBody
    public Message checkEmpName(@RequestParam("empName") String empName) {
        // 先判断用户名是否合法

        String regex = "(^[a-zA-Z0-9_-]{6,16}$)|(^[\\u2E80-\\u9FFF]{2,5})";
        boolean matches = empName.matches(regex);
        if (!matches) {
            return Message.fail().add("va_msg", "用户名必须是6-16位数字和字母的组合");
        }
        // 用户名重复校验
        Boolean notExist = employeeService.checkEmpName(empName);
        // System.out.println(notExist);
        if (notExist) {
            return Message.succeed();
        } else {
            return Message.fail().add("va_msg", "用户名不可用");
        }

    }

    /**
     * 查询所有员工
     * @param pn
     * @return
     */
    @RequestMapping("/emps")
    @ResponseBody
    public Message getAll(@RequestParam(value = "pn", defaultValue = "1") Integer pn) {
        ModelAndView modelAndView = new ModelAndView();
        // 在查询之前调用PageHelper.startPage, 设置从哪一页开始，每页几条
        PageHelper.startPage(pn, 5);
        // startPage后紧跟的查询
        List<Employee> employeeList = employeeService.getAll();
        // 使用PageInfo封装查询结果，返回页面，设置导航栏连续显示的页数
        PageInfo<Employee> pageInfo = new PageInfo<Employee>(employeeList, 5);
        return Message.succeed().add("pageInfo", pageInfo);
    }

    /**
     * 根据id查询员工
     * @param id
     * @return
     */
    @RequestMapping(value = "/emp/{id}", method = RequestMethod.GET)
    @ResponseBody
    public Message getEmp(@PathVariable("id") Integer id) {

        Employee employee = employeeService.getEmp(id);
        Message message = Message.succeed().add("emp", employee);
        return message;

    }

    /**
     * 根据ID更新员工
     * @param employee
     * @return
     */
    @RequestMapping(value = "emp/{empId}", method = RequestMethod.PUT)
    @ResponseBody
    public Message updateEmp(Employee employee) {
        System.out.println(employee);
        employeeService.updateEmp(employee);
        return Message.succeed();
    }

    /**
     * 根据id删除员工
     * 整合单个删除 1
     * 和多个删除 1-2-3
     * @param ids
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/emp/{ids}", method = RequestMethod.DELETE)
    public Message deleteEmp(@PathVariable("ids") String ids) { // 这里的@PathVariable("ids")一定要加 因为前端过来的请求参数不一样
        if (ids.contains("-")) {
            String[] str_ids = ids.split("-");
            ArrayList<Integer> del_ids = new ArrayList<Integer>();
            for (String str_id : str_ids) {
                del_ids.add(Integer.parseInt(str_id));
            }
            employeeService.deleteBatch(del_ids);
        } else {
            // 单个删除
            int id = Integer.parseInt(ids);
            employeeService.deleteEmp(id);
        }
        return Message.succeed();
    }
    /*
    @RequestMapping("/emps")
    public ModelAndView getAll(@RequestParam(value = "pn", defaultValue = "1") Integer pn) {
        ModelAndView modelAndView = new ModelAndView();
        // 在查询之前调用PageHelper.startPage, 设置从哪一页开始，每页几条
        PageHelper.startPage(pn, 5);
        // startPage后紧跟的查询
        List<Employee> employeeList = employeeService.getAll();
        // 使用PageInfo封装查询结果，返回页面，设置导航栏连续显示的页数
        PageInfo<Employee> pageInfo = new PageInfo<Employee>(employeeList, 5);
        System.out.println(pageInfo);
        modelAndView.addObject("pageInfo", pageInfo);
        modelAndView.setViewName("list");
        return modelAndView;
    }

    */
}
