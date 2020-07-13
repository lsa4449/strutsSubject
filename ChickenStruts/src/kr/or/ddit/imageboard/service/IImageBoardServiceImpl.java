package kr.or.ddit.imageboard.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.fileupload.FileItem;

import kr.or.ddit.files.dao.IFilesDAO;
import kr.or.ddit.files.dao.IFilesDAOImpl;
import kr.or.ddit.imageboard.dao.IImageBoardDAO;
import kr.or.ddit.imageboard.dao.IImageBoardDAOImpl;
import kr.or.ddit.utiles.AttachFileMapper;
import kr.or.ddit.vo.FilesVO;
import kr.or.ddit.vo.PostVO;

public class IImageBoardServiceImpl implements IImageBoardService {
	private static IImageBoardService service = new IImageBoardServiceImpl();
	private IImageBoardDAO dao;
	private IFilesDAO filesDAO;

	private IImageBoardServiceImpl() {
		dao = IImageBoardDAOImpl.getInstance();
		filesDAO = IFilesDAOImpl.getInstance();
	}

	public static IImageBoardService getInstance() {
		return (service == null) ? service = new IImageBoardServiceImpl()
				: service;
	}

	@Override
	public List<PostVO> imageboardList(Map<String, String> params) {
		List<PostVO> imageboardList = null;
		try {
			imageboardList = dao.imageboardList(params);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return imageboardList;
	}

	@Override
	public String totalCount(Map<String, String> params) {
		String totalCount = null;
		try{
			totalCount = dao.totalCount(params);
		}catch(Exception e){
			e.printStackTrace();
		}
		return totalCount;
	}

	@Override
	public List<PostVO> imageInfo(Map<String, String> params) {
		List<PostVO> imageInfo = null;
		try {
			imageInfo = dao.imageInfo(params);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return imageInfo;
	}

	@Override
	public String insertImage(PostVO postVOInfo) {
		String post_no = null;
		try {
			post_no = dao.insertImage(postVOInfo);
			
			List<FilesVO> fileItemList = AttachFileMapper.mapper(postVOInfo);
			
			filesDAO.insertFileItem(fileItemList);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return post_no;
	}

	@Override
	public void deleteImage(Map<String, String> params) {
		try {
			dao.deleteImage(params);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		
	}

	@Override
	public void hitupInfo(Map<String, String> params) {
		try {
			dao.hitupInfo(params);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
	}


}
