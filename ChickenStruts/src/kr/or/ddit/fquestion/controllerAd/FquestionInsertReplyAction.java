package kr.or.ddit.fquestion.controllerAd;

import com.opensymphony.xwork2.ModelDriven;

import kr.or.ddit.fquestion.service.IFQuestionBoardService;
import kr.or.ddit.fquestion.service.IFQuestionBoardServiceImpl;
import kr.or.ddit.vo.PostVO;

public class FquestionInsertReplyAction implements ModelDriven<PostVO>{

	private PostVO postInfo;

	public String execute() {

		IFQuestionBoardService service = IFQuestionBoardServiceImpl.getInstance();
		service.insertPostReply(postInfo);

		return "success";

	}

	@Override
	public PostVO getModel() {
		this.postInfo = new PostVO();
		return this.postInfo;
	}

	public PostVO getPostInfo() {
		return postInfo;
	}

}
