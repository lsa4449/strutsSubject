package kr.or.ddit.fquestion.controllerAd;

import javax.servlet.http.HttpServletRequest;

import kr.or.ddit.fquestion.service.IFQuestionBoardService;
import kr.or.ddit.fquestion.service.IFQuestionBoardServiceImpl;
import kr.or.ddit.vo.PostVO;

import com.opensymphony.xwork2.ModelDriven;

public class FquestionUpdateAction implements ModelDriven<PostVO>{
	
	private String post_no;
	private PostVO postVO;
	
	public String execute(){
		
		IFQuestionBoardService service = IFQuestionBoardServiceImpl.getInstance();
		service.updateFQuestionBoard(postVO);
	
		return "success";
	}

	public void setPost_no(String post_no) {
		this.post_no = post_no;
	}

	@Override
	public PostVO getModel() {
		this.postVO = new PostVO();
		return this.postVO;
	}
}
