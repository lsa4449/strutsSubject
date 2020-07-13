package kr.or.ddit.files.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.FilesVO;

public interface IFilesDAO {
	//김태진
	public void insertFileItem(List<FilesVO> fileitemList) throws Exception;
	public FilesVO fileitemInfo(Map<String, String> params) throws Exception;

}
