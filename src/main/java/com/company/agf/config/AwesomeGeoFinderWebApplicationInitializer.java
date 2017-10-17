package com.company.agf.config;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRegistration;

import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.servlet.DispatcherServlet;

/**
 * Config Spring.
 * @author MaxD
 *
 */
public class AwesomeGeoFinderWebApplicationInitializer implements WebApplicationInitializer {

	@Override
	public void onStartup(final ServletContext container) throws ServletException {

		final AnnotationConfigWebApplicationContext ctx = new AnnotationConfigWebApplicationContext();
		ctx.register(AwesomeGeoFinderConfiguration.class);
		ctx.setServletContext(container);

		// Ajoute le path /rest au contexte.
		final ServletRegistration.Dynamic servlet = container.addServlet("dispatcher", new DispatcherServlet(ctx));
		servlet.setLoadOnStartup(1);
		servlet.addMapping("/rest/*");


	}

}