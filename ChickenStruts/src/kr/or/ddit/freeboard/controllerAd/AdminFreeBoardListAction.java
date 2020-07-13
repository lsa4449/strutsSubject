package kr.or.ddit.freeboard.controllerAd;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import kr.or.ddit.freeboard.service.IFreeboardService;
import kr.or.ddit.freeboard.service.IFreeboardServiceImpl;
import kr.or.ddit.utiles.RolePaginationUtil;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.Action;

public class AdminFreeBoardListAction implements Action {

	private String currentPage;
	private String search_keyword;
	private String search_keycode;
	private String pagination;
	private List<Map<String, String>> freeboardList;

	@Override
	public String execute() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();

		if (currentPage == null) {
			currentPage = "1";
		}

		Map<String, String> params = new HashMap<String, String>();
		params.put("search_keyword", search_keyword);
		params.put("search_keycode", search_keycode);

		IFreeboardService service = IFreeboardServiceImpl.getInstance();
		String totalCount = service.totalCount(params);
		
		RolePaginationUtil pagination = new RolePaginationUtil(request,Integer.parseInt(currentPage),Integer.parseInt(totalCount), search_keyword, search_keycode);

//		RolePaginationUtil pagination = new RolePaginationUtil(request,
//				Integer.parseInt(currentPage), Integer.parseInt(totalCount)); // request를
//																				// 생성자에
//																				// 준다.
//																				// 현재
//																				// 페이지도
//																				// 준다.
//																				// 토탈
//																				// 카운트도
//																				// 준다.
		params.put("startCount", String.valueOf(pagination.getStartCount()));
		params.put("endCount", String.valueOf(pagination.getEndCount()));

		this.pagination = pagination.getPagingHtmls();
		this.freeboardList = service.freeboardList(params);
		return SUCCESS;
	}

	public String getPagination() {
		return pagination;
	}

	public void setCurrentPage(String currentPage) {
		this.currentPage = currentPage;
	}

	public List<Map<String, String>> getFreeboardList() {
		return freeboardList;
	}

	public void setSearch_keyword(String search_keyword) {
		this.search_keyword = search_keyword;
	}

	public void setSearch_keycode(String search_keycode) {
		this.search_keycode = search_keycode;
	}
}
