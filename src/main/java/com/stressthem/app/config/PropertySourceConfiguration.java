package com.stressthem.app.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.annotation.PropertySources;

@Configuration
@PropertySources({
        @PropertySource("classpath:machine-config.properties"),
        @PropertySource("classpath:mail-config.properties")
})
public class PropertySourceConfiguration {
}
