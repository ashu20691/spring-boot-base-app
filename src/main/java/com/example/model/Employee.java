package com.example.model;


import org.hibernate.validator.constraints.Email;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.io.Serializable;

@Entity
@NamedQuery(name="Employee.findByEmpNo",
                query="SELECT e FROM Employee e WHERE empNo = :empNo")
@Table(name="employees")
public class Employee implements Serializable {

	@Id
	@GeneratedValue
	private Long id;
	
	@Column(name="empNo")
	private long empNo;
	
	private long companyId;

	@Column(name="name")
	@NotNull
	@Size(min=2, max=15)
	private String name;

	@Column(name="email")
	@NotNull
	@Email
	private String email;

	@Column(name="mobile")
	@NotNull
	private String mobile;


	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}


	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public long getEmpNo() {
		return empNo;
	}

	public void setEmpNo(long empNo) {
		this.empNo = empNo;
	}

	public long getCompanyId() {
		return companyId;
	}

	public void setCompanyId(long companyId) {
		this.companyId = companyId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}


}
