package kr.or.ddit.freeboard.controllerAd;

import kr.or.ddit.freeboard.service.IFreeboardService;
import kr.or.ddit.freeboard.service.IFreeboardServiceImpl;
import kr.or.ddit.vo.PostVO;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ModelDriven;

public class AdminInsertReplyFreeBoardAction implements Action, ModelDriven<PostVO> {
	
	private PostVO freeboardreplyIfo;
	
	@Override
	public String execute() throws Exception {
		IFreeboardService service = IFreeboardServiceImpl.getInstance();
		service.insertFreeboardReply(this.freeboardreplyIfo);
		
		return "success";
	}

	@Override
	public PostVO getModel() {
		this.freeboardreplyIfo = new PostVO();
		return this.freeboardreplyIfo;
	}

	public void setFreeboardreplyIfo(PostVO freeboardreplyIfo) {
		this.freeboardreplyIfo = freeboardreplyIfo;
	}

}
