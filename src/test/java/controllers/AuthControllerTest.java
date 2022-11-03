package controllers;

import com.marjan.controllers.AuthController;
import org.junit.jupiter.api.Test;

import java.util.Objects;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

class AuthControllerTest {

    // authentication for the general admin
    @Test
    void authenticationForTheSuperAdmin() {
        assertNotNull(AuthController.isAdminAuth("generalMarjan", "marjan1234"));
    }

    // authentication for the admin
    @Test
    void authenticationForTheAdmin() {
        assertNotNull(AuthController.isUserAuth("saadchaay27@gmail.com", "saad1234"));
        assertEquals("ADMIN", Objects.requireNonNull(AuthController.isUserAuth("saadchaay27@gmail.com", "saad1234")).getRole());
    }

    // authentication for the manager
    @Test
    void authenticationForTheManager() {
        assertNotNull(AuthController.isUserAuth("chaaysaad@gmail.com", "saad1234"));
        assertEquals("MANAGER", Objects.requireNonNull(AuthController.isUserAuth("chaaysaad@gmail.com", "saad1234")).getRole());
    }

    @Test
    void getTheNameOfUser(){
        assertEquals("admin three", Objects.requireNonNull(AuthController.isUserAuth("chaaysaad@gmail.com", "saad1234")).getName());
    }
}
