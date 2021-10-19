package pages;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;

import static base.PageTitles.LOGIN_PAGE_TITLE;
import static org.testng.Assert.assertEquals;

/**
 * Project Name    : selenium-testng-page-objects-extended-demo
 * Developer       : Osanda Deshan
 * Version         : 1.0.0
 * Date            : 7/15/2019
 * Time            : 12:01 PM
 * Description     :
 **/

public class LoginPage extends BasePage {

    private final By EMAIL_TEXT_BOX = By.id("email");
    private final By PASSWORD_TEXT_BOX = By.id("passwd");
    private final By SIGN_IN_BUTTON = By.id("SubmitLogin");

    public LoginPage(WebDriver driver) {
        super(driver);
    }

    public LoginPage setEmail(String email) {
        sendKeys(EMAIL_TEXT_BOX, email);
        return this;
    }

    public LoginPage setPassword(String password) {
        sendKeys(PASSWORD_TEXT_BOX, password);
        return this;
    }

    public LoginPage clickOnSignInButton() {
        click(SIGN_IN_BUTTON);
        return this;
    }

    public LoginPage checkLoginPageTitle() {
        assertEquals(driver.getTitle(), LOGIN_PAGE_TITLE.getValue());
        return this;
    }
}
