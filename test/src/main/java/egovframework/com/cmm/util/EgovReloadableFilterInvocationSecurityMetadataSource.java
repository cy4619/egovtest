package egovframework.com.cmm.util;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.web.FilterInvocation;
import org.springframework.security.web.access.intercept.FilterInvocationSecurityMetadataSource;
import org.springframework.security.web.util.matcher.RequestMatcher;

import egovframework.rte.fdl.security.securedobject.EgovSecuredObjectService;
import egovframework.rte.fdl.security.securedobject.impl.SelfRegexRequestMatcher;


public class EgovReloadableFilterInvocationSecurityMetadataSource implements FilterInvocationSecurityMetadataSource {
	private static final Logger LOGGER = LoggerFactory.getLogger(EgovReloadableFilterInvocationSecurityMetadataSource.class);

	private EgovSecuredObjectService securedObjectService;
	//private RequestMatcher requestMatcher;

	private final Map<RequestMatcher, Collection<ConfigAttribute>> requestMap;

	public EgovReloadableFilterInvocationSecurityMetadataSource(LinkedHashMap<RequestMatcher, Collection<ConfigAttribute>> requestMap) {
        this.requestMap = requestMap;
    }

    public Collection<ConfigAttribute> getAllConfigAttributes() {
        Set<ConfigAttribute> allAttributes = new HashSet<ConfigAttribute>();

        for (Map.Entry<RequestMatcher, Collection<ConfigAttribute>> entry : requestMap.entrySet()) {
            allAttributes.addAll(entry.getValue());
        }

        return allAttributes;
    }

    public Collection<ConfigAttribute> getAttributes(Object object) {
		List<ConfigAttribute> attributes = new ArrayList<ConfigAttribute>();
		final HttpServletRequest request = ((FilterInvocation) object).getRequest();
/*		for (Map.Entry<RequestMatcher, Collection<ConfigAttribute>> entry : requestMap.entrySet()) {
			if (entry.getKey().matches(request)) {
				return entry.getValue();
			}
        }*/
        
        for (Map.Entry<RequestMatcher, Collection<ConfigAttribute>> entry : requestMap.entrySet()) {
        	if (entry.getKey().matches(request)) {
        		ConfigAttributeImpl configAttributeImpl=new ConfigAttributeImpl();
        		configAttributeImpl.getAttributeSet().addAll(entry.getValue());
        		attributes.add(configAttributeImpl);
        	}
        }
        return attributes;
    }

    public boolean supports(Class<?> clazz) {
        return FilterInvocation.class.isAssignableFrom(clazz);
    }

	public void setSecuredObjectService(EgovSecuredObjectService securedObjectService) {
		this.securedObjectService = securedObjectService;
	}

	/*
	public void setRequestMatcher(RequestMatcher requestMatcher) {
		this.requestMatcher = requestMatcher;
	}
	*/

	public void reload() throws Exception {

		LinkedHashMap<RequestMatcher, List<ConfigAttribute>> reloadedMap = securedObjectService.getRolesAndUrl();

        Iterator<Entry<RequestMatcher, List<ConfigAttribute>>> iterator = reloadedMap.entrySet().iterator();

        // 이전 데이터 삭제
        requestMap.clear();

        while (iterator.hasNext()) {
        	Entry<RequestMatcher, List<ConfigAttribute>> entry = iterator.next();

            requestMap.put(entry.getKey(), entry.getValue());
        }

    	LOGGER.info("Secured Url Resources - Role Mappings reloaded at Runtime!");
    }
}

