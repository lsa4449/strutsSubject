package kr.or.ddit.post.service;

import java.util.List;
import java.util.Map;

import org.apache.commons.fileupload.FileItem;

import kr.or.ddit.fileitem.dao.IFileItemDAO;
import kr.or.ddit.fileitem.dao.IFileItemDAOImpl;
import kr.or.ddit.files.dao.IFilesDAO;
import kr.or.ddit.files.dao.IFilesDAOImpl;
import kr.or.ddit.post.dao.IPostDAO;
import kr.or.ddit.post.dao.IPostDAOImpl;
import kr.or.ddit.utiles.AttachFileMapper;
import kr.or.ddit.vo.FilesVO;
import kr.or.ddit.vo.PostVO;

public class IPostServiceImpl implements IPostService {
	private static IPostService service = new IPostServiceImpl();
	private IPostDAO dao;
	private IFileItemDAO fileitemDAO;
	
	private IPostServiceImpl(){
		dao = IPostDAOImpl.getInstance();
		fileitemDAO = IFileItemDAOImpl.getInstance();
	}
	
	public static IPostService getInstance(){
		return (service == null) ? service = new IPostServiceImpl() : service;
	}

	@Override
	public List<PostVO> postList(Map<String, String> params) {
		List<PostVO> postList = null;
		try {
			postList = dao.postList(params);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return postList;
	}

	@Override
	public String totalCount(Map<String, String> params) {
		String totalCount = null;
		try {
			totalCount = dao.totalCount(params);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return totalCount;
	}

	@Override
	public PostVO postInfo(Map<String, String> params) {
		PostVO postInfo = null;
		try {
			postInfo = dao.postInfo(params);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return postInfo;
	}

	@Override
	public void updatePost(PostVO postInfo) {
		try {
			dao.updatePost(postInfo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public String insertPost(PostVO postInfo) {
		String post_no = null;
		try {
			post_no = dao.insertPost(postInfo);
			
			List<FilesVO> fileItemList = AttachFileMapper.mapper(postInfo);

			fileitemDAO.insertFileItem(fileItemList); 
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return post_no;
	}

	@Override
	public void deletePost(Map<String, String> params) {
		try {
			dao.deletePost(params);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public String insertPostReply(PostVO postInfo) {
		String post_no = null;
		try{
			post_no = dao.insertPostReply(postInfo);
		}catch(Exception e){
			e.printStackTrace();
		}
		 
		return post_no;
	}

	@Override
	public void udpateHit(Map<String, String> params) {
		try {
			dao.udpateHit(params);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}
