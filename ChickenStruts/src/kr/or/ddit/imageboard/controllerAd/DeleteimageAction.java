package kr.or.ddit.imageboard.controllerAd;

import java.util.HashMap;
import java.util.Map;

import kr.or.ddit.imageboard.service.IImageBoardService;
import kr.or.ddit.imageboard.service.IImageBoardServiceImpl;

public class DeleteimageAction {
	private String post_no;
	

	public String execute(){
		Map<String, String> params = new HashMap<String, String>();
		params.put("post_no", this.post_no);
		
		IImageBoardService service = IImageBoardServiceImpl.getInstance();
		service.deleteImage(params);
		
		return "success";
		
	}

	public void setPost_no(String post_no) {
		this.post_no = post_no;
	}
}
