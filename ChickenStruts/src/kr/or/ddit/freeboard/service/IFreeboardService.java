package kr.or.ddit.freeboard.service;

import java.util.List;
import java.util.Map;

import org.apache.commons.fileupload.FileItem;

import kr.or.ddit.vo.PostVO;

public interface IFreeboardService {
	//전체 조회
	public List<Map<String,String>> freeboardList(Map<String, String> params);
	//상세 조회
	public PostVO freeboardInfo(Map<String, String> params);
	//게시글 작성
	public String insertFreeboard(PostVO freeboardInfo);
	//게시글 삭제
	public void deleteFreeboard(Map<String, String> params);
	//게시글 수정
	public void updateFreeboard(PostVO freeboardInfo);
	//페이징
	public String totalCount(Map<String,String>params);
	//답글 작성
	public String insertFreeboardReply(PostVO freeboardInfo);
	//조회수
	public void hitupInfo(Map<String, String> params);
}
