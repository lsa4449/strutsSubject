package kr.or.ddit.qna.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.Action;

import kr.or.ddit.base.action.controller.IAction;
import kr.or.ddit.qna.service.IQnaBoardService;
import kr.or.ddit.qna.service.IQnaBoardServiceImpl;
import kr.or.ddit.utiles.RolePaginationUtil;

public class QnaBoardListAction implements Action {
	private String currentPage;
	private String search_keyword;
	private String search_keycode;
	List<Map<String, String>> qnaboardList;
	private String paging;
	
	
		

	@Override
	public String execute() throws Exception {
		
		HttpServletRequest request = ServletActionContext.getRequest();
		
		
		
		if(currentPage == null){
			currentPage = "1";
		}
		
		
		Map<String,String> params = new HashMap<String,String>();
		params.put("search_keyword", search_keyword);
		params.put("search_keycode", search_keycode);
		
		System.out.println(search_keyword);
		System.out.println(search_keycode);
		
		IQnaBoardService service = IQnaBoardServiceImpl.getInstance();
		
		String totalCount = service.totalCount(params);
		
		
		RolePaginationUtil pagination = new RolePaginationUtil(request,Integer.parseInt(currentPage),Integer.parseInt(totalCount), search_keyword, search_keycode);
		
		
		params.put("startCount", String.valueOf(pagination.getStartCount()));
		params.put("endCount", String.valueOf(pagination.getEndCount()));
		
		this.qnaboardList = service.qnaboardList(params);
		
		this.paging = pagination.getPagingHtmls();
		
		return SUCCESS;

	}




	public String getCurrentPage() {
		return currentPage;
	}




	public void setCurrentPage(String currentPage) {
		this.currentPage = currentPage;
	}




	public String getSearch_keyword() {
		return search_keyword;
	}




	public void setSearch_keyword(String search_keyword) {
		this.search_keyword = search_keyword;
	}




	public String getSearch_keycode() {
		return search_keycode;
	}




	public void setSearch_keycode(String search_keycode) {
		this.search_keycode = search_keycode;
	}




	public List<Map<String, String>> getQnaboardList() {
		return qnaboardList;
	}




	public void setQnaboardList(List<Map<String, String>> qnaboardList) {
		this.qnaboardList = qnaboardList;
	}




	public String getPaging() {
		return paging;
	}




	public void setPaging(String paging) {
		this.paging = paging;
	}








	
	
	
}
