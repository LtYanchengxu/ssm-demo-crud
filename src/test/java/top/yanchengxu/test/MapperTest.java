package top.yanchengxu.test;

import com.sun.tracing.dtrace.Attributes;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import top.yanchengxu.bean.Department;
import top.yanchengxu.bean.Employee;
import top.yanchengxu.dao.DepartmentMapper;
import top.yanchengxu.dao.EmployeeMapper;

import java.util.UUID;

@ContextConfiguration("classpath:spring.xml")
@RunWith(SpringJUnit4ClassRunner.class)
public class MapperTest {

    /*
    @Autowired
    private DepartmentMapper departmentMapper;

    @Autowired
    private EmployeeMapper employeeMapper;
    */

    @Autowired
    private SqlSession sqlSession;

    @Test
    public void testCRUD() {
        // System.out.println(departmentMapper);
        // departmentMapper.insertSelective(new Department(null, "开发部"));
        // departmentMapper.insertSelective(new Department(null, "测试部"));
        // employeeMapper.insertSelective(new Employee(null, "Tom", "M", "tom@yanchengxu.top", 1));
        /*批量生成员工数据*/
        EmployeeMapper mapper = sqlSession.getMapper(EmployeeMapper.class);
        for (int i = 0; i < 1000; i++) {
            String s = UUID.randomUUID().toString().substring(0, 5);
            mapper.insertSelective(new Employee(null, s, "M", s + "@yanchengxu.top", 1));
        }
        System.out.println("batch finished");
    }

}
