package com.example.service;

import com.example.model.Location;
import com.example.model.Role;
import com.example.model.User;
import com.example.repository.LocationRepository;
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
import java.util.List;
import java.util.Set;
import java.util.logging.Logger;

@Service()
public class Bootstrap implements InitializingBean {


    @Autowired
    UserRepository userRepository;

    @Autowired
    private RoleRepository roleRepository;

    @Autowired
    private LocationRepository locationRepository;

    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;


    @Override
    @Transactional()
    public void afterPropertiesSet() throws Exception {
        System.out.println("Bootstrapping data...");

        createSystemUser();
        createLocations();

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

        User user = userRepository.findByEmail("admin@gsk-csr.com");
        if (user == null) {
            user = new User();
            user.setPassword("admin");
            user.setName("admin");
            user.setLastName("admin");
            user.setEmail("admin@gsk-csr.com");
            user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
            user.setActive(1);
            userRole = roleRepository.findByRole("ADMIN");
            user.setRoles(new HashSet<Role>(Arrays.asList(userRole)));
            userRepository.saveAndFlush(user);
        }
    }

    private void createLocations() {
        System.out.println("... creating locations");
        List<Location> locations = locationRepository.findAll();
        if (locations.size() == 0) {
            locations.add(new Location(15.3647083, 75.1239547, "Mid-day meal programme in government schools", "Hubli, Karnataka", "The Akshaya Patra Foundation"));

            locations.add(new Location(25.8715807208424, 85.7609939575195, "School nutrition awareness programme", "Bihar (Samastipur)", "SHARP"));
            locations.add(new Location(26.7605545, 83.3731675, "School nutrition awareness programme", "UP (Gorakhpur)", "SHARP"));
            locations.add(new Location(23.838805, 78.7378068, "School nutrition awareness programme", "MP (Sagar)", "SHARP"));
            locations.add(new Location(15.3647083, 75.1239547, "School nutrition awareness programme", "Karnataka (Hubli)", "SHARP"));

            locations.add(new Location(28.4594965, 77.0266383, "Nutrition programme for out of school children", "Gurgaon, Haryana", "Sakshi"));

            locations.add(new Location(26.7605545, 83.3731675, "Allied against Dengue", "UP (Gorakhpur)", "Wish Foundation"));
            locations.add(new Location(25.3176452, 82.9739144, "Allied against Dengue", "UP (Varanasi)", "Wish Foundation"));
            locations.add(new Location(25.4358011, 81.846311, "Allied against Dengue", "UP (Allahabad)", "Wish Foundation"));
            locations.add(new Location(26.7732476, 82.1441643, "Allied against Dengue", "UP (Faizabad)", "Wish Foundation"));
            locations.add(new Location(25.1336987, 82.5644344, "Allied against Dengue", "UP (Mirzabad)", "Wish Foundation"));


            locations.add(new Location(25.8715807208424, 85.7609939575195, "Safe and nutritious food at school programme", "Bihar (Samastipur)", "FSSAI"));
            locations.add(new Location(26.7605545, 83.3731675, "Safe and nutritious food at school programme", "UP (Gorakhpur)", "FSSAI"));
            locations.add(new Location(23.838805, 78.7378068, "Safe and nutritious food at school programme", "MP (Sagar)", "FSSAI"));
            locations.add(new Location(15.3647083, 75.1239547, "Safe and nutritious food at school programme", "Karnataka (Hubli)", "FSSAI"));

            locations.add(new Location(30.3736743, 76.1451904, "Water sanitation & Hygiene and nutrition programme", "Nabha (Punjab)", "JSI R&T India Foundation"));

            locations.add(new Location(17.0005383, 81.8040344999999, "Anemia and nutrition programme", "Rajahmundri", "Save the Children"));

            locations.add(new Location(29.0523053, 76.9182097, "Improving health & nutrition programme", "Sonipat", "Sakshi"));

            locations.add(new Location(25.0960742, 85.3131194, "Disaster response programme- flood rehabilitation", "Assam", "Save the Children."));
            locations.add(new Location(26.2006043, 92.9375738999999, "Disaster response programme- flood rehabilitation", "Bihar", "Save the Children."));


            locationRepository.save(locations);
        }
    }

}