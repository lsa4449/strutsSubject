package kr.or.ddit.qna.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.opensymphony.xwork2.Action;

import kr.or.ddit.base.action.controller.IAction;
import kr.or.ddit.qna.service.IQnaBoardService;
import kr.or.ddit.qna.service.IQnaBoardServiceImpl;

public class QnaBoardDeleteAction implements Action {

	private String post_no; 
	
	@Override
	public String execute() throws Exception {
		
		Map<String,String> params = new HashMap<String,String>();
		params.put("post_no", post_no);
		
		IQnaBoardService service = IQnaBoardServiceImpl.getInstance();
		service.deleteqnaboardInfo(params);
		return SUCCESS;
	}

	public void setPost_no(String post_no) {
		this.post_no = post_no;
	}
	
	

}
