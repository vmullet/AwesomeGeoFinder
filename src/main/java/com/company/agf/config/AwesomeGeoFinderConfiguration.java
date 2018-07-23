package com.company.agf.config;

import java.util.Properties;

import javax.persistence.EntityManagerFactory;
import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.Environment;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.orm.jpa.vendor.HibernateJpaVendorAdapter;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

/**
 * Config Spring
 * 
 * @author mxd
 *
 */
@Configuration
@EnableWebMvc
@EnableTransactionManagement
@EnableJpaRepositories(basePackages = { "com.company" })
@ComponentScan(basePackages = { "com.company" })
public class AwesomeGeoFinderConfiguration extends WebMvcConfigurerAdapter {

	private static final Logger logger = LoggerFactory.getLogger(AwesomeGeoFinderConfiguration.class);

	/**
	 * Configuration base de données.
	 * 
	 * @return
	 */
	@Bean(name = "datasource")
	public DataSource dataSource() {
		logger.debug("Creating DataSource...");
		final DriverManagerDataSource ds = new DriverManagerDataSource();
		ds.setDriverClassName("com.mysql.jdbc.Driver");
		ds.setUrl("jdbc:mysql://localhost:3306/agf");
		ds.setUsername("agf");
		ds.setPassword("agf");
		return ds;

	}

	@Bean
	LocalContainerEntityManagerFactoryBean entityManagerFactory(final DataSource dataSource, final Environment env) {
		final LocalContainerEntityManagerFactoryBean entityManagerFactoryBean = new LocalContainerEntityManagerFactoryBean();
		entityManagerFactoryBean.setDataSource(dataSource);
		entityManagerFactoryBean.setJpaVendorAdapter(new HibernateJpaVendorAdapter());
		entityManagerFactoryBean.setPackagesToScan("com.company");

		final Properties jpaProperties = new Properties();

		// Configures the used database dialect. This allows Hibernate to create SQL
		// that is optimized for the used database.
		jpaProperties.put("hibernate.dialect", "org.hibernate.dialect.MySQLDialect");

		// Specifies the action that is invoked to the database when the Hibernate
		// SessionFactory is created or closed.
		jpaProperties.put("hibernate.hbm2ddl.auto", "none");

		// Configures the naming strategy that is used when Hibernate creates
		// new database objects and schema elements
		// jpaProperties.put("hibernate.ejb.naming_strategy",
		// env.getRequiredProperty("hibernate.ejb.naming_strategy"));

		// If the value of this property is true, Hibernate writes all SQL
		// statements to the console.
		jpaProperties.put("hibernate.show_sql", "true");

		// If the value of this property is true, Hibernate will format the SQL
		// that is written to the console.
		// jpaProperties.put("hibernate.format_sql",
		// env.getRequiredProperty("hibernate.format_sql"));

		entityManagerFactoryBean.setJpaProperties(jpaProperties);

		return entityManagerFactoryBean;
	}

	/**
	 *
	 * @param entityManagerFactory
	 * @return
	 */
	@Bean
	JpaTransactionManager transactionManager(final EntityManagerFactory entityManagerFactory) {
		final JpaTransactionManager transactionManager = new JpaTransactionManager();
		transactionManager.setEntityManagerFactory(entityManagerFactory);
		return transactionManager;
	}

}
