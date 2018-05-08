package com.goloyalty.config;

import org.sitemesh.builder.SiteMeshFilterBuilder;
import org.sitemesh.config.ConfigurableSiteMeshFilter;

public class CustomSiteMeshFilter extends ConfigurableSiteMeshFilter {
	@Override
    protected void applyCustomConfiguration(SiteMeshFilterBuilder builder) {
		// Assigning default decorator if no path specific decorator found
        builder
        	.addDecoratorPath("/admin/*", "/WEB-INF/jsp/decorator/web-admin.jsp")
        	.addDecoratorPath("/merchant/*", "/WEB-INF/jsp/decorator/web-merchant.jsp")
        	.addDecoratorPath("/api/*", "/WEB-INF/jsp/decorator/web-api.jsp")
        	// Exclude few paths from decoration.
        	.addExcludedPath("/index")
        	.addExcludedPath("/login")
        	.addExcludedPath("/404");
//        	.addExcludedPath("/api/deals");
    }
}
