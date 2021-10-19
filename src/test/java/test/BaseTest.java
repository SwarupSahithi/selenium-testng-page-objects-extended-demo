package test;

import base.FragmentsProvider;
import base.PageProvider;
import com.maxsoft.testngtestresultsanalyzer.TestAnalyzeReportListener;
import org.openqa.selenium.WebDriver;
import org.testng.annotations.AfterMethod;
import org.testng.annotations.BeforeMethod;
import org.testng.annotations.Listeners;
import util.driver.DriverFactory;

import static com.maxsoft.testngtestresultsanalyzer.DriverHolder.getDriver;
import static com.maxsoft.testngtestresultsanalyzer.DriverHolder.setDriver;
import static org.openqa.selenium.remote.BrowserType.CHROME;

/**
 * Project Name    : selenium-testng-page-objects-extended-demo
 * Developer       : Osanda Deshan
 * Version         : 1.0.0
 * Date            : 10/19/2021
 * Time            : 8:45 AM
 * Description     :
 **/

@Listeners(TestAnalyzeReportListener.class)
public class BaseTest {

    protected WebDriver driver;

    @BeforeMethod
    public void spinUpDriver() {
        setDriver(DriverFactory.getNewDriverInstance(CHROME));
        driver = getDriver();
        driver.manage().window().maximize();
        driver.navigate().to("http://automationpractice.com/index.php?controller=authentication&back=my-account");
    }

    @AfterMethod
    public void killDriver() {
        driver.quit();
    }

    protected PageProvider pages() {
        return new PageProvider(driver);
    }

    protected FragmentsProvider fragments() {
        return new FragmentsProvider(driver);
    }
}
