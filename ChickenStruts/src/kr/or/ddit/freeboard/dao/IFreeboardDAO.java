package kr.or.ddit.freeboard.dao;

import java.util.List;
import java.util.Map;







import kr.or.ddit.vo.PostVO;

public interface IFreeboardDAO {
	public  List<Map<String,String>>  freeboardList(Map<String, String> params) throws Exception; 
	public PostVO  freeboardInfo(Map<String, String> params) throws Exception;
	public String insertFreeboard(PostVO freeboardInfo) throws Exception ;
	public void deleteFreeboard(Map<String, String> params) throws Exception;
	public void updateFreeboard(PostVO freeboardInfo) throws Exception ;
	public String insertFreeboardReply(PostVO freeboardInfo) throws Exception;
	public String totalCount(Map<String, String> params) throws Exception;
	public void hitupInfo(Map<String, String> params) throws Exception;
}