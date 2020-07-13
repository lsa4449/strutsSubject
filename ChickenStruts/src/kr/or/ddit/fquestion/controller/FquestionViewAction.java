package kr.or.ddit.fquestion.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.fquestion.service.IFQuestionBoardService;
import kr.or.ddit.fquestion.service.IFQuestionBoardServiceImpl;
import kr.or.ddit.utiles.CLOBToStringConvert;

public class FquestionViewAction {

	private String post_no;
	private String rnum;
	private Map<String, String> FQuestionMap;
	private List<Map<String, String>> serverFileNames;
	List<Map<String, String>> FQuestionBoardMapInfo;
	
	public String execute(){
		
		Map<String, String> params = new HashMap<String, String>();
		params.put("post_no", this.post_no);
		params.put("rnum", this.rnum); 
		
		IFQuestionBoardService service = IFQuestionBoardServiceImpl.getInstance();
		FQuestionBoardMapInfo = service.FQuestionBoardInfo(params);
		
		this.FQuestionMap = FQuestionBoardMapInfo.get(0);
	
		String convertString = "";
		try {
			convertString = CLOBToStringConvert.convert(FQuestionMap.get("POST_CONTENT"));
			this.FQuestionMap.put("POST_CONTENT", convertString);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		service.udpateHit(params);

		this.serverFileNames = service.selectFQuestionImageName(params);
		
		return "success";
	}

	public Map<String, String> getFQuestionMap() {
		return FQuestionMap;
	}

	public List<Map<String, String>> getServerFileNames() {
		return serverFileNames;
	}

	public void setPost_no(String post_no) {
		this.post_no = post_no;
	}

	public void setRnum(String rnum) {
		this.rnum = rnum;
	}

	public List<Map<String, String>> getFQuestionBoardMapInfo() {
		return FQuestionBoardMapInfo;
	}
	
}
