package base;

import org.openqa.selenium.WebDriver;
import pages.HomePage;
import pages.LoginPage;

/**
 * Project Name    : selenium-testng-page-objects-extended-demo
 * Developer       : Osanda Deshan
 * Version         : 1.0.0
 * Date            : 8/26/2020
 * Time            : 8:50 AM
 * Description     :
 **/

public class PageProvider {

    private final WebDriver driver;

    public PageProvider(WebDriver driver) {
        this.driver = driver;
    }

    public LoginPage getLoginPage() {
        return new LoginPage(driver);
    }

    public HomePage geHomePage() {
        return new HomePage(driver);
    }
}
