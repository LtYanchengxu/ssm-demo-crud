package top.yanchengxu.service;

import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import top.yanchengxu.bean.Employee;
import top.yanchengxu.bean.EmployeeExample;
import top.yanchengxu.dao.EmployeeMapper;

import java.util.ArrayList;
import java.util.List;

@Service
public class EmployeeService {
    @Autowired
    private EmployeeMapper employeeMapper;

    /**
     * 查询所有员工
     * @return
     */
    public List<Employee> getAll() {
        PageHelper pageHelper = new PageHelper();
        List<Employee> employeeList = employeeMapper.selectByExampleWithDept(null);
        return employeeList;
    }

    public void saveEmp(Employee employee) {
        employeeMapper.insertSelective(employee);

    }

    /**
     * 新增前查询是否重名
     * @param empName 名字
     * @return true->不重名->可以添加
     */
    public Boolean checkEmpName(String empName) {
        EmployeeExample example = new EmployeeExample();
        EmployeeExample.Criteria criteria = example.createCriteria();
        criteria.andEmpNameEqualTo(empName);
        long count = employeeMapper.countByExample(example);
        // System.out.println("count:" + count );
        return count == 0;

    }

    public Employee getEmp(Integer id) {

        Employee employee = employeeMapper.selectByPrimaryKey(id);
        return employee;

    }

    public void updateEmp(Employee employee) {
        employeeMapper.updateByPrimaryKeySelective(employee);
    }

    public void deleteEmp(Integer id) {
        employeeMapper.deleteByPrimaryKey(id);
    }

    public void deleteBatch(ArrayList<Integer> del_ids) {

        EmployeeExample example = new EmployeeExample();
        EmployeeExample.Criteria criteria = example.createCriteria();
        criteria.andEmpIdIn(del_ids);
        employeeMapper.deleteByExample(example);
    }
}
