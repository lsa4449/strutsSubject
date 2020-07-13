package kr.or.ddit.post.controllerAd;

import java.util.HashMap;
import java.util.Map;

import kr.or.ddit.post.service.IPostService;
import kr.or.ddit.post.service.IPostServiceImpl;

public class ReferenceDeleteAction {

	private String post_no;

	public String execute() {

		Map<String, String> params = new HashMap<String, String>();
		params.put("post_no", post_no);

		IPostService service = IPostServiceImpl.getInstance();
		service.deletePost(params);
		
		return "success";
	}

	public void setPost_no(String post_no) {
		this.post_no = post_no;
	}

}
