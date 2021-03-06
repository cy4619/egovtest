package egovframework.com.cmm.util;

import java.util.Collection;
import java.util.List;

import org.springframework.security.access.AccessDecisionVoter;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.access.vote.AbstractAccessDecisionManager;
import org.springframework.security.core.Authentication;

public class ConsensusBased extends AbstractAccessDecisionManager {
    //~ Instance fields ================================================================================================

    private boolean allowIfEqualGrantedDeniedDecisions = true;

    /**
     * @deprecated Use constructor which takes voter list
     */
    @Deprecated
    public ConsensusBased() {
    }

    public ConsensusBased(List<AccessDecisionVoter> decisionVoters) {
        super(decisionVoters);
    }

    //~ Methods ========================================================================================================

    /**
     * This concrete implementation simply polls all configured  {@link AccessDecisionVoter}s and upon
     * completion determines the consensus of granted against denied responses.
     * <p>
     * If there were an equal number of grant and deny votes, the decision will be based on the
     * {@link #isAllowIfEqualGrantedDeniedDecisions()} property (defaults to true).
     * <p>
     * If every <code>AccessDecisionVoter</code> abstained from voting, the decision will be based on the
     * {@link #isAllowIfAllAbstainDecisions()} property (defaults to false).
     *
     * @param authentication the caller invoking the method
     * @param object the secured object
     * @param configAttributes the configuration attributes associated with the method being invoked
     *
     * @throws AccessDeniedException if access is denied
     */
    public void decide(Authentication authentication, Object object, Collection<ConfigAttribute> configAttributes)
            throws AccessDeniedException {
    	int grant = 0;
    	int deny = 0;
    	int abstain = 0;
    	
    	for (ConfigAttribute configAttribute : configAttributes) {
    		ConfigAttributeImpl configAttributeImpl=(ConfigAttributeImpl) configAttribute;
    		
    		for (AccessDecisionVoter voter :  getDecisionVoters()) {
    			int result = voter.vote(authentication, object, configAttributeImpl.getAttributeSet());
    			
    			if (logger.isDebugEnabled()) {
    				logger.debug("URL: "+ object + ", configAttributes: "+ configAttributes + ", Voter: " + voter + ", returned: " + result);
    			}
    			
    			switch (result) {
    			case AccessDecisionVoter.ACCESS_GRANTED:
    				grant++;
    				
    				break;
    				
    			case AccessDecisionVoter.ACCESS_DENIED:
    				deny++;
    				
    				break;
    				
    			default:
    				abstain++;
    				
    				break;
    			}
    		}
		}
    	
    	if (grant > deny) {
    		return;
    	}
    	
    	if (deny > grant) {
    		throw new AccessDeniedException(messages.getMessage("AbstractAccessDecisionManager.accessDenied",
    				"Access is denied"));
    	}
    	
    	if ((grant == deny) && (grant != 0)) {
    		if (this.allowIfEqualGrantedDeniedDecisions) {
    			return;
    		} else {
    			throw new AccessDeniedException(messages.getMessage("AbstractAccessDecisionManager.accessDenied",
    					"Access is denied"));
    		}
    	}


        // To get this far, every AccessDecisionVoter abstained
        checkAllowIfAllAbstainDecisions();
    }

    public boolean isAllowIfEqualGrantedDeniedDecisions() {
        return allowIfEqualGrantedDeniedDecisions;
    }

    public void setAllowIfEqualGrantedDeniedDecisions(boolean allowIfEqualGrantedDeniedDecisions) {
        this.allowIfEqualGrantedDeniedDecisions = allowIfEqualGrantedDeniedDecisions;
    }
}
