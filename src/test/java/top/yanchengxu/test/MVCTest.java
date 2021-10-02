package top.yanchengxu.test;

import com.github.pagehelper.PageInfo;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MockMvcBuilder;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;
import top.yanchengxu.bean.Employee;

import java.util.List;

@ContextConfiguration(locations = {"classpath:spring.xml", "classpath:spring-mvc.xml" })
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
public class MVCTest {

    private MockMvc mockMvc;
    // 获取ioc容器本身
    @Autowired
    WebApplicationContext context;

    @Before
    public void before() {
        mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
    }

    @Test
    public void testMVC() throws Exception {
        MvcResult result = mockMvc.perform(MockMvcRequestBuilders.get("/emps")
                .param("pn", "1")).andReturn();

        PageInfo<Employee> pageInfo = (PageInfo<Employee>) result.getRequest().getAttribute("pageInfo");
        System.out.println("当前页码" + pageInfo.getPageNum());
        System.out.println("总页码" + pageInfo.getPages());
        System.out.println("总记录数" + pageInfo.getTotal());
        System.out.print("在页面需要显示的页码");
        int[] nums = pageInfo.getNavigatepageNums();
        for (int num : nums) {
            System.out.print(" " + num);
        }
        System.out.println();
        // 获取员工数据
        List<Employee> employeeList = pageInfo.getList();
        for (Employee employee : employeeList) {
            System.out.println(employee);
        }
    }
}
