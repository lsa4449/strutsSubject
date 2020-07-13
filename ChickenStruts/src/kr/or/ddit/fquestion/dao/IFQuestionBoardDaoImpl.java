package kr.or.ddit.fquestion.dao;

import java.util.List;
import java.util.Map;

import org.apache.commons.fileupload.FileItem;

import kr.or.ddit.ibatis.factory.SqlMapClientFactory;
import kr.or.ddit.vo.FilesVO;
import kr.or.ddit.vo.PostVO;
import sun.misc.Cleaner;

import com.ibatis.sqlmap.client.SqlMapClient;

public class IFQuestionBoardDaoImpl implements IFQuestionBoardDao {
	private SqlMapClient client;
	private static IFQuestionBoardDao dao = new IFQuestionBoardDaoImpl();
	private IFQuestionBoardDaoImpl(){
		client = SqlMapClientFactory.getSqlMapClient();
	}
	public static IFQuestionBoardDao getInstance(){
		return (dao == null) ? dao = new IFQuestionBoardDaoImpl() : dao;
	}
	
	@Override
	public List<Map<String, String>> selectFQuestionBoard(
			Map<String, String> params) throws Exception {
		return client.queryForList("fquestion.selectFQuestionBoard", params);
	}
	@Override
	public List<Map<String, String>> FQuestionBoardInfo(Map<String, String> params)
			throws Exception {
		return client.queryForList("fquestion.FQuestionBoardInfo", params);
	}
	@Override
	public String insertFQuestionboard(PostVO postVOInfo) throws Exception {
		return (String) client.insert("fquestion.insertFQuestionboard", postVOInfo);
	}
	@Override
	public void updateFQuestionBoard(PostVO postVO) throws Exception {
		client.update("fquestion.updateFQuestionBoard", postVO);
	}
	@Override
	public void deleteFQuestionBoardInfo(Map<String, String> params) throws Exception {
		client.update("fquestion.deleteFQuestionBoardInfo", params);
	}
	@Override
	public String totalCount(Map<String, String> params) throws Exception {
		return (String) client.queryForObject("fquestion.totalCount", params);
	}
	@Override
	public List<Map<String, String>> selectFQuestionImageName(
			Map<String, String> params) throws Exception {
		return client.queryForList("fquestion.selectFQuestionImageName", params);
	}
	@Override
	public void insertboard(PostVO postVOInfo) throws Exception {
		client.insert("fquestion.insertboard", postVOInfo);
	}
	@Override
	public void udpateHit(Map<String, String> params) throws Exception {
		client.update("fquestion.udpateHit", params);
	}
	
	@Override
	public String insertPostReply(PostVO postInfo) throws Exception {
		String post_no = "";
		
		try{
			client.startTransaction();
			
			String posts_seq;
			if("0".intern() == postInfo.getPosts_seq().intern()){
				posts_seq = (String)client.queryForObject("fquestion.incrementSeq", postInfo);
			}else{
				client.update("fquestion.updateSeq", postInfo);
				posts_seq = String.valueOf(Integer.parseInt(postInfo.getPosts_seq())+1);
			}
			
			postInfo.setPosts_seq(posts_seq);
			
			String post_depth = String.valueOf(Integer.parseInt(postInfo.getPost_depth()) +1);
			postInfo.setPost_depth(post_depth);
			
			post_no = (String) client.insert("fquestion.insertPostReply", postInfo);
			
			client.commitTransaction();
		
		}finally{
			client.endTransaction();
		}
		
		return post_no;
	}

}
