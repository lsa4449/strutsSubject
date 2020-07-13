package kr.or.ddit.freeboard.controller;

import java.util.HashMap;
import java.util.Map;

import kr.or.ddit.freeboard.service.IFreeboardService;
import kr.or.ddit.freeboard.service.IFreeboardServiceImpl;
import kr.or.ddit.vo.PostVO;

import com.opensymphony.xwork2.Action;

public class FreeBoardViewAction implements Action {
	
	private String post_no;
	private PostVO postInfo;
	private String rnum;

	
	@Override
	public String execute() throws Exception {
		
		Map<String,String> params = new HashMap<String,String>();
		params.put("post_no", post_no);
		params.put("rnum", rnum);
		
		
		IFreeboardService service = IFreeboardServiceImpl.getInstance();
		this.postInfo = service.freeboardInfo(params);
		service.hitupInfo(params);
		
		return SUCCESS;
	}
	public void setPost_no(String post_no) {
		this.post_no = post_no;
	}
	public PostVO getPostInfo() {
		return postInfo;
	}
	public void setRnum(String rnum) {
		this.rnum = rnum;
	}
	
	
	
}
