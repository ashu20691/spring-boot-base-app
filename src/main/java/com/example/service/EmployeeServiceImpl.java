package com.example.service;

import com.example.model.Employee;
import com.example.repository.EmployeeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;


@Service("employeeService")
public class EmployeeServiceImpl implements EmployeeService {

    private static final int PAGE_SIZE = 10;


    private EmployeeRepository employeeRepository;


    @Autowired
    public EmployeeServiceImpl(EmployeeRepository employeeRepository) {
        this.employeeRepository = employeeRepository;
    }

    @Override
    public Employee findEmployeeById(long empNo) throws DataAccessException {
        return employeeRepository.findById(empNo);
    }

    @Override
    public List<Employee> findEmployees() throws DataAccessException {
        List<Employee> results = this.employeeRepository.findAll();
        return results;
    }

    @Override
    public void saveEmployee(Employee employee) throws DataAccessException {
        employeeRepository.save(employee);
    }

//	    @Override
//	    public void deleteEmployee(Employee employee) throws DataAccessException {
//	            employeeJpaRepository.delete(setEmpNo(employee));
//	        }

    @Override
    public Page<Employee> findPagedEmployees(Pageable pg) throws DataAccessException {
        Page<Employee> results = this.employeeRepository.findAll(pg);
        return results;
    }

    @Override
    public List<Employee> searchByEmail(String email) throws DataAccessException {
        List<Employee> results= this.employeeRepository.findByEmailLike(email);
        return results;
    }



}
