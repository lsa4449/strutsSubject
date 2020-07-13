package kr.or.ddit.freeboard.controller;

import kr.or.ddit.freeboard.service.IFreeboardService;
import kr.or.ddit.freeboard.service.IFreeboardServiceImpl;
import kr.or.ddit.vo.PostVO;

import com.opensymphony.xwork2.ModelDriven;

public class UpdateFreeBoardAction implements ModelDriven<PostVO> {
	private PostVO freeboardInfo;
	
	public String execute(){
		IFreeboardService service = IFreeboardServiceImpl.getInstance();
		service.updateFreeboard(this.freeboardInfo);
		
		return "success";
	}

	@Override
	public PostVO getModel() {
		this.freeboardInfo = new PostVO();
		return this.freeboardInfo;
	}

}
