package cucumber.suite.glue;

import com.codeborne.selenide.Condition;
import com.codeborne.selenide.Configuration;
import com.codeborne.selenide.SelenideElement;
import com.codeborne.selenide.junit.ScreenShooter;
import cucumber.api.java.Before;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.suite.framework.Constants;
import cucumber.suite.framework.ParentScenario;
import cucumber.suite.model.PrintPdfResponse;
import org.apache.commons.lang3.StringUtils;
import org.hamcrest.core.IsNull;
import org.joda.time.DateTime;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;
import org.junit.Rule;
import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.test.context.ContextConfiguration;
import uk.co.tso.automation.AutomationCoreConfig;
import uk.co.tso.automation.service.WebdriverProvider;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.math.BigInteger;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.concurrent.ThreadLocalRandom;

import static com.codeborne.selenide.Condition.*;
import static com.codeborne.selenide.Selectors.*;
import static com.codeborne.selenide.Selenide.*;
import static com.codeborne.selenide.WebDriverRunner.*;
import static org.apache.commons.lang3.RandomStringUtils.randomAlphanumeric;
import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.*;
import static org.hamcrest.Matchers.not;
import static org.hamcrest.core.Is.is;
import static org.junit.Assert.assertTrue;
import static org.openqa.selenium.By.tagName;

@ContextConfiguration(classes = AutomationCoreConfig.class)
public class StepDefinitions {

    public static final String TEMP_MAIL = "http://www.mail.com/en/";

    public int currentWindows = 1;

    @Value("${quartz.url}")
    private String quartzUrl;

    @Value("${override.captcha.answer}")
    private String captchaAnswer;

    @Value("${root.web.url}")
    private String rootWebUrl;

    private static String BASE_UPLOAD_DIRECTORY = System.getProperty("user.dir") + "\\target\\test-classes\\uploads";

    private Properties OR;

    @Autowired
    private ParentScenario parentScenario;

    @Rule
    public ScreenShooter makeScreenshotOnFailure = ScreenShooter.failedTests();

    private String randomstr1;

    private String randomstr2;

    private Selector selector;

    private String note;

    private String email;

    private String issueNumber;

    private PrintPdfResponse printPdfResponse;

    private String windowHandle;

    @Before
    public void setup() {
        Configuration.timeout = 60000L;
        try {
            OR = new Properties();
            FileInputStream ip = new FileInputStream(System.getProperty("user.dir") + "//src//test//resources//config//OR.properties");
            OR.load(ip);
        } catch (IOException e) {
            e.printStackTrace();
        }
        if (isIE()) {
            clearBrowserCache();
        }
    }

    @Before("@idSelector")
    public void setIdSelector() {
        this.selector = Selector.ID;
    }

    @Before("@xpathSelector")
    public void setXpathSelector() {
        this.selector = Selector.XPATH;
    }

    @Before("@cssSelector")
    public void setCssSelector() {
        this.selector = Selector.CSS;
    }

    @Before("@classSelector")
    public void setClassSelector() {
        this.selector = Selector.CLASS;
    }

    @Before("@textSelector")
    public void setTextSelector() {
        this.selector = Selector.TEXT;
    }

    @Before("@cleanDownloadsDirectory")
    public void cleanDownloads() {
        File[] files = new File(Constants.DOWNLOAD_DIRECTORY).listFiles();
        // find signature file name
        for (File file : files) {
            file.delete();
        }
    }

    @And("^I am on the site homepage$")
    public void I_am_on_the_site_homepage() {
        parentScenario.navigateToHomepage();
    }

    @And("^I navigate to (.*)$")
    public void I_navigate_to(String url) throws IOException {
        if (url.contains("'my note'") && note != null) {
            url = url.replace("'my note'", note);
        }
        parentScenario.navigateToPage(url);
    }

    @And("^the text (.*) should be visible$")
    public void the_text_should_be_visible(String text) throws IOException {
        text = swapForInstanceVariableText(text);
        assertTrue($(byXpath(".//*")).getText().toLowerCase().contains(text.toLowerCase()));
    }

    @And("^the text (.*) should not be visible$")
    public void the_text_should_not_be_visible(String text) throws IOException {
        text = swapForInstanceVariableText(text);
        $(withText(text)).shouldNotBe(visible);
    }

    @And("^I click (.*)$")
    public void I_click(String input) throws IOException {
        I_scroll_to(input);
        bySelector(input).click();
    }


    @And("^I page down from (.*)$")
    public void I_page_down_From(String input) throws IOException {
        if (StringUtils.isNotBlank(input))
            bySelector(input).sendKeys(Keys.PAGE_DOWN);
    }

    @And("^I page_down from element id (.*)$")
    public void I_page_down_From_id(String elementId) throws IOException {
        if (StringUtils.isNotBlank(elementId))
            bySelector(elementId).sendKeys(Keys.PAGE_DOWN);
    }

    @And("^I page_up from element id (.*)$")
    public void iPage_upFromElementIdNoticeid_gazEarliestPublicationDate(String elementId) throws Throwable {
        if (StringUtils.isNotBlank(elementId))
            bySelector(elementId).sendKeys(Keys.PAGE_UP);
    }

    @And("^I highlight (.*)$")
    public void I_highlight(String input) throws IOException {
        bySelector(input).hover();
    }

    @And("^I highlight text (.*)$")
    public void I_highlighttext(String input) throws IOException {
        $(By.xpath("//p[contains(text(),'10 March 2014')]")).hover();
    }


    @And("^I select (.*) from (.*)$")
    public void I_select_from(String listXpath, String menuXpath) throws IOException {
        bySelector(menuXpath).scrollTo();
        bySelector(menuXpath).hover();
        I_click(listXpath);
    }

    @And("^I select (.*) as (.*)$")
    public void I_select_as(String menuXpath, String value) throws IOException {
        if (menuXpath.startsWith("#")) {
            $(menuXpath).scrollTo();
            $(menuXpath).click();
        } else if (OR.getProperty(menuXpath) != null) {
            $(By.xpath(OR.getProperty(menuXpath))).scrollTo();
            $(By.xpath(OR.getProperty(menuXpath))).click();
        }
        if (!$(By.linkText(value)).is(Condition.visible)) {
            $(By.linkText(value)).scrollTo();
        }
        $(By.linkText(value)).click();
    }

    @And("^I verify (.*) is (.*)$")
    public void I_verify(String fieldId, String value) throws IOException {
        if (StringUtils.isNotBlank(fieldId)) {
            if (fieldId.startsWith("#"))
                assertThat($(fieldId).getValue(), is(swapForInstanceVariableText(value)));
            else {
                assertThat(bySelector(fieldId).getText(), is(swapForInstanceVariableText(value)));
            }
        }
    }

    @And("^I verify (.*) contains text (.*)$")
    public void contains_text(String fieldId, String value) throws IOException {
        String text = swapForInstanceVariableText(value);
        if (StringUtils.isNotBlank(fieldId)) {
            if (fieldId.startsWith("#")) {
                assertTrue($(fieldId).getValue().contains(text));
            } else {
                assertTrue(bySelector(fieldId).getText().contains((text)));
            }
        }
    }

    @And("^I wait for (.*) seconds$")
    public void I_wait_for_seconds(Integer seconds) throws InterruptedException {
        Thread.sleep(seconds * 1000);
    }

    @And("^I wait for (.*) minutes$")
    public void I_wait_for_minutes(Integer minutes) throws InterruptedException {
        Thread.sleep(minutes * 1000 * 60);
    }

    @And("^I wait up to (.*) minutes for (.*) to appear$")
    public void I_wait_to_appear_for_minutes(Integer minutes, String xpathExpression) throws InterruptedException {
        bySelector(xpathExpression).waitUntil(appears, minutes * 1000 * 60);
    }

    @And("^I wait for the page (.*) to load$")
    public void I_wait_for_the_xml_processing_to_complete(String urlPattern) throws InterruptedException {
        int secondsWaited = 0;
        while (secondsWaited <= 120 && !url().matches("^.*" + urlPattern + "$")) {
            Thread.sleep(1000);
            secondsWaited++;
        }
    }

    @And("^(.*) is present$")
    public void Is_present(String xpath) {
        bySelector(xpath).should(exist);
    }

    @Then("^(.*) should be present$")
    public void Should_be_present(String xpath) {
        bySelector(xpath).should(exist);
    }

    @Then("^(.*) should not be present$")
    public void Should_not_be_present(String xpath) {
        bySelector(xpath).shouldNot(exist);
    }

    @Then("^(.*) should say (.*)$")
    public void Should_say(String xpath, String expectedValue) {
        expectedValue = swapForInstanceVariableText(expectedValue);
        bySelector(xpath).shouldHave(text(expectedValue));
    }

    @Then("^(.*) attribute should be (.*)$")
    public void Attribute_should_be(String xpath, String expectedValue) {
        expectedValue = swapForInstanceVariableText(expectedValue);
        bySelector(xpath).shouldHave(attribute("value", expectedValue));
    }

    @And("^I fill in the form$")
    public void I_fill_in_the_text_form(List<FormData> formData) throws IOException {
        for (FormData dataEntry : formData) {
            switch (dataEntry.getFieldType()) {
                case TEXT:
                    I_enter_as(dataEntry.getFieldName(), dataEntry.getFieldValue());
                    break;
                case DATE:
                    I_enter_as(dataEntry.getFieldName(), adjustDate(dataEntry.getFieldValue()));
                    break;
                case SELECT:
                    I_select_as(dataEntry.getFieldName(), dataEntry.getFieldValue());
                    break;
                case EMAIL:
                    email = "automation_".concat(dataEntry.getFieldValue()).concat(randomAlphanumeric(8)).concat("@mail.com");
                    I_enter_as(dataEntry.getFieldName(), email);
                    break;
                default:
                    I_enter_as(dataEntry.getFieldName(), dataEntry.getFieldValue());
                    break;
            }
        }
    }

    @And("^I fill in (.*) as (.*)$")
    public void I_enter_as(String fieldPath, String as) {
        as = populateRandomTextVariable(as);
        as = swapForInstanceVariableText(as);

        if (fieldPath.startsWith("#")) {
            $(fieldPath).scrollTo();
            if ($(fieldPath).getTagName().equalsIgnoreCase("select")) {
                $(fieldPath).selectOptionContainingText(as);
                $(fieldPath).sendKeys(Keys.TAB);
            } else {
                $(fieldPath).clear();
                $(fieldPath).sendKeys(as);
                $(fieldPath).sendKeys(Keys.TAB);
            }
        } else {
            I_scroll_to(fieldPath);
            if (bySelector(fieldPath).getTagName().equalsIgnoreCase("select")) {
                bySelector(fieldPath).selectOptionContainingText(as);
                bySelector(fieldPath).sendKeys(Keys.TAB);
            } else {
                bySelector(fieldPath).clear();
                bySelector(fieldPath).sendKeys(as);
                bySelector(fieldPath).sendKeys(Keys.TAB);
            }
        }
    }

    private String populateRandomTextVariable(String as) {
        if ("'randomstr1'".equals(as)) {
            as = randomAlphanumeric(8).toUpperCase();
            this.randomstr1 = as;
        }
        if ("'randomstr2'".equals(as)) {
            as = randomAlphanumeric(8).toUpperCase();
            this.randomstr2 = as;
        }
        return as;
    }

    @And("^I upload (.*) and a valid (.*)$")
    public void I_upload_digital_signature(String xpathSignedDocument, String xpathSignatureDocument) throws IOException {
        uploadDigitalSignature(xpathSignedDocument, xpathSignatureDocument, true);
    }

    @And("^I update the xml file (.*) to have the correct publication date$")
    public void I_update_the_xml_file_to_have_the_correct_publication_date(String fileName) throws IOException {
        String pattern = "yyyy-MM-dd";
        SimpleDateFormat format = new SimpleDateFormat(pattern);
        Utils.prepareXmlUpload(BASE_UPLOAD_DIRECTORY + fileName, format.format(new Date()));
    }
    @And("^I update (.*) in the xml file (.*) to be (.*) days from current date$")
    public void i_Update_The_XML_To_Have_Correct_Date(String dateToBeChanged,String fileName,Integer numberOfDays) throws Throwable {
        Date date = new Date();
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        calendar.add(Calendar.DATE, numberOfDays);
        date = calendar.getTime();
        SimpleDateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat dateWithMonthFormatter = new SimpleDateFormat("dd MMMM yyyy");
        String replacementText = dateFormatter.format(date)+"\">"+dateWithMonthFormatter.format(date);
        Utils.changeDatesInXml(BASE_UPLOAD_DIRECTORY+fileName,dateToBeChanged,replacementText);
    }


    @And("^I update the rdf file (.*) to have the correct publication date$")
    public void I_update_the_rdf_file_to_have_the_correct_publication_date(String fileName) throws IOException {
        String pattern = "yyyy-MM-dd";
        SimpleDateFormat format = new SimpleDateFormat(pattern);
        Utils.prepareXmlUpload(BASE_UPLOAD_DIRECTORY + fileName, format.format(new Date()));
    }

    @And("^I update the json file (.*) to have the correct publication date$")
    public void I_update_the_json_file_to_have_the_correct_publication_date(String fileName) throws IOException {
        String pattern = "yyyy-MM-dd";
        SimpleDateFormat format = new SimpleDateFormat(pattern);
        Utils.prepareXmlUpload(BASE_UPLOAD_DIRECTORY + fileName, format.format(new Date()));
    }

    @And("^I update the excel file (.*) to have the correct publication date$")
    public void I_update_the_excel_file_to_have_the_correct_publication_date(String fileName) throws IOException {
        String pattern = "yyyy-MM-dd";
        SimpleDateFormat format = new SimpleDateFormat(pattern);
        Utils.prepareExcelUpload(BASE_UPLOAD_DIRECTORY + fileName, format.format(new Date()));
    }

    @And("^I upload the file (.*) to (.*)$")
    public void I_upload_the_file_to(String fileName, String xpath) throws IOException {
        bySelector(xpath).sendKeys(BASE_UPLOAD_DIRECTORY + fileName);
    }

    @And("^I submit the (.*)$")
    public void I_submit_the_xml_upload(String xpath) {
        bySelector(xpath).submit();
    }


    @And("^I upload (.*) and an invalid (.*)$")
    public void I_upload_invalid_digital_signature(String xpathSignedDocument, String xpathSignatureDocument) throws IOException {
        uploadDigitalSignature(xpathSignedDocument, xpathSignatureDocument, false);
    }

    @And("^I keep a note of (.*)$")
    public void I_keep_a_note_of(String note) {
        String text = bySelector(note).getText();
        if (StringUtils.isNotEmpty(text)) {
            this.note = text;
        } else if (StringUtils.isNotEmpty(bySelector(note).getValue())) {
            this.note = bySelector(note).getValue();
        }

    }

    private void uploadDigitalSignature(String xpathSignedDocument, String xpathSignatureDocument, boolean isValidSignature) throws IOException {

        File[] files = new File(Constants.DOWNLOAD_DIRECTORY).listFiles();
        // find signature file name
        List<String> results = new ArrayList<String>();
        String fileName = "";
        for (File file : files) {
            results.add(file.getAbsolutePath());
            if (file.getName().contains("_sig.xml") && !file.getName().contains("(")) {
                fileName = file.getName().substring(0, file.getName().indexOf("_"));
            }
        }
        // get paths of signed document and signature.
        String signedDocumentPath = "";
        String signatureDocumentPath = "";
        for (String path : results) {
            if (path.contains(fileName + ".xml") && !(path.contains("("))) {
                signedDocumentPath = path;
            } else if (path.contains(fileName + "_sig.xml") && !(path.contains("("))) {
                signatureDocumentPath = path;
            }

        }

        // alter the signature file to create an invalid file.
        if (!isValidSignature) {
            File signaturefile = new File(signatureDocumentPath);
            FileOutputStream fo = new FileOutputStream(signaturefile);
            fo.write(100);
            fo.flush();
            fo.close();
        }
        bySelector(xpathSignedDocument).sendKeys(signedDocumentPath);
        bySelector(xpathSignatureDocument).sendKeys(signatureDocumentPath);
    }


    @And("a file called (.*) should be downloaded to my downloads directory")
    public void a_file_called_should_be_downloaded_to_my_downloads_directory(String filename) throws InterruptedException {
        Thread.sleep(1000);
        List<String> results = new ArrayList<String>();
        File[] files = new File(WebdriverProvider.DOWNLOAD_DIRECTORY).listFiles();
        for (File file : files) {
            if (file.isFile()) {
                results.add(file.getName());
            }
        }
        assertThat(results.contains(filename), is(true));
    }

    @And("signed document and signature files should be downloaded to my downloads directory")
    public void signed_document_and_signature_files_should_be_downloaded_to_my_downloads_directory() throws InterruptedException {
        Thread.sleep(1000);
        File[] files = new File(WebdriverProvider.DOWNLOAD_DIRECTORY).listFiles();
        List<String> results = new ArrayList<String>();
        String fileName = "";
        for (File file : files) {
            results.add(file.getName());
            if (file.getName().contains("_sig.xml")) {
                fileName = file.getName().substring(0, file.getName().indexOf("_"));
            }
        }
        assertThat(results.contains(fileName + ".xml"), is(true));
        assertThat(results.contains(fileName + "_sig.xml"), is(true));
    }

    //non-generic, specific to The Gazette
    @And("^I enter credentials as (.*), with a password of (.*)$")
    public void I_sign_in_as_with_a_password_of(String username, String password) {
        $(By.xpath(OR.getProperty("user_signin_input"))).sendKeys(username);
        $(By.xpath(OR.getProperty("password_signin_input"))).sendKeys(password);
    }

    //non-generic, specific to The Gazette
    @And("^I am logged in as (.*), with a password of (.*)$")
    public void I_am_logged_in_with_a_password_of(String username,
                                                  String password) throws IOException {
        parentScenario.navigateToSignInPage();
        I_sign_in_as_with_a_password_of(username, password);
        I_click("signin_button");
    }

    @And("^I empty the basket if not empty before I add more items$")
    public void I_empty_basket_if_not_already_empty() throws InterruptedException {
        int itemsInBasket = Integer.parseInt($(By.id("basket-items-badge")).text());
        if (itemsInBasket > 0) {
            $(By.id("basket-global")).click();
            $(By.id("mini-basket-form")).find(byText("Go to checkout")).click();
            if (itemsInBasket > 1) {
                $(By.id("checkout-empty-form")).find(byText("Remove All")).click();
                $(By.cssSelector(".form-empty-dialog-wrapper")).scrollTo();
                $(By.cssSelector(".form-empty-dialog-wrapper")).find(tagName("Button"), 1).click();
            }
            if (itemsInBasket == 1) {
                $(By.cssSelector(".btn-remove")).click();
                $(By.cssSelector(".item-remove-dialog")).find(tagName("Button"), 1).click();
            }
            parentScenario.navigateToHomepage();
        }
    }

    @And("^I scroll to (.*)$")
    public void I_scroll_to(String xpath) {
        bySelector(xpath).scrollTo();
    }

    @And("^I wait for (.*) to be enabled$")
    public void iWaitForElementToBeEnabled(String elementXpath) throws Throwable {
        bySelector(elementXpath).waitUntil(enabled, 1 * 1000 * 60);
    }

    @Then("^(.*) should be present in (.*)")
    public void errorMessageShouldBePresent(String message, String xpath) throws Throwable {
        assertTrue(bySelector(xpath).getText().contains(message));
    }

    @And("^(.*) date should be (.*) format (.*)$")
    public void notice_draft_modifiedDateShouldBeTodayFormatDdMMMMYyyy(String xpath, String dateAdjust, String format) throws Throwable {
        DateTime dateTime = new DateTime();
        int days = Integer.parseInt(dateAdjust);
        dateTime = dateTime.plusDays(days);
        DateTimeFormatter fmt = DateTimeFormat.forPattern(format);
        assertTrue(fmt.print(dateTime).contains($(By.xpath(OR.getProperty(xpath))).getText()));
    }

    @And("^I make a request xml for a PDF issue with edition: (.*), publication date: (.*), start date time: (.*), end date time: (.*)")
    public void I_make_a_request_xml_for_a_PDF_issue(String edition, String publicationDateString, String startDateTimeString, String endDateTimeString) throws Exception {
        this.issueNumber = new String();

        long thirteenDigitNumber = (long) Math.floor(Math.random() * 9000000000000L) + 1000000000000L;
        long fourDigitNumber = (long) Math.floor(Math.random() * 9000L) + 1000L;
        long sixDigitNumber = (long) Math.floor(Math.random() * 900000L) + 100000L;

        String isbn = String.valueOf(thirteenDigitNumber);
        String pageNumber = String.valueOf(fourDigitNumber);
        String issueNumber = String.valueOf(sixDigitNumber);

        this.issueNumber = issueNumber;

        String fileLocaton = BASE_UPLOAD_DIRECTORY + "\\print-production\\print-production.xml";

        DateTime publicationDate = adjustDateAsDateTime(publicationDateString);
        DateTime startDateTime = adjustDateAsDateTime(startDateTimeString);
        DateTime endDateTime = adjustDateAsDateTime(endDateTimeString);

        String request = Utils.preparePrintPdfRequest(fileLocaton, edition, isbn, publicationDate, startDateTime, endDateTime, pageNumber, issueNumber);
        HttpClient httpClient = new HttpClient();
        this.printPdfResponse = httpClient.doPUT(request, quartzUrl);
    }


    @Then("^there are no missing notices")
    public void There_are_no_missing_notices() {
        assertThat(this.printPdfResponse.getMissingNotices(), is(IsNull.nullValue()));
    }

    @And("^the number of notices in the issue is greater than zero")
    public void The_number_of_notices_in_the_issue_is_greater_than_1() {
        assertThat(this.printPdfResponse.getTotalNotices(), greaterThan(BigInteger.ZERO));
    }

    @Given("^I go to register as (.*) user$")
    public void iGoToRegisterAsResearchUser(String type) throws Throwable {
        parentScenario.navigateToRegistrationPage(type);
    }

    @And("^I fill in captcha field (.*)$")
    public void iFillInCaptcha(String captchaField) throws Throwable {
        I_enter_as(captchaField, captchaAnswer);
    }

    @Then("^I go to temp mail website and change temp mail$")
    public void iGoToTempMailWebsiteAndChangeEmail() throws Throwable {
        open(TEMP_MAIL);
        I_enter_as("mail_username_field", email.split("@")[0]);
        I_wait_for_seconds(2);
        I_click("mail_check_inbox_btn");
    }

    @And("^I confirm registration$")
    public void iConfirmRegistration() throws Throwable {
        windowHandle = getWebDriver().getWindowHandle();
        getWebDriver().switchTo().frame("ifmail"); //written for mail
        I_wait_for_seconds(3);
        $(By.xpath("//a[contains(text(),'" + rootWebUrl + "')]")).click();
    }

    @And("^I switch to next window$")
    public void iSwitchToNextWindow() throws Throwable {
        int count = (getWebDriver().getWindowHandles()).size();
        if (currentWindows != count) {
            for (String winHandle : getWebDriver().getWindowHandles()) {
                if (!winHandle.equalsIgnoreCase(windowHandle)) {
                    getWebDriver().switchTo().window(winHandle);
                }
            }
            currentWindows = count;
        } else {
            for (String winHandle : getWebDriver().getWindowHandles()) {
                if (winHandle.equalsIgnoreCase(windowHandle)) {
                    getWebDriver().switchTo().window(winHandle);
                }
            }
        }
    }

    @Then("^I am taken to (.*) page$")
    public void iAmTakenToAllNoticesPage(String page) throws Throwable {
        assertTrue(url().endsWith(page));
    }

    private String adjustDate(String dateAdjust) {
        DateTime dateTime = new DateTime();
        int days = Integer.parseInt(dateAdjust);
        dateTime = dateTime.plusDays(days);
        SimpleDateFormat dateFormatter = new SimpleDateFormat("dd/MM/yyyy");
        return dateFormatter.format(dateTime.toDate());
    }

    private DateTime adjustDateAsDateTime(String dateAdjust) {
        DateTime dateTime = new DateTime();
        int days = Integer.parseInt(dateAdjust);
        dateTime = dateTime.plusDays(days);
        return dateTime;
    }

    private String swapForInstanceVariableText(String input) {
        input = "'my note'".equals(input) && this.note != null ? this.note : input;
        input = "email".equals(input) && this.email != null ? this.email : input;
        input = "'issue number'".equals(input) && issueNumber != null ? issueNumber : input;
        input = "'randomstr1'".equals(input) && this.randomstr1 != null ? this.randomstr1 : input;
        input = "'randomstr2'".equals(input) && this.randomstr2 != null ? this.randomstr2 : input;

        return input;
    }

    private SelenideElement bySelector(String input) {
        if (input.startsWith("#")) {
            return $(input);
        }
        if (selector != null) {
            switch (selector) {
                case XPATH:
                    return $(By.xpath(OR.getProperty(input)));
                case CSS:
                    return $(By.cssSelector(input));
                case ID:
                    return $(By.id(input));
                case CLASS:
                    return $(By.className(input));
                case TEXT:
                    return $(byText(input));

                default:
                    return $(By.xpath(OR.getProperty(input)));
            }
        } else {
            return $(By.xpath(OR.getProperty(input)));
        }
    }

    @And("^I randomly click a (.*)$")
    public void iRandomlyClickACompanyLink(String companyLink) throws Throwable {
        int aLink = ThreadLocalRandom.current().nextInt(1, 20);
        companyLink = OR.getProperty(companyLink).replace("RANDOM", String.valueOf(aLink));

        $(By.xpath(companyLink)).scrollTo();
        $(By.xpath(companyLink)).click();
    }

    @And("^I go to a random company profile page$")
    public void iGoToARandomCompanyProfilePage() throws Throwable {
        int aPageNumber = ThreadLocalRandom.current().nextInt(1, 234921);
        parentScenario.navigateToPage("/companies?results-page=" + aPageNumber);

    }

    @And("^(.*) should be populated$")
    public void shouldBepopulated(String element) throws Throwable {
        assertThat(bySelector(element).getValue(), not(isEmptyOrNullString()));
    }

    @Then("^the (.*) attribute of (.*) should be (.*)$")
    public void verifyElementAttribute(String attributeName, String element, String value) throws Throwable {
        assertThat(bySelector(element).getAttribute(attributeName), is(equalTo(value)));
    }

    @And("^I find temp mail having subject (.*)$")
    public void iFindTempMailHavingSubject(String subject) throws InterruptedException {
        String windowId = getWebDriver().getWindowHandle();
        int timeout = 5;
        while (timeout > 0) {
            getWebDriver().switchTo().frame("ifmail");
            if ($x(OR.getProperty("mail_subject_heading")).isDisplayed()) {
                if ($x(OR.getProperty("mail_subject_heading")).getText().equals(subject)) {
                    getWebDriver().switchTo().window(windowId);
                    break;
                }
            } else {
                timeout -= 1;
                getWebDriver().switchTo().window(windowId);
                $(byXpath(OR.getProperty("mail_check_new_mail_btn"))).click();
                I_wait_for_seconds(4);
            }

        }
    }

    @And("^I switch to frame having id (.*) on mail$")
    public void iSwitchToFrameHavingIdOnMail(String frameId) throws Throwable {
        getWebDriver().switchTo().frame(frameId);
    }
    public enum Selector {
        XPATH,
        CSS,
        ID,
        CLASS,
        TEXT;
    }
}