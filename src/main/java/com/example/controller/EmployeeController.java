package com.example.controller;


import com.example.model.Employee;
import com.example.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.method.annotation.StreamingResponseBody;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.io.*;
import java.util.List;


@Controller
public class EmployeeController {

    @Autowired
    private EmployeeService employeeService;


    @Autowired
    public EmployeeController(EmployeeService employeeService) {
        this.employeeService = employeeService;
    }

    @RequestMapping(value = "/employees/pages", method = RequestMethod.GET)
    public String showPages(Model model, @PageableDefault(page = 0, size = 20, direction = Direction.ASC, sort = {"firstName"}) Pageable pg) {
        Page<Employee> results = this.employeeService.findPagedEmployees(pg);
        model.addAttribute("listemp", results);
        return "/employees/page1";
    }

    @RequestMapping(value = "/employees", method = RequestMethod.GET)
    public ResponseEntity<List<Employee>> getEmployeesList() {
        List<Employee> results = this.employeeService.findEmployees();
        ModelAndView model1 = new ModelAndView("employees");
        model1.addObject("listemp", results);
        return new ResponseEntity<List<Employee>>(results, HttpStatus.OK);
    }

    @RequestMapping(value = "/export", method = RequestMethod.GET)
    public StreamingResponseBody export(HttpServletResponse response) throws IOException {
        List<Employee> results = this.employeeService.findEmployees();
        response.setContentType("application/csv");
        response.setHeader("Content-Disposition", "attachment; filename=\"employee.csv\"");
        File file = File.createTempFile("employee", ".csv");
        FileWriter fw = new FileWriter(file);
        fw.write("id,email,firstName,lastName,education");
        fw.write("\n");

        results.forEach((e) -> {
            try {
                fw.write(e.getId() + "," + e.getEmail() + "," + e.getFirstName() + "," + e.getLastName() + "," + e.getMobile());
                fw.write("\n");
            } catch (IOException err) {
                System.out.println(err);
            }
        });

        fw.close();

        InputStream inputStream = new FileInputStream(file);
        return outputStream -> {
            int nRead;
            byte[] data = new byte[1024];
            while ((nRead = inputStream.read(data, 0, data.length)) != -1) {
                System.out.println("Writing some bytes..");
                outputStream.write(data, 0, nRead);
            }
        };
    }

    @RequestMapping(value = "/employees/add", method = RequestMethod.GET)
    public ModelAndView addForm() {
        return new ModelAndView("employees/add", "employee", new Employee());
    }

    @RequestMapping(value = "/employees/save", method = RequestMethod.POST)
    public String processAdd(@Valid @RequestBody Employee employee,
                             BindingResult result, ModelMap model) {
        if (result.hasErrors()) {
            System.out.println(result.getAllErrors());
//            return "employees/add";
        }
        this.employeeService.saveEmployee(employee);
        return "redirect:/employees";
    }


    @RequestMapping(value = "/employees/edit/{empNo}", method = RequestMethod.GET)
    public String editForm(@PathVariable("empNo") long empNo, Model model) {
        Employee employee = this.employeeService.findEmployeeById(empNo);
        model.addAttribute(employee);
        return "employees/edit";
    }

    @RequestMapping(value = "/employees/update", method = RequestMethod.POST)
    public String processUpdate(@Valid @ModelAttribute("employee") Employee employee,
                                BindingResult result, ModelMap model) {
        if (result.hasErrors()) {
            return "employees/edit";
        }
        this.employeeService.saveEmployee(employee);
        return "redirect:/employees";
    }

    @RequestMapping(value = "/employees/find", method = RequestMethod.GET)
    public String getEmployee(@RequestParam("searchText") String searchText, Model model) {
        List<Employee> employees = this.employeeService.searchByEmail(searchText);
        model.addAttribute(employees);
        return "employees/find";
    }
}