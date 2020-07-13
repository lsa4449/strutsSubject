package kr.or.ddit.fquestion.controllerAd;

import java.util.HashMap;
import java.util.Map;

import kr.or.ddit.fquestion.service.IFQuestionBoardService;
import kr.or.ddit.fquestion.service.IFQuestionBoardServiceImpl;

public class FquestionDeleteAction {
	
	private String post_no;
	
	public String execute() {
		
		IFQuestionBoardService service = IFQuestionBoardServiceImpl.getInstance();
		Map<String, String> params = new HashMap<String, String>();
		params.put("post_no", post_no);
		
		service.deleteFQuestionBoardInfo(params);
		
		return "success";
	}

	public void setPost_no(String post_no) {
		this.post_no = post_no;
	}
}
