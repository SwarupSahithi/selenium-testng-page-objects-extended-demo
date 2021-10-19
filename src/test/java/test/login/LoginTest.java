package test.login;

import fragments.LoginFragment;
import org.testng.annotations.BeforeMethod;
import org.testng.annotations.Test;
import test.BaseTest;

/**
 * Project Name    : selenium-testng-page-objects-extended-demo
 * Developer       : Osanda Deshan
 * Version         : 1.0.0
 * Date            : 7/15/2019
 * Time            : 12:02 PM
 * Description     :
 **/

public class LoginTest extends BaseTest {

    private LoginFragment loginFragment;

    @BeforeMethod
    public void before() {
        loginFragment = fragments().getLoginFragment();
    }

    @Test
    public void testValidUserLogin() {
        loginFragment
                .login("osanda@mailinator.com", "1qaz2wsx@")
                .checkHomePageTitle()
                .checkLoggedInUsername("Osanda Nimalarathna");
    }

    @Test
    public void testInvalidUserLogin() {
        loginFragment
                .login("osanda@mailinator.com", "1qaz2wsx");
        pages().getLoginPage()
                .checkLoginPageTitle();
    }
}
