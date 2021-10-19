package test.login;

import fragments.LoginFragment;
import org.testng.annotations.BeforeMethod;
import org.testng.annotations.Test;
import test.BaseTest;

/**
 * Project Name    : selenium-testng-page-objects-extended-demo
 * Developer       : Osanda Deshan
 * Version         : 1.0.0
 * Date            : 10/19/2021
 * Time            : 12:17 PM
 * Description     :
 **/

public class LogoutTest extends BaseTest {

    private LoginFragment loginFragment;

    @BeforeMethod
    public void before() {
        loginFragment = fragments().getLoginFragment();
        loginFragment
                .login("osanda@mailinator.com", "1qaz2wsx@");
    }

    @Test
    public void testLogout() {
        loginFragment
                .logout()
                .checkLoginPageTitle();
    }
}
