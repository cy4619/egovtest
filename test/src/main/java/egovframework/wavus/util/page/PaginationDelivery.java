package egovframework.wavus.util.page;

import java.lang.reflect.Field;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import egovframework.wavus.util.exception.CommonException;
/**
 * 페이징처리에 필요한 값을 설정하는 클래스이다. 
 * @author 김성천
 * @since 2015. 9. 1. 오후 5:39:14
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *   
 *  수정일		수정자		수정내용
 *  -------    	--------    ---------------------------
 * 2015. 9. 1. 	김성천  최초생성
 *
 * </pre>
 */
public class PaginationDelivery {
	
	public PaginationDelivery() {
		// TODO Auto-generated constructor stub
	}
	
	
	/**
	 * 페이지 처리 오브젝트 반환 메서드
	 * @param obj
	 * @return PaginationInfo
	 * @throws SmppCmmException 
	 */
	public static PaginationInfo setPagination(Object obj) throws CommonException {
		PaginationInfo paginationInfo=new PaginationInfo();
		Field[] fields = obj.getClass().getSuperclass().getDeclaredFields();
	    try{
	        for(Field field : fields){
	            field.setAccessible(true);
	            Object value = field.get(obj);
	            
	            //필드이름 비교후 필드값 수정
	            if(field.getName().equals("pageIndex")){
	            	paginationInfo.setCurrentPageNo((int)field.get(obj));
	            }
	            if(field.getName().equals("pageUnit")){
	            	paginationInfo.setRecordCountPerPage((int)field.get(obj));
	            }
	            if(field.getName().equals("pageSize")){
	            	paginationInfo.setPageSize((int)field.get(obj));
	            }
	        }
	    }catch(Exception e){
	    	throw new CommonException("PaginationInfo Exception",e);
	    }
	    
	    return paginationInfo;
	}
	
	
	/**
	 * 페이지처리에 필요한 값 설정후 엔티티 오브젝트 반환
	 * @param obj
	 * @param paginationInfo
	 * @return
	 * @throws SmppCmmException 
	 */
	public static Object setObjectPagination(Object obj, PaginationInfo paginationInfo) throws CommonException{
		Field[] fields = obj.getClass().getSuperclass().getDeclaredFields();
	    try{
	        for(Field field : fields){
	            field.setAccessible(true);
	            Object value = field.get(obj);
	            
	            //필드이름 비교후 필드값 수정
	            if(field.getName().equals("firstIndex")){
	            	field.set(obj, paginationInfo.getFirstRecordIndex());
	            }
	            if(field.getName().equals("lastIndex")){
	            	field.set(obj, paginationInfo.getLastRecordIndex());
	            }
	            if(field.getName().equals("recordCountPerPage")){
	            	field.set(obj, paginationInfo.getRecordCountPerPage());
	            }
	        }
	    }catch(Exception e){
	    	throw new CommonException("PaginationInfo Exception",e);
	    }
	    return obj;
	}

}
