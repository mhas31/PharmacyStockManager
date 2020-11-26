package CS480FinalProject.pharmaDBRestApi.config;

import java.util.HashMap;
import java.util.Map;

import javax.persistence.EntityManagerFactory;
import javax.sql.DataSource;


import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.boot.orm.jpa.EntityManagerFactoryBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;



@Configuration
@EnableTransactionManagement
@EnableJpaRepositories(entityManagerFactoryRef = "pharmacy1-entityManagerFactory", basePackages = {
		"CS480FinalProject.pharmaDBRestApi.pharmacyItem.repository"
}, transactionManagerRef = "pharmacy1-transactionManager")
public class Pharmacy1DBConfig {

	
	@Bean(name = "pharmacy1-dataSource")
	@ConfigurationProperties(prefix = "spring.pharmacy1-datasource")
	public DataSource dataSource() {
		return DataSourceBuilder.create().build();
	}
	
	
	
	@Bean(name = "pharmacy1-entityManagerFactory")
	public LocalContainerEntityManagerFactoryBean entityManagerFactoryBean (EntityManagerFactoryBuilder builder, 
			@Qualifier("pharmacy1-dataSource") DataSource dataSource) {
		
		Map<String, Object> properties = new HashMap();
		properties.put("hibernate.hbm2ddl.auto", "update");
		properties.put("hibernate.dialect", "org.hibernate.dialect.MySQL5Dialect");
		
		
		return builder.dataSource(dataSource).properties(properties).packages("CS480FinalProject.pharmaDBRestApi.model.pharmacyItem").build();
	}
	
	
	
	@Bean(name = "pharmacy1-transactionManager")
	public PlatformTransactionManager transactionManager(@Qualifier("pharmacy1-entityManagerFactory") EntityManagerFactory entityManagerFactory) {
		
		return new JpaTransactionManager(entityManagerFactory);
		
	}

	
}
