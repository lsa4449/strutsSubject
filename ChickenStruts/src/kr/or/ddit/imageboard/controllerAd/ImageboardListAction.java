package kr.or.ddit.imageboard.controllerAd;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import kr.or.ddit.imageboard.service.IImageBoardService;
import kr.or.ddit.imageboard.service.IImageBoardServiceImpl;
import kr.or.ddit.utiles.RolePaginationUtil;
import kr.or.ddit.vo.PostVO;

import com.opensymphony.xwork2.Action;

public class ImageboardListAction implements Action {
	
	private List<PostVO> imageboardList;
	private String currentPage;
	private String pagination;
	private String search_keyword;
	private String search_keycode;
	
	@Override
	public String execute() throws Exception {
		
		HttpServletRequest request = ServletActionContext.getRequest();
		
		if(currentPage == null){
			currentPage = "1";
		}
		
		Map<String, String> params = new HashMap<String, String>();
		params.put("search_keyword", search_keyword);
		params.put("search_keycode", search_keycode);
		
		IImageBoardService service = IImageBoardServiceImpl.getInstance();
		String totalCount = service.totalCount(params);
		
		RolePaginationUtil pagination = new RolePaginationUtil(request,Integer.parseInt(currentPage),Integer.parseInt(totalCount), search_keyword, search_keycode);
		
		params.put("startCount", String.valueOf(pagination.getStartCount()));
		params.put("endCount", String.valueOf(pagination.getEndCount()));
		
		
		this.pagination = pagination.getPagingHtmls();
		this.imageboardList = service.imageboardList(params);
		
		return SUCCESS;
	}

	
	public List<PostVO> getImageboardList() {
		return imageboardList;
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

	
}
