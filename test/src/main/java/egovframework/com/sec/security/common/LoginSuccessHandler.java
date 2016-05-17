package egovframework.com.sec.security.common;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;
import org.springframework.util.StringUtils;

/**
 * 시큐리티 인증성공후 이동할 페이지를 정의한다.
 * 
 * @author ksc
 * @since 2016.05.04
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *   
 *   수정일      수정자           수정내용
 *  -------    -------------    ----------------------
 *   2016.05.04  	ksc    최초 생성
 *
 * </pre>
 */
public class LoginSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler{
    protected final Log logger = LogFactory.getLog(this.getClass());
    private RequestCache requestCache = new HttpSessionRequestCache();

    String redirectUrl="/";

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request,
			HttpServletResponse response, Authentication authentication)
			throws ServletException, IOException {
		SavedRequest savedRequest = requestCache.getRequest(request, response);
        if (savedRequest == null) {
            super.onAuthenticationSuccess(request, response, authentication);

            return;
        }
		
	    String targetUrlParameter = getTargetUrlParameter();
		
	    // 항상 특정 URL 로 이동하도록 설정되어있을경우
        if (isAlwaysUseDefaultTargetUrl() || (targetUrlParameter != null && StringUtils.hasText(request.getParameter(targetUrlParameter)))) {
            requestCache.removeRequest(request, response);
            super.onAuthenticationSuccess(request, response, authentication);
            return;
        }else{
            clearAuthenticationAttributes(request);
            String targetUrl =  "";
        	//조건별 분기가 필요할경우
        	if(false){
        		targetUrl = "/uss/sam/stp/StplatListInqire.do";
        	//최종적으로 호출한 URL 이동
        	}else{
                // Use the DefaultSavedRequest URL
                targetUrl = savedRequest.getRedirectUrl();
        	}
        	logger.debug("Redirecting to DefaultSavedRequest Url: " + targetUrl);
        	getRedirectStrategy().sendRedirect(request, response, targetUrl);
        }
		
	}

	
    public void setRequestCache(RequestCache requestCache) {
        this.requestCache = requestCache;
    }

	public void setRedirectUrl(String redirectUrl) {
		this.redirectUrl = redirectUrl;
	}
	
}
