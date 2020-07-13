package kr.or.ddit.member.controllerAd;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.IMemberServiceImpl;
import kr.or.ddit.utiles.RolePaginationUtil;
import kr.or.ddit.vo.MemberVO;

import com.opensymphony.xwork2.Action;

public class AdminMainAction implements Action {

	private String currentPage;
	private String search_keyword;
	private String search_keycode;
	private String pagination;
	private List<MemberVO> memberList;

	@Override
	public String execute() throws Exception {
		
		HttpServletRequest request = ServletActionContext.getRequest();

		if (currentPage == null) {
			currentPage = "1";
		}

		Map<String, String> params = new HashMap<String, String>();
		params.put("search_keyword", search_keyword);
		params.put("search_keycode", search_keycode);

		IMemberService service = IMemberServiceImpl.getInstance();
		String totalCount = service.totalCount(params);

		RolePaginationUtil pagination = new RolePaginationUtil(request,Integer.parseInt(currentPage),Integer.parseInt(totalCount), search_keyword, search_keycode);
																			
												
																			
		params.put("startCount", String.valueOf(pagination.getStartCount()));
		params.put("endCount", String.valueOf(pagination.getEndCount()));
		
		this.pagination = pagination.getPagingHtmls();
		this.memberList = service.memberList(params);

		return SUCCESS;
	}

	public List<MemberVO> getMemberList() {
		return memberList;
	}

	public String getPagination() {
		return pagination;
	}

	

	public void setCurrentPage(String currentPage) {
		this.currentPage = currentPage;
	}

	public void setSearch_keyword(String search_keyword) {
		this.search_keyword = search_keyword;
	}

	public void setSearch_keycode(String search_keycode) {
		this.search_keycode = search_keycode;
	}

/*	public List<Map<String, String>> getMember() {
		return memberList;
	}

	public void setCurrentPage(String currentPage) {
		this.currentPage = currentPage;
	}



	public void setSearch_keyword(String search_keyword) {
		this.search_keyword = search_keyword;
	}

	public void setSearch_keycode(String search_keycode) {
		this.search_keycode = search_keycode;
	}

	public String getPagination() {
		return pagination;
	}*/

}
