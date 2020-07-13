package kr.or.ddit.files.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.FilesVO;

public interface IFilesService {
	// 김태진
	public void insertFileItem(List<FilesVO> fileitemList);
	public FilesVO fileitemInfo(Map<String, String> params);

}
