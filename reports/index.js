let reporter = require('cucumber-html-reporter');

const options = {
    theme: 'bootstrap',
    jsonFile: 'reports/report.json',
    ignoreBadJsonFile: true,
    output: 'report.html',
    reportSuiteAsScenarios: true,
    launchReport: true,
};

reporter.generate(options);
