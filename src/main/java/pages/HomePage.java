package pages;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;

import static base.PageTitles.MY_STORE_PAGE_TITLE;
import static org.testng.Assert.assertEquals;

/**
 * Project Name    : selenium-testng-page-objects-extended-demo
 * Developer       : Osanda Deshan
 * Version         : 1.0.0
 * Date            : 7/15/2019
 * Time            : 11:56 AM
 * Description     :
 **/

public class HomePage extends BasePage {

    private final By PROFILE_NAME_LABEL = By.xpath("//a[@class='account']/span");
    private final By LOGOUT_LINK = By.xpath("//a[@class='logout']");

    public HomePage(WebDriver driver) {
        super(driver);
    }

    public HomePage clickOnLogoutLink() {
        click(LOGOUT_LINK);
        return this;
    }

    public HomePage checkHomePageTitle() {
        assertEquals(driver.getTitle(), MY_STORE_PAGE_TITLE.getValue());
        return this;
    }

    public HomePage checkLoggedInUsername(String username) {
        assertEquals(getText(PROFILE_NAME_LABEL), username);
        return this;
    }
}
