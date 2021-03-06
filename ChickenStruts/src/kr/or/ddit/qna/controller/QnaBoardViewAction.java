package kr.or.ddit.qna.controller;

import java.util.HashMap;
import java.util.Map;

import kr.or.ddit.qna.service.IQnaBoardService;
import kr.or.ddit.qna.service.IQnaBoardServiceImpl;
import kr.or.ddit.vo.PostVO;

import com.opensymphony.xwork2.Action;

public class QnaBoardViewAction implements Action {
	private String post_no;
	private String rnum;
	private PostVO qnaMap;

	@Override
	public String execute() throws Exception {
		Map<String,String> params = new HashMap<String,String>();
		
		params.put("post_no",post_no);
		params.put("rnum", rnum);
		
		IQnaBoardService service = IQnaBoardServiceImpl.getInstance();
		this.qnaMap = service.qnaboardInfo(params);
		service.hitupInfo(params);
		
		
		return SUCCESS;
	}

	public PostVO getQnaMap() {
		return qnaMap;
	}

	public void setPost_no(String post_no) {
		this.post_no = post_no;
	}

	public void setRnum(String rnum) {
		this.rnum = rnum;
	}
	
	
	
	
	
	
}
