package kr.or.ddit.qna.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.fileitem.dao.IFileItemDAO;
import kr.or.ddit.fileitem.dao.IFileItemDAOImpl;
import kr.or.ddit.qna.dao.IQnaBoardDAO;
import kr.or.ddit.qna.dao.IQnaBoardDAOImpl;
import kr.or.ddit.utiles.AttachFileMapper;
import kr.or.ddit.vo.FilesVO;
import kr.or.ddit.vo.PostVO;

import org.apache.commons.fileupload.FileItem;

public class IQnaBoardServiceImpl implements IQnaBoardService {
	private static IQnaBoardService service = new IQnaBoardServiceImpl();
	private IQnaBoardDAO dao;
	private IFileItemDAO fileitemDAO;
	
	private IQnaBoardServiceImpl(){
		dao = IQnaBoardDAOImpl.getInstance();
		fileitemDAO = IFileItemDAOImpl.getInstance();
	}
	
	public static IQnaBoardService getInstance(){
		return (service == null) ? service = new IQnaBoardServiceImpl() : service;
	}

	@Override
	public List<Map<String, String>> qnaboardList(Map<String, String> params) {
		List<Map<String, String>> qnaboardList = null;

		try{
			qnaboardList = dao.qnaboardList(params);
		} catch(Exception e){
			e.printStackTrace();
		}
		return qnaboardList;
	}

	@Override
	public String insertqnaboardInfo(PostVO postVOInfo) {
		
		String post_no = null;
		try {
			post_no = dao.insertqnaboardInfo(postVOInfo);
			
			List<FilesVO> fileItemList = AttachFileMapper.mapper(postVOInfo);
			
			fileitemDAO.insertFileItem(fileItemList);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return post_no;
		
	}
	@Override
	public PostVO qnaboardInfo(Map<String, String> params) {
		PostVO qnaboardInfo = null;
		try{
			qnaboardInfo = dao.qnaboardInfo(params);
		} catch(Exception e){
			e.printStackTrace();
		}
		return qnaboardInfo;
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
	public void deleteqnaboardInfo(Map<String, String> params) {
		try{
			dao.deleteqnaboardInfo(params);
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	@Override
	public void updateqnaboardInfo(PostVO qnaboardInfo) {
		try{
			dao.updateqnaboardInfo(qnaboardInfo);
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}

	@Override
	public String insertqnaboardReply(PostVO postVOInfo) {
		
		String post_no = null;
		
		try {
			post_no = dao.insertqnaboardReply(postVOInfo);
			
			List<FilesVO> fileItemList = AttachFileMapper.mapper(postVOInfo);
			
			fileitemDAO.insertFileItem(fileItemList);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return post_no;
	}

	@Override
	public void hitupInfo(Map<String, String> params) {
		try{
			dao.hitupInfo(params);
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}

	@Override
	public void insertQnaBoard(PostVO postInfo) {
		// TODO Auto-generated method stub
		
	}
}
