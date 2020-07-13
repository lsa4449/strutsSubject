package kr.or.ddit.noticeboard.controllerAd;

import java.util.HashMap;
import java.util.Map;

import kr.or.ddit.notice.service.INoticeBoardService;
import kr.or.ddit.notice.service.INoticeBoardServiceImpl;

import com.opensymphony.xwork2.Action;

public class AdminNoticeBoardDeleteAction implements Action {
	
	private String post_no;
	

	@Override
	public String execute() throws Exception {
		Map<String,String> params = new HashMap<String,String>();
		params.put("post_no", this.post_no);
		
		INoticeBoardService service = INoticeBoardServiceImpl.getInstance();
		service.deleteNoticeBoardInfo(params);
		
		return "success";
	}


	public void setPost_no(String post_no) {
		this.post_no = post_no;
	}

}
