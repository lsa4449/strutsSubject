package kr.or.ddit.imageboard.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.fileupload.FileItem;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.ibatis.factory.SqlMapClientFactory;
import kr.or.ddit.vo.FilesVO;
import kr.or.ddit.vo.PostVO;

public class IImageBoardDAOImpl implements IImageBoardDAO {
	
	private static IImageBoardDAO dao = new IImageBoardDAOImpl();
	private SqlMapClient client;
	
	private IImageBoardDAOImpl(){
		client = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static IImageBoardDAO getInstance(){
		return (dao == null) ? dao = new IImageBoardDAOImpl() : dao;
	}

	@Override
	public List<PostVO> imageboardList(Map<String, String> params) throws Exception {
		return client.queryForList("imageBoard.imageboardList", params);
	}

	@Override
	public String totalCount(Map<String, String> params) throws Exception {
		return (String) client.queryForObject("imageBoard.totalCount", params);
	}

	@Override
	public List<PostVO> imageInfo(Map<String, String> params) throws Exception {
		return client.queryForList("imageBoard.imageInfo", params);
	}

	@Override
	public String insertImage(PostVO imageInfo) throws Exception {
		return (String) client.insert("imageBoard.insertImage", imageInfo);
	}

	@Override
	public void deleteImage(Map<String, String> params) throws Exception {
		client.update("imageBoard.deleteImage", params);
		
	}

	@Override
	public void hitupInfo(Map<String, String> params) throws Exception {
		client.update("imageBoard.updateHit",params);
		
	}
	


}
