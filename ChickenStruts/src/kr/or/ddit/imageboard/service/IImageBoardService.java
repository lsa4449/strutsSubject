package kr.or.ddit.imageboard.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.FilesVO;
import kr.or.ddit.vo.PostVO;

import org.apache.commons.fileupload.FileItem;

public interface IImageBoardService {
	//리스트
	public List<PostVO> imageboardList(Map<String, String> params);
	//페이징
	public String totalCount(Map<String, String> params);
	//상세정보
	public List<PostVO> imageInfo(Map<String, String> params);
	//인설트
	public String insertImage(PostVO postVOInfo);
	//삭제
	public void deleteImage(Map<String, String> params);
	//조회수
	public void hitupInfo(Map<String, String> params);
	


}
