package kr.or.ddit.freeboard.controller;

import kr.or.ddit.freeboard.service.IFreeboardService;
import kr.or.ddit.freeboard.service.IFreeboardServiceImpl;
import kr.or.ddit.vo.PostVO;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ModelDriven;

public class InsertReplyFreeBoardAction implements Action, ModelDriven<PostVO> {
	
	private PostVO freeboardreplyInfo;

	@Override
	public String execute() throws Exception {
		IFreeboardService service = IFreeboardServiceImpl.getInstance();
		service.insertFreeboardReply(this.freeboardreplyInfo);
		
		return "success";
	}

	@Override
	public PostVO getModel() {
		this.freeboardreplyInfo = new PostVO();
		return this.freeboardreplyInfo;
	}

	public void setFreeboardInfo(PostVO freeboardInfo) {
		this.freeboardreplyInfo = freeboardInfo;
	}

}
