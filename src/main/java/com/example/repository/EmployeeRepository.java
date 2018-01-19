package com.example.repository;

//import org.springframework.data.repository.CrudRepository;

import com.example.model.Employee;
import org.springframework.dao.DataAccessException;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface EmployeeRepository  extends CrudRepository<Employee, Long> {
	
	List<Employee> findAll() throws DataAccessException;

	List<Employee> findByEmailLike(String email) throws DataAccessException;

	Employee findById(long empNo)throws DataAccessException;

//	void save(Employee employee) throws DataAccessException;
	
//	void delete(long string) throws DataAccessException;
	
	Page<Employee> findAll(Pageable pageable) throws DataAccessException;


}
