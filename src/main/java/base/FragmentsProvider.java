package base;

import fragments.LoginFragment;
import org.openqa.selenium.WebDriver;

/**
 * Project Name    : selenium-testng-page-objects-extended-demo
 * Developer       : Osanda Deshan
 * Version         : 1.0.0
 * Date            : 8/26/2020
 * Time            : 8:50 AM
 * Description     :
 **/

public class FragmentsProvider {

    private final WebDriver driver;

    public FragmentsProvider(WebDriver driver) {
        this.driver = driver;
    }

    public LoginFragment getLoginFragment() {
        return new LoginFragment(driver);
    }
}
