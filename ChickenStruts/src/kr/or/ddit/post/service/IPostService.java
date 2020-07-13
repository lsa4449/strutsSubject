package kr.or.ddit.post.service;

import java.util.List;
import java.util.Map;

import org.apache.commons.fileupload.FileItem;

import kr.or.ddit.vo.PostVO;

public interface IPostService {
	
	//김태진
	public List<PostVO> postList(Map<String, String> params);
	//페이징 처리 
	public String totalCount(Map<String, String> params);
	//상세정보
	public PostVO postInfo(Map<String, String> params);
	//업데이트
	public void updatePost(PostVO postInfo);
	//인설트
	public String insertPost(PostVO postVOInfo);
	//딜리트
	public void deletePost(Map<String, String> params);
	//계층형
	public String insertPostReply(PostVO postInfo);
	
	public void udpateHit(Map<String, String> params);

}
