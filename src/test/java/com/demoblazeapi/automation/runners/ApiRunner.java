package com.demoblazeapi.automation.runners;

import com.intuit.karate.junit5.Karate;

class ApiRunner {

    @Karate.Test
    Karate testAllApi() {
        // "features/api" apunta a src/test/resources/features/api
        return Karate.run("classpath:features/api");
    }

}