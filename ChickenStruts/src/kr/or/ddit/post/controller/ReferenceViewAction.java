package kr.or.ddit.post.controller;

import java.util.HashMap;
import java.util.Map;


import kr.or.ddit.post.service.IPostService;
import kr.or.ddit.post.service.IPostServiceImpl;
import kr.or.ddit.vo.PostVO;

public class ReferenceViewAction {
	private String post_no;
	private String rnum;
	private PostVO postInfo;

	public String execute() {
		
		Map<String, String> params = new HashMap<String, String>();
		params.put("post_no", this.post_no);
		params.put("rnum", this.rnum);

		IPostService service = IPostServiceImpl.getInstance();
		this.postInfo = service.postInfo(params);

		service.udpateHit(params);

		return "success";
	}

	public PostVO getPostInfo() {
		return postInfo;
	}

	public void setPost_no(String post_no) {
		this.post_no = post_no;
	}

	public void setRnum(String rnum) {
		this.rnum = rnum;
	}

}
