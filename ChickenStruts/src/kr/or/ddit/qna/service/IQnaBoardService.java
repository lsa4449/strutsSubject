package kr.or.ddit.qna.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.PostVO;

import org.apache.commons.fileupload.FileItem;

public interface IQnaBoardService {
	
	public List<Map<String, String>> qnaboardList(Map<String,String> params);
	
	public String insertqnaboardInfo(PostVO postVOInfo);
	
	public PostVO qnaboardInfo(Map<String,String> params);
	
	public String totalCount(Map<String,String>params);
	
	public void deleteqnaboardInfo(Map<String, String> params);
	
	public void updateqnaboardInfo(PostVO qnaboardInfo);
	
	public String insertqnaboardReply(PostVO postVOInfo);
	
	public void hitupInfo(Map<String, String> params);
	
	
	
	
	/**
	 * 루트 게시글 등록
	 * @param postInfo
	 */
	public void insertQnaBoard(PostVO postInfo);

}
