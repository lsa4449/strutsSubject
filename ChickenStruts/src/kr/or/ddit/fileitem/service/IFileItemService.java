package kr.or.ddit.fileitem.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.FilesVO;

public interface IFileItemService {
	public void insertFileItem(List<FilesVO> fileitemList);
	
	
	/**
	 * 한개의 파일 아이템 가져오는 것 
	 * @param params
	 * @return FileItemVO
	 */
	public FilesVO fileitemInfo(Map<String, String> params);
}
