package kr.or.ddit.post.controllerAd;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import kr.or.ddit.post.service.IPostService;
import kr.or.ddit.post.service.IPostServiceImpl;
import kr.or.ddit.utiles.RolePaginationUtil;
import kr.or.ddit.vo.PostVO;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.Action;

public class ReferenceListAction implements Action {

	private String currentPage;
	private String search_keyword;
	private String search_keycode;
	private String pagination;
	private List<PostVO> postList;

	@Override
	public String execute() throws Exception {

		HttpServletRequest request = ServletActionContext.getRequest();

		if (currentPage == null) {
			currentPage = "1";
		}

		Map<String, String> params = new HashMap<String, String>();
		params.put("search_keyword", search_keyword);
		params.put("search_keycode", search_keycode);

		IPostService service = IPostServiceImpl.getInstance();
		String totalCount = service.totalCount(params);

		RolePaginationUtil pagination = new RolePaginationUtil(request,Integer.parseInt(currentPage),
				Integer.parseInt(totalCount), search_keyword, search_keycode); 
																				
		params.put("startCount", String.valueOf(pagination.getStartCount()));
		params.put("endCount", String.valueOf(pagination.getEndCount()));

		this.pagination = pagination.getPagingHtmls();
		this.postList = service.postList(params);

		return SUCCESS;
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

	public void setCurrentPage(String currentPage) {
		this.currentPage = currentPage;
	}

	public List<PostVO> getPostList() {
		return postList;
	}

}
