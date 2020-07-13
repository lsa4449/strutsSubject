package kr.or.ddit.imageboard.controllerAd;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.imageboard.service.IImageBoardService;
import kr.or.ddit.imageboard.service.IImageBoardServiceImpl;
import kr.or.ddit.vo.PostVO;

public class ImageboardViewAction {
	
	private String post_no;
	private List<PostVO> imageInfo;
	
	public String execute(){
		Map<String, String> params = new HashMap<String, String>();
		params.put("post_no", this.post_no);
		
		IImageBoardService service = IImageBoardServiceImpl.getInstance();
		this.imageInfo = service.imageInfo(params);
		service.hitupInfo(params);
		
		return "success";
		
	}

	

	public List<PostVO> getImageInfo() {
		return imageInfo;
	}



	public void setPost_no(String post_no) {
		this.post_no = post_no;
	}

}
