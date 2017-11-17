package stepDefintions;

import com.github.mkolisnyk.cucumber.runner.AfterSuite;
import com.github.mkolisnyk.cucumber.runner.ExtendedCucumber;
import com.github.mkolisnyk.cucumber.runner.ExtendedCucumberOptions;
import com.github.mkolisnyk.cucumber.runner.ExtendedTestNGRunner;

import cucumber.api.CucumberOptions;
import env.DriverUtil;

@ExtendedCucumberOptions(jsonReport = "Reports/cucumber.json",
        detailedReport = true,
        detailedAggregatedReport = true,
        overviewReport = true,
        coverageReport = true,
        jsonUsageReport = "Reports/cucumber-usage.json",
        usageReport = true,
        toPDF = true,
        excludeCoverageTags = {"@flaky" },
        includeCoverageTags = {"@passed" },
        outputFolder = "Reports")
@CucumberOptions(plugin = { "html:Reports/cucumber-html-report",
        "json:Reports/cucumber.json", "pretty:Reports/cucumber-pretty.txt",
        "usage:Reports/cucumber-usage.json", "junit:Reports/cucumber-results.xml" },
        features = { "./src/test/resources/features" },
        glue = { "info.seleniumcucumber.stepdefinitions" })


public  class RunSmokeTest extends ExtendedTestNGRunner {

    @AfterSuite
    public final void tearDown() {
        DriverUtil.closeDriver();
    }
}



