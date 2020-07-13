package kr.or.ddit.fileitem.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.FilesVO;

public interface IFileItemDAO {
	public void insertFileItem(List<FilesVO> fileitemList) throws Exception;
	
	public FilesVO fileitemInfo(Map<String, String> params) throws Exception;
}
