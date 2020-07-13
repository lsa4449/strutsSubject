package kr.or.ddit.noticeboard.controllerAd;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.notice.service.INoticeBoardService;
import kr.or.ddit.notice.service.INoticeBoardServiceImpl;
import kr.or.ddit.utiles.CLOBToStringConvert;
import kr.or.ddit.vo.FilesVO;

import com.opensymphony.xwork2.Action;

public class AdminNoticeBoardViewAction implements Action {
	private String post_no;
	private Map<String, String> postInfo;
	private List<FilesVO> fileInfo;

	@Override
	public String execute() throws Exception {
		List<Map<String, String>> postInfotemp;
		List<FilesVO> filetemp;
		
		Map<String,String> params = new HashMap<String,String>();
		params.put("post_no", this.post_no);
		
		INoticeBoardService service = INoticeBoardServiceImpl.getInstance();
		postInfotemp = service.noticeBoardInfo(params);
		service.udpateHit(params);
		this.postInfo = postInfotemp.get(0);
		
		String convertString = "";
		try {
			convertString = CLOBToStringConvert.convert(postInfo.get("POST_CONTENT"));
			postInfo.put("POST_CONTENT", convertString);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		filetemp = service.selectfileInfo(params);
		this.fileInfo = filetemp;
		
		return "success";
	}
	
	

	public Map<String, String> getPostInfo() {
		return postInfo;
	}



	public void setPost_no(String post_no) {
		this.post_no = post_no;
	}
	
	public List<FilesVO> getFileInfo() {
		return fileInfo;
	}
}
