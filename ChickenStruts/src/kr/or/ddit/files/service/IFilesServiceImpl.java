
package kr.or.ddit.files.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.files.dao.IFilesDAO;
import kr.or.ddit.files.dao.IFilesDAOImpl;
import kr.or.ddit.vo.FilesVO;

public class IFilesServiceImpl implements IFilesService {
	private static IFilesService service = new IFilesServiceImpl();
	private IFilesDAO dao;
	
	private IFilesServiceImpl(){
		dao = IFilesDAOImpl.getInstance();
	}
	
	public static IFilesService getInstance(){
		return (service == null) ? service = new IFilesServiceImpl() : service;
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
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return fileitemInfo;
	}
}
