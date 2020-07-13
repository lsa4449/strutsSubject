package kr.or.ddit.qna.dao;


import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.PostVO;

public interface IQnaBoardDAO {

	public List<Map<String, String>> qnaboardList(Map<String,String> params) throws Exception;
	public String insertqnaboardInfo(PostVO postInfo) throws Exception;
	public PostVO qnaboardInfo(Map<String, String> params) throws Exception;
	public String totalCount(Map<String, String> params) throws Exception;
	public void deleteqnaboardInfo(Map<String, String> params) throws Exception;
	public void updateqnaboardInfo(PostVO qnaboardInfo) throws Exception;
	
	public String insertqnaboardReply(PostVO postInfo) throws Exception;
	
	public void hitupInfo(Map<String, String> params) throws Exception;
}
