package com.example.repository;

import com.example.model.Location;
import com.example.model.Role;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository("locationRepository")
public interface LocationRepository extends JpaRepository<Location, Integer>{;

}
