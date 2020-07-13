package kr.or.ddit.fquestion.controllerAd;


import kr.or.ddit.fquestion.service.IFQuestionBoardService;
import kr.or.ddit.fquestion.service.IFQuestionBoardServiceImpl;
import kr.or.ddit.vo.PostVO;

import com.opensymphony.xwork2.ModelDriven;

public class FquestionInsertAction implements ModelDriven<PostVO>{

	private PostVO vo;
	
	public String execute(){
		
		 IFQuestionBoardService service =  IFQuestionBoardServiceImpl.getInstance();
		 service.insertboard(vo);
	
		return "success";
	}

	@Override
	public PostVO getModel() {
		this.vo = new PostVO();
		return this.vo;
	}

}
