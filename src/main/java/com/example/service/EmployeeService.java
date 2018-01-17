package com.example.service;

import org.springframework.dao.DataAccessException;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.upwork.employee.enity.Employee;

import java.util.List;

public interface EmployeeService {

	Employee findEmployeeById(long empNo) throws DataAccessException;

	void saveEmployee(Employee employee) throws DataAccessException;

	List<Employee> findEmployees() throws DataAccessException;

    Page<Employee> findPagedEmployees(Pageable pageable) throws DataAccessException;
	
//	void deleteEmployee(long empNo) throws DataAccessException;

}
