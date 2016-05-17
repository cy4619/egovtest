package egovframework.com.cmm.util;

import java.util.Collection;
import java.util.HashSet;
import java.util.Set;

import org.springframework.security.access.ConfigAttribute;

public class ConfigAttributeImpl implements ConfigAttribute {
	Set<ConfigAttribute> attributeSet = new HashSet<ConfigAttribute>();
	
	public Set<ConfigAttribute> getAttributeSet() {
		return attributeSet;
	}
	public void setAttributeSet(Set<ConfigAttribute> attributeSet) {
		this.attributeSet = attributeSet;
	}
	@Override
	public String getAttribute() {
		return this.attributeSet.toString();
	}

}
