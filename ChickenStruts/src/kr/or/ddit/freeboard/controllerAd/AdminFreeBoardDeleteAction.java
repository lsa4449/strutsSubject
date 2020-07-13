package kr.or.ddit.freeboard.controllerAd;

import java.util.HashMap;
import java.util.Map;

import kr.or.ddit.freeboard.service.IFreeboardService;
import kr.or.ddit.freeboard.service.IFreeboardServiceImpl;

import com.opensymphony.xwork2.Action;

public class AdminFreeBoardDeleteAction implements Action {
	private String post_no;
	
	@Override
	public String execute() throws Exception {
		Map<String,String> params = new HashMap<String,String>();
		params.put("post_no", this.post_no);
		
		IFreeboardService service = IFreeboardServiceImpl.getInstance();
		service.deleteFreeboard(params);
		
		return "success";
	}

	public void setPost_no(String post_no) {
		this.post_no = post_no;
	}
	
	

}
