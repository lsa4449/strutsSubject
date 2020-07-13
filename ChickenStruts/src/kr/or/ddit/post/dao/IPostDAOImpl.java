package kr.or.ddit.post.dao;

import java.util.List;
import java.util.Map;

import org.apache.commons.fileupload.FileItem;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.ibatis.factory.SqlMapClientFactory;
import kr.or.ddit.vo.PostVO;

public class IPostDAOImpl implements IPostDAO {
	
	private static IPostDAO dao = new IPostDAOImpl();
	private SqlMapClient client;
	
	private IPostDAOImpl(){
		client = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static IPostDAO getInstance(){
		return (dao == null) ? dao = new IPostDAOImpl() : dao;
	}

	@Override
	public List<PostVO> postList(Map<String, String> params) throws Exception {
		return client.queryForList("post.postList",params);
	}

	@Override
	public String totalCount(Map<String, String> params) throws Exception {
		return (String) client.queryForObject("post.totalCount", params);
	}

	@Override
	public PostVO postInfo(Map<String, String> params) throws Exception {
		return (PostVO) client.queryForObject("post.postInfo",params);
	}

	@Override
	public void updatePost(PostVO postInfo) throws Exception {
		client.update("post.updatePost", postInfo);
		
	}

	@Override
	public String insertPost(PostVO postInfo) throws Exception{
		return (String) client.insert("post.insertPost", postInfo);
	}

	@Override
	public void deletePost(Map<String, String> params) throws Exception {
		client.update("post.deletePost", params);
		
	}

	@Override
	public String insertPostReply(PostVO postInfo) throws Exception {
		String post_no = "";
		try{
			client.startTransaction();
			
			String posts_seq;
			if("0".intern() == postInfo.getPosts_seq().intern()){
				posts_seq = (String)client.queryForObject("post.incrementSeq", postInfo);
			}else{
				client.update("post.updateSeq", postInfo);
				posts_seq = String.valueOf(Integer.parseInt(postInfo.getPosts_seq())+1);
			}
			
			postInfo.setPosts_seq(posts_seq);
			
			String post_depth = String.valueOf(Integer.parseInt(postInfo.getPost_depth()) +1);
			postInfo.setPost_depth(post_depth);
			
			post_no = (String) client.insert("post.insertPostReply", postInfo);
			
			client.commitTransaction();
		}finally{
			client.endTransaction();
		}
		return post_no;
	}

	@Override
	public void udpateHit(Map<String, String> params) throws Exception {
		client.update("post.udpateHit", params);
		
	}
		

}

