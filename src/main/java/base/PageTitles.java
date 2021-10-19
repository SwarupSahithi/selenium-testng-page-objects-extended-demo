package base;

/**
 * Project Name    : selenium-testng-page-objects-extended-demo
 * Developer       : Osanda Deshan
 * Version         : 1.0.0
 * Date            : 8/25/2020
 * Time            : 10:16 PM
 * Description     :
 **/

public enum PageTitles {

    LOGIN_PAGE_TITLE("Login - My Store"),
    MY_STORE_PAGE_TITLE("My account - My Store");

    public final String title;

    PageTitles(String title) {
        this.title = title;
    }

    public String getValue() {
        return title;
    }
}
