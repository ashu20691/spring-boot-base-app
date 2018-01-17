package com.example.service;

import com.example.model.Role;
import com.example.model.User;
import com.example.repository.RoleRepository;
import com.example.repository.UserRepository;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;
import java.util.logging.Logger;

@Service()
public class Bootstrap implements InitializingBean {


    @Autowired
    UserRepository userRepository;

    @Autowired
    private RoleRepository roleRepository;

    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;


    @Override
    @Transactional()
    public void afterPropertiesSet() throws Exception {
        System.out.println("Bootstrapping data...");

        createSystemUser();

        System.out.println("...Bootstrapping completed");
    }

    private void createSystemUser() {

        System.out.println("... creating system user");
        Role userRole = roleRepository.findByRole("ADMIN");
        if (userRole == null) {
            Role role = new Role();
            role.setRole("ADMIN");
            roleRepository.saveAndFlush(role);
        }
        User user = userRepository.findByEmail("admin@gst.com");
        if (user == null) {
            user = new User();
            user.setPassword("admin");
            user.setName("admin");
            user.setLastName("admin");
            user.setEmail("admin@gst.com");
            user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
            user.setActive(1);
            userRole = roleRepository.findByRole("ADMIN");
            user.setRoles(new HashSet<Role>(Arrays.asList(userRole)));
            userRepository.saveAndFlush(user);
        }
    }

}
