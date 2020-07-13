package kr.or.ddit.fquestion.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.fileitem.dao.IFileItemDAO;
import kr.or.ddit.fileitem.dao.IFileItemDAOImpl;
import kr.or.ddit.fquestion.dao.IFQuestionBoardDao;
import kr.or.ddit.fquestion.dao.IFQuestionBoardDaoImpl;
import kr.or.ddit.utiles.AttachFileMapper;
import kr.or.ddit.vo.FilesVO;
import kr.or.ddit.vo.PostVO;

import org.apache.commons.fileupload.FileItem;

public class IFQuestionBoardServiceImpl implements IFQuestionBoardService {
	private IFQuestionBoardDao FQuestionDAO;
	private static IFQuestionBoardService service = new IFQuestionBoardServiceImpl();
	private IFileItemDAO fileitemDAO;

	private IFQuestionBoardServiceImpl() {
		FQuestionDAO = IFQuestionBoardDaoImpl.getInstance();
		fileitemDAO = IFileItemDAOImpl.getInstance();
	}

	public static IFQuestionBoardService getInstance() {
		return (service == null) ? service = new IFQuestionBoardServiceImpl() : service;
	}

	@Override
	public List<Map<String, String>> selectFQuestionBoard(
			Map<String, String> params) {
		List<Map<String, String>> listMapFQuestion = null;

		try {
			listMapFQuestion = FQuestionDAO.selectFQuestionBoard(params);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listMapFQuestion;
	}

	@Override
	public List<Map<String, String>> FQuestionBoardInfo(
			Map<String, String> params) {
		List<Map<String, String>> listMap = null;
		try {
			listMap = FQuestionDAO.FQuestionBoardInfo(params);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listMap;
	}

	@Override
	public String insertFQuestionboard(PostVO postVOInfo) {

		String post_no = null;
		try {
			post_no = FQuestionDAO.insertFQuestionboard(postVOInfo);
			
			List<FilesVO> fileItemList = AttachFileMapper.mapper(postVOInfo);

			fileitemDAO.insertFileItem(fileItemList); 
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return post_no;

	}

	@Override
	public void updateFQuestionBoard(PostVO postVO) {

		try {
			FQuestionDAO.updateFQuestionBoard(postVO);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@Override
	public void deleteFQuestionBoardInfo(Map<String, String> params) {
		try {
			FQuestionDAO.deleteFQuestionBoardInfo(params);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public String totalCount(Map<String, String> params) {
		String rnum = null;

		try {
			rnum = FQuestionDAO.totalCount(params);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return rnum;
	}

	@Override
	public List<Map<String, String>> selectFQuestionImageName(
			Map<String, String> params) {

		List<Map<String, String>> listMap = null;

		try {
			listMap = FQuestionDAO.selectFQuestionImageName(params);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return listMap;
	}

	@Override
	public void insertboard(PostVO postVOInfo) {
		try {
			FQuestionDAO.insertboard(postVOInfo);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@Override
	public void udpateHit(Map<String, String> params) {
		try {
			FQuestionDAO.udpateHit(params);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@Override
	public String insertPostReply(PostVO postInfo) {
		String post_no = null;
		
		try{
			post_no = FQuestionDAO.insertPostReply(postInfo);
		}catch(Exception e){
			e.printStackTrace();
		}
		return post_no;
	}
}
