package kr.or.ddit.notice.service;

import java.nio.file.Files;
import java.util.List;
import java.util.Map;

import kr.or.ddit.files.dao.IFilesDAO;
import kr.or.ddit.files.dao.IFilesDAOImpl;
import kr.or.ddit.notice.dao.INoticeBoardDao;
import kr.or.ddit.notice.dao.INoticeBoardDaoImpl;
import kr.or.ddit.utiles.AttachFileMapper;
import kr.or.ddit.vo.FilesVO;
import kr.or.ddit.vo.PostVO;

import org.apache.commons.fileupload.FileItem;

public class INoticeBoardServiceImpl implements INoticeBoardService{
	private INoticeBoardDao noticeDAO;
	private IFilesDAO fileitemDAO;
	private static INoticeBoardService service = new INoticeBoardServiceImpl();
	
	private INoticeBoardServiceImpl(){
		noticeDAO = INoticeBoardDaoImpl.getInstance();
		fileitemDAO = IFilesDAOImpl.getInstance();
	}
	
	public static INoticeBoardService getInstance(){
		return (service == null) ? service = new INoticeBoardServiceImpl() : service;
	}

	@Override
	public List<Map<String, String>> selectNoticeBoard(
			Map<String, String> params) {
		List<Map<String, String>> listMapNotice = null;
		
		try {
			listMapNotice = noticeDAO.selectNoticeBoard(params);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listMapNotice;
	}

	@Override
	public List<Map<String, String>> noticeBoardInfo(Map<String, String> params) {
		List<Map<String, String>> listMap = null;
		try {
			listMap = noticeDAO.noticeBoardInfo(params);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listMap;
	}

	@Override
	public String insertNoticeboard(PostVO postVOInfo) {
		
		String post_no = null;
		try {
			post_no = noticeDAO.insertNoticeboard(postVOInfo);
			
			List<FilesVO> fileItemList = AttachFileMapper.mapper(postVOInfo);
			
			fileitemDAO.insertFileItem(fileItemList); // items 이거 넣어주려고
		} catch (Exception e) {
			e.printStackTrace();
		}
		return post_no;
		
	}

	@Override
	public void updateNoticeBoard(PostVO postVO) {
		
		try {
			noticeDAO.updateNoticeBoard(postVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void deleteNoticeBoardInfo(Map<String, String> params) {
		try {
			noticeDAO.deleteNoticeBoardInfo(params);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public String totalCount(Map<String, String> params) {
		String rnum = null;
		
		try {
			rnum = noticeDAO.totalCount(params);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return rnum;
	}

	@Override
	public List<FilesVO> selectfileInfo(Map<String, String> params) {
		List<FilesVO> fileInfoList = null;
		
		try {
			fileInfoList = noticeDAO.selectfileInfo(params);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return fileInfoList;
	}

	@Override
	public void udpateHit(Map<String, String> params) {
		try {
			noticeDAO.udpateHit(params);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
