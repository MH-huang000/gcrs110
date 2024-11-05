package com.example.test.config;

import org.springdoc.core.models.GroupedOpenApi;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import io.swagger.v3.oas.models.OpenAPI;
import io.swagger.v3.oas.models.info.Info;

@Configuration
public class SpringDocConfig {

    @Bean
    public OpenAPI myOpenAPI() {
        return new OpenAPI()
                .info(new Info()
                        .title("畢審系統API")
                        .version("v0.0.2"));
    }

    @Bean
    public GroupedOpenApi versionAPI() {
        return GroupedOpenApi.builder()
                .group("version")
                .pathsToMatch("/versions/**")
                .build();
    }

    @Bean
    public GroupedOpenApi testAPI() {
        return GroupedOpenApi.builder()
                .group("test")
                .pathsToMatch("/test/**")
                .build();
    }
}
