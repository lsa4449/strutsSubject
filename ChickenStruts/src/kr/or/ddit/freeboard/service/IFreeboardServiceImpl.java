package kr.or.ddit.freeboard.service;

import java.util.List;
import java.util.Map;

import org.apache.commons.fileupload.FileItem;

import com.ibatis.sqlmap.client.SqlMapClient;






















import kr.or.ddit.files.dao.IFilesDAO;
import kr.or.ddit.files.dao.IFilesDAOImpl;
import kr.or.ddit.freeboard.dao.IFreeboardDAO;
import kr.or.ddit.freeboard.dao.IFreeboardDAOImpl;
import kr.or.ddit.utiles.AttachFileMapper;
import kr.or.ddit.vo.FilesVO;
import kr.or.ddit.vo.PostVO;
import sun.security.jca.GetInstance;

public class IFreeboardServiceImpl implements IFreeboardService {
	
	private static IFreeboardService service = new IFreeboardServiceImpl();
	private IFreeboardDAO freeboardDAO;
	private SqlMapClient smc;
	private IFilesDAO fileitemDAO;
	
	private IFreeboardServiceImpl() {
		freeboardDAO = IFreeboardDAOImpl.getInstance();
		fileitemDAO = IFilesDAOImpl.getInstance();
	}
	
	public static IFreeboardService getInstance() {
		return(service == null) ? service = new IFreeboardServiceImpl() : service;
	}

	@Override
	public  List<Map<String,String>>  freeboardList(Map<String, String> params) {
		List<Map<String,String>>  freeboardList = null;
		try {
		freeboardList = freeboardDAO.freeboardList(params);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return freeboardList;
	}

	@Override
	public  PostVO freeboardInfo(Map<String, String> params) {
		PostVO freeboardInfo = null;
		try {
		freeboardInfo = freeboardDAO.freeboardInfo(params);
	
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return freeboardInfo;
	}

	@Override
	public void deleteFreeboard(Map<String, String> params) {
		try {
			freeboardDAO.deleteFreeboard(params);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void updateFreeboard(PostVO freeboardInfo) {
		try {
		freeboardDAO.updateFreeboard(freeboardInfo);
	}catch(Exception e) {
		e.printStackTrace();
	}
}

	@Override
	public String totalCount(Map<String, String> params) {
		String totalCount = null;
		
		try {
			totalCount = freeboardDAO.totalCount(params);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return totalCount;
	}

	@Override
	public String insertFreeboard(PostVO freeboardInfo) {
		String post_no = null;
		try {
			post_no = freeboardDAO.insertFreeboard(freeboardInfo);
			
			List<FilesVO> fileItemList = AttachFileMapper.mapper(freeboardInfo);
			
			fileitemDAO.insertFileItem(fileItemList); // items 이거 넣어주려고
		} catch (Exception e) {
			e.printStackTrace();
		}
		return post_no;
		
	}

	@Override
	public String insertFreeboardReply(PostVO freeboardInfo) {
		String post_no = null;
		try{
			post_no = freeboardDAO.insertFreeboardReply(freeboardInfo);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return post_no;
	}

	@Override
	public void hitupInfo(Map<String, String> params) {
		try{
			freeboardDAO.hitupInfo(params);
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
		
	}
		
