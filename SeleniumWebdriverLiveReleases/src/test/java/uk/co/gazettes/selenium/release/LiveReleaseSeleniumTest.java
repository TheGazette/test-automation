package uk.co.gazettes.selenium.release;

import static junit.framework.Assert.assertEquals;
import static junit.framework.Assert.assertTrue;
import static org.junit.Assert.assertFalse;

import java.io.File;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.Ignore;
import org.openqa.selenium.By;
import org.openqa.selenium.Cookie;
import org.openqa.selenium.OutputType;
import org.openqa.selenium.TakesScreenshot;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;

public class LiveReleaseSeleniumTest {
	private WebDriver driver;
	private ScreenshotHelper screenshotHelper;
	private String testName = "";

	@Before
	public void openBrowser() {
		ChromeOptions options = new ChromeOptions();
        options.addArguments("no-sandbox");
		driver = new ChromeDriver(options);
		screenshotHelper = new ScreenshotHelper();
	}

	@After
	public void saveScreenshotAndCloseBrowser() throws IOException {
		screenshotHelper.saveScreenshot(testName);
		driver.quit();
	}

	@Test
	public void checkPageResponseApacheOneTest() throws IOException {
		testName = "checkPageResponseApacheOneTest.png";
		String baseUrl = "https://obsfucated";
		driver.get(baseUrl);
		assertEquals(
				"The page title should equal The Gazette | Official Public Record, at the start of the test.",
				"The Gazette | Official Public Record", driver.getTitle());
		String pageSource = driver.getPageSource();
		assertTrue(pageSource.contains("<!--BIG-IP-->"));
	}

	@Test
	public void checkPageResponseApacheTwoTest() throws IOException {
		testName = "checkPageResponseApacheTwoTest.png";
		String baseUrl = "https://obsfucated";
		driver.get(baseUrl);
		assertEquals(
				"The page title should equal The Gazette | Official Public Record, at the start of the test.",
				"The Gazette | Official Public Record", driver.getTitle());
		String pageSource = driver.getPageSource();
		assertTrue(pageSource.contains("<!--BIG-IP-->"));
	}

	@Test
	public void checkPageResponseMobileOneTest() throws IOException {
		testName = "checkPageResponseMobileOneTest.png";
		String baseUrl = "https://obsfucated/";
		driver.get(baseUrl);
		assertEquals(
				"The page title should equal The Gazette Mobile, at the start of the test.",
				"The Gazette Mobile", driver.getTitle());
		String pageSource = driver.getPageSource();
		assertTrue(pageSource.contains("<!--BIG-IP-->"));
		assertTrue(pageSource.contains("mobile.css"));
	}

	@Test
	public void checkPageResponseMobileTwoTest() throws IOException {
		testName = "checkPageResponseMobileTwoTest.png";
		String baseUrl = "https://obsfucated/";
		driver.get(baseUrl);
		assertEquals(
				"The page title should equal The Gazette Mobile, at the start of the test.",
				"The Gazette Mobile", driver.getTitle());
		String pageSource = driver.getPageSource();
		assertTrue(pageSource.contains("<!--BIG-IP-->"));
		assertTrue(pageSource.contains("mobile.css"));
	}

	@Test
	public void checkPDFPageResponse() throws IOException {
		testName = "checkPDFPageResponse.png";
		String baseUrl = "https://www.thegazette.co.uk/notice/2390320/data.pdf";
		driver.get(baseUrl);
		/*assertEquals(
				"The page title should equal https://www.thegazette.co.uk/notice/2390320/data.pdf, at the start of the test.",
				"https://www.thegazette.co.uk/notice/2390320/data.pdf",
				driver.getTitle());*/
		String pageSource = driver.getPageSource();
		assertTrue(pageSource.contains("type=\"application/pdf"));
		assertFalse(pageSource.contains(" 403"));
		assertFalse(pageSource.contains(" 404"));
		assertFalse(pageSource.contains(" 504"));
	}

	public static boolean responseIsFromsNode(String urlString, String node) throws MalformedURLException, IOException{
	    URL url = new URL(urlString);
	    HttpURLConnection huc = (HttpURLConnection)url.openConnection();
	    huc.setRequestMethod("GET");
	    huc.connect();
	    List<String> cookies = huc.getHeaderFields().get("Set-Cookie");
	    boolean containsNode = false;
	    for (String cookie : cookies){
	    	if (cookie.contains(node)){
	    		containsNode = true;
	    	}
	    }
	    return containsNode;
	}

	
	@Ignore
	public void checkApiNodeOne() throws IOException {
		testName = "checkApiNodeOne.png";
		String baseUrl = "https://www.thegazette.co.uk/sign-in";
		boolean nodeFound = false;
		testloop: for (int i = 0; i < 100; i++) {
			driver.get(baseUrl);					
			if (responseIsFromsNode(baseUrl, "node1")) {
				nodeFound = true;
				break testloop;
			}
		}
		assertTrue(nodeFound);
	}

	@Ignore
	public void checkApiNodeTwo() throws IOException {
		testName = "checkApiNodeOne.png";
		String baseUrl = "https://www.thegazette.co.uk/sign-in";
		boolean nodeFound = false;
		testloop: for (int i = 0; i < 100; i++) {
			driver.get(baseUrl);					
			if (responseIsFromsNode(baseUrl, "node2")) {
				nodeFound = true;
				break testloop;
			}
		}
		assertTrue(nodeFound);
	}

	private class ScreenshotHelper {

		public void saveScreenshot(String screenshotFileName)
				throws IOException {
			File screenshot = ((TakesScreenshot) driver)
					.getScreenshotAs(OutputType.FILE);
			FileUtils.copyFile(screenshot, new File(screenshotFileName));
		}
	}
}
