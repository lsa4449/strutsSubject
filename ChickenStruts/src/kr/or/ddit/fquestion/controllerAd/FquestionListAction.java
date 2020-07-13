package kr.or.ddit.fquestion.controllerAd;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import kr.or.ddit.fquestion.service.IFQuestionBoardService;
import kr.or.ddit.fquestion.service.IFQuestionBoardServiceImpl;
import kr.or.ddit.utiles.RolePaginationUtil;

import com.opensymphony.xwork2.Action;

public class FquestionListAction implements Action {

	private String currentPage;
	private String search_keyword;
	private String search_keycode;
	private String pagination;
	private List<Map<String, String>> listMapFQuestion;

	@Override
	public String execute() throws Exception {
		
		HttpServletRequest request = ServletActionContext.getRequest();

		if (currentPage == null) {
			currentPage = "1";
		}

		Map<String, String> params = new HashMap<String, String>();
		params.put("search_keyword", search_keyword);
		params.put("search_keycode", search_keycode);

		IFQuestionBoardService service = IFQuestionBoardServiceImpl.getInstance();
		String totalCount = service.totalCount(params);

		RolePaginationUtil pagination = new RolePaginationUtil(request,Integer.parseInt(currentPage),
				Integer.parseInt(totalCount), search_keyword, search_keycode); 
		
		params.put("startCount", String.valueOf(pagination.getStartCount()));
		params.put("endCount", String.valueOf(pagination.getEndCount()));
		
		this.pagination = pagination.getPagingHtmls();
		this.listMapFQuestion = service.selectFQuestionBoard(params);

		return SUCCESS;
	}

	public void setCurrentPage(String currentPage) {
		this.currentPage = currentPage;
	}

	public List<Map<String, String>> getListMapFQuestion() {
		return listMapFQuestion;
	}

	public void setSearch_keyword(String search_keyword) {
		this.search_keyword = search_keyword;
	}

	public void setSearch_keycode(String search_keycode) {
		this.search_keycode = search_keycode;
	}

	public String getPagination() {
		return pagination;
	}

}
