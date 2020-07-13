package kr.or.ddit.noticeboard.controllerAd;

import kr.or.ddit.notice.service.INoticeBoardService;
import kr.or.ddit.notice.service.INoticeBoardServiceImpl;
import kr.or.ddit.vo.PostVO;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ModelDriven;

public class AdminNoticeBoardUpdateAction implements Action, ModelDriven<PostVO> {
	
	private PostVO noticeboardInfo;
	
	@Override
	public String execute() throws Exception {
		INoticeBoardService service = INoticeBoardServiceImpl.getInstance();
		service.updateNoticeBoard(this.noticeboardInfo);
		
		return "success";
	}

	@Override
	public PostVO getModel() {
		this.noticeboardInfo = new PostVO();
		return this.noticeboardInfo;
	}

}
