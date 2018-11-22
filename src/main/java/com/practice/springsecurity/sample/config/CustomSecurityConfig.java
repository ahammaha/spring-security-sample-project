package com.practice.springsecurity.sample.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.User.UserBuilder;

@Configuration
@EnableWebSecurity
public class CustomSecurityConfig extends WebSecurityConfigurerAdapter {
	
	// add a reference to our security data source
	@Autowired
	private DataSource securityDataSource;

	/*
	 * Configure users (in memory, database, ldap, etc)
	 */
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		// use jdbc authentication
		auth.jdbcAuthentication().dataSource(securityDataSource);
	}
	
	/*
	 * Configure security of web paths in application, login, logout, etc
	 */
	@Override
	protected void configure(HttpSecurity httpSecurity) throws Exception {
		httpSecurity.authorizeRequests()
			//.anyRequest().authenticated()
			.antMatchers("/").hasRole("EMPLOYEE")
			.antMatchers("/managers/**").hasRole("MANAGER")
			.antMatchers("/admins/**").hasRole("ADMIN")
			.and()
			.formLogin()
				.loginPage("/showMyLoginPage")
				.loginProcessingUrl("/authenticateTheUser")
				.permitAll()
			.and()
			.logout().permitAll()
			.and()
			.exceptionHandling().accessDeniedPage("/access-denied");
		/*
		 * authorizeRequests => Restrict access based on the HttpServletRequest
		 * anyRequest().authenticated() => any request to app must be authenticated(ie. logged in)
		 * formLogin() => we are customizing the form login process
		 * loginPage("/showMyLoginPage") => show our custom form at request mapping "/showMyLoginPage"
		 * loginProcessingUrl("/authenticateTheUser") => login form should post data to this URL for processing
		 * /authenticateTheUser should check user id and password
		 * no need to create controller mapping for /authenticateTheUser as it is already available in spring security
		 * permitAll() => allow everyone to see login page. no need to be logged in
		 * logout() => adds logout support to default url /logout
		 * send data to default logout url /logout
		 * logout url will be handled by Spring Security filters and it should be POST request
		 * when a user logs out, logout parameter gets attached to the url (url?logout)
		 * antMatchers("/leaders/**") => ** means match path including all sub-directories in that path
		 */
	}
	
}