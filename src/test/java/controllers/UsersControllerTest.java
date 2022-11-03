package controllers;

import com.marjan.controllers.UsersController;
import com.marjan.dao.UsersDao;
import com.marjan.entities.Users;
import com.marjan.helpers.Enum;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class UsersControllerTest {

    private final Users user ;

    public UsersControllerTest() {
        user = new Users();
    }

    @Test
    void addUserRoleManager(){
        user.setName("Saad chaay");
        user.setRole(Enum.role.MANAGER.toString());
        user.setEmail("saadchaay27@gmail.com");
        user.setPassword("saad1234");
        user.setStoreId(2);
        assertNotNull(UsersController.addUser(user.getName(),
                user.getRole(),
                user.getEmail(),
                user.getPassword(),
                (long) user.getStoreId()));
    }

    @Test
    void addUserRoleAdmin(){
        user.setName("Fadwkd ulike");
        user.setRole(Enum.role.ADMIN.toString());
        user.setEmail("fadw393@gmail.com");
        user.setPassword("fadw1234");
        user.setStoreId(4);
        assertTrue(UsersController.addUser(user.getName(),
                user.getRole(),
                user.getEmail(),
                user.getPassword(),
                (long) user.getStoreId()));
    }

    @Test
    void listAllUsers(){
        assertNotNull(new UsersDao().all());
        assertEquals("ADMIN", new UsersDao().all().get(0).getRole());
    }

    @Test
    void getTheFirstUserRole(){
        assertEquals("MANAGER", new UsersDao().all().get(0).getRole());
    }

}