package kr.or.ddit.qna.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.ibatis.factory.SqlMapClientFactory;
import kr.or.ddit.vo.PostVO;

import com.ibatis.sqlmap.client.SqlMapClient;

public class IQnaBoardDAOImpl implements IQnaBoardDAO {
	
	private static IQnaBoardDAO dao = new IQnaBoardDAOImpl();
	private SqlMapClient client;
	
	private IQnaBoardDAOImpl(){
		client = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static IQnaBoardDAO getInstance(){
		return (dao == null) ? dao = new IQnaBoardDAOImpl() : dao;
	}
	
	@Override
	public List<Map<String, String>> qnaboardList(Map<String, String> params)throws Exception {
		return client.queryForList("qnapost.qnabaordList", params);
	}

	@Override
	public String insertqnaboardInfo(PostVO postInfo) throws Exception {
		return (String)client.insert("qnapost.insertQnaboard", postInfo);
		
	}

	@Override
	public PostVO qnaboardInfo(Map<String, String> params) throws Exception {
		return (PostVO) client.queryForObject("qnapost.qnaboardInfo",params);
	}

	@Override
	public String totalCount(Map<String, String> params) throws Exception {
		return (String) client.queryForObject("qnapost.totalCount", params);
	}

	@Override
	public void deleteqnaboardInfo(Map<String, String> params) throws Exception {
		client.update("qnapost.deleteQnaboard",params);
	}

	@Override
	public void updateqnaboardInfo(PostVO qnaboardInfo) throws Exception {
		client.update("qnapost.updateQnaboard", qnaboardInfo);
	}

	@Override
	public String insertqnaboardReply(PostVO postInfo) throws Exception {
		
		String post_no = "";
		
		try{
			client.startTransaction();
			
			String post_seq;
			
			if("0".intern() == postInfo.getPosts_seq().intern()){
				post_seq = (String) client.queryForObject("qnapost.incrementSeq", postInfo);
			}else{
				client.update("qnapost.updateSeq", postInfo);
				post_seq =  String.valueOf(Integer.parseInt(postInfo.getPosts_seq()) + 1);
			}
			
			postInfo.setPosts_seq(post_seq);
			
			String post_depth = String.valueOf(Integer.parseInt(postInfo.getPost_depth()) + 1);
			postInfo.setPost_depth(post_depth);
			
			post_no = (String) client.insert("qnapost.insertQnaboardReply", postInfo);
			
			client.commitTransaction();
		}finally{
			client.endTransaction();
		}
		return post_no;
	}

	@Override
	public void hitupInfo(Map<String, String> params) throws Exception {
		client.update("qnapost.hitup", params);
		
		
	}

}
