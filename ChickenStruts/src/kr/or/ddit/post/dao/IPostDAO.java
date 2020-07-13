package kr.or.ddit.post.dao;

import java.util.List;
import java.util.Map;

import org.apache.commons.fileupload.FileItem;

import kr.or.ddit.vo.PostVO;

public interface IPostDAO {
	
	public List<PostVO> postList(Map<String, String> params) throws Exception;
	
	public String totalCount(Map<String, String> params) throws Exception;
	
	public PostVO postInfo(Map<String, String> params) throws Exception;
	
	public void updatePost(PostVO postInfo) throws Exception;
	
	public String insertPost(PostVO postInfo) throws Exception;
	
	public void deletePost(Map<String, String> params) throws Exception;
	
	public String insertPostReply(PostVO postInfo) throws Exception;
	
	public void udpateHit(Map<String, String> params) throws Exception;
	
	

}
