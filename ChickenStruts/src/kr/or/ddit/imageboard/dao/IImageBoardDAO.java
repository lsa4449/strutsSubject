package kr.or.ddit.imageboard.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.fileupload.FileItem;

import kr.or.ddit.vo.FilesVO;
import kr.or.ddit.vo.PostVO;

public interface IImageBoardDAO {
	//리스트
	public List<PostVO> imageboardList(Map<String, String> params) throws Exception;
	//페이징
	public String totalCount(Map<String, String> params) throws Exception;
	//상세정보
	public List<PostVO> imageInfo(Map<String, String> params) throws Exception;
	//인설트
	public String insertImage(PostVO imageInfo) throws Exception;
	//삭제
	public void deleteImage(Map<String, String> params) throws Exception;
	//조회수
	public void hitupInfo(Map<String, String> params) throws Exception;
	

}
