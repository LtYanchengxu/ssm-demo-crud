package top.yanchengxu.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import top.yanchengxu.bean.Department;
import top.yanchengxu.dao.DepartmentMapper;

import java.util.List;

@Service
public class DepartmentService {

    @Autowired
    private DepartmentMapper departmentMapper;

    public List<Department> getDepts() {

        List<Department> departmentList = departmentMapper.selectByExample(null);
        return departmentList;
    }
}
