package cucumber.suite.framework;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import uk.co.tso.automation.service.CucumberProperties;

import static com.codeborne.selenide.Selenide.open;

@Service
public class ParentScenario {
    @Autowired
    private CucumberProperties properties;

    public void navigateToHomepage() {
        open(properties.getRootWebUrl());
    }

    public void navigateToSignInPage() {
        open(properties.getRootWebUrl().concat("/sign-in"));
    }

    public void navigateToRegistrationPage(String type) {
        open(properties.getRootWebUrl().concat("/my-gazette/account?register=true&type=").concat(type));
    }

    public void navigateToPage(String url) {
        open(properties.getRootWebUrl().concat(url));
    }
}