package com.demoblazeapi.automation.runners;

import com.intuit.karate.junit5.Karate;

public class ApiRunner {

    @Karate.Test
    Karate testApi() {
        return Karate.run("classpath:features/api").relativeTo(getClass());
    }
}
