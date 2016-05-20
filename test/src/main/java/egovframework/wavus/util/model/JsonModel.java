package egovframework.wavus.util.model;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

public class JsonModel {
	Map data=new HashMap();
	PaginationInfo paginationInfo=new PaginationInfo();
	/** 애플리케이션에서 JsonObject 형태로 주고 받을 성공 메세지 명 */
	public static final String result   = "ok";
	/** jsonObject 키 명 */
	public static final String JSON_OBJECT_KEY = "jsonObject";
	
	public JsonModel() {
		this.paginationInfo.setCurrentPageNo(1);
		this.paginationInfo.setPageSize(1);
		this.paginationInfo.setTotalRecordCount(1);
		this.paginationInfo.setRecordCountPerPage(1);
	}
	

	public Map getData() {
		return data;
	}

	public void setData(Map data) {
		this.data = data;
	}


	public void putData(String key, Object data){
		this.data.put(key, data);
	}
	public void putData(String key, Collection<Object> data){
		this.data.put(key, data);
	}
	
	public String getResult() {
		return result;
	}
	public String getJsonObjectKey() {
		return JSON_OBJECT_KEY;
	}
	public PaginationInfo getPaginationInfo() {
		return paginationInfo;
	}
	public void setPaginationInfo(PaginationInfo paginationInfo) {
		this.paginationInfo = paginationInfo;
	}
}