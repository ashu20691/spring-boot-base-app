package com.example.model;


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
	Long id;
	
	@Column(name="empNo")
	private long empNo;
	
	private long companyId
	;

	@Column(name="firstName")
	@NotNull
	@Size(min=2, max=15)
	private String firstName;

	@Column(name="lastName")
	@NotNull
	@Size(min=2, max=15)
	private String lastName;

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

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	
	
}
