package kr.or.ddit.fileitem.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.fileitem.dao.IFileItemDAO;
import kr.or.ddit.fileitem.dao.IFileItemDAOImpl;
import kr.or.ddit.vo.FilesVO;

public class IFileItemServiceImpl implements IFileItemService {
	
	private IFileItemDAO dao;
	
	private static IFileItemService service = new IFileItemServiceImpl();
	
	private IFileItemServiceImpl(){
		dao = IFileItemDAOImpl.getInstance();
	}
	
	public static IFileItemService getInstance(){
		return (service == null) ? service = new IFileItemServiceImpl() : service;
	}
	
	@Override
	public void insertFileItem(List<FilesVO> fileitemList) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public FilesVO fileitemInfo(Map<String, String> params) {
		FilesVO fileitemInfo = null;
		try {
			fileitemInfo = dao.fileitemInfo(params);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return fileitemInfo;
	}



}
