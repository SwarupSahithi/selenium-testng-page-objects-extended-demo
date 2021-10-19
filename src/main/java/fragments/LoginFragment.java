package fragments;

import org.openqa.selenium.WebDriver;
import pages.BasePage;
import pages.HomePage;
import pages.LoginPage;

/**
 * Project Name    : selenium-testng-page-objects-extended-demo
 * Developer       : Osanda Deshan
 * Version         : 1.0.0
 * Date            : 8/25/2020
 * Time            : 10:09 PM
 * Description     :
 **/

public class LoginFragment extends BasePage {

    private final LoginPage loginPage;
    private final HomePage homePage;

    public LoginFragment(WebDriver driver) {
        super(driver);
        loginPage = new LoginPage(driver);
        homePage = new HomePage(driver);
    }

    public HomePage login(String email, String password) {
        loginPage
                .setEmail(email)
                .setPassword(password)
                .clickOnSignInButton();
        return homePage;
    }

    public LoginPage logout() {
        homePage.clickOnLogoutLink();
        return loginPage;
    }
}
