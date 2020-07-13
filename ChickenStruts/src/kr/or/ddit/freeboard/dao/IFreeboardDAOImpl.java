package kr.or.ddit.freeboard.dao;


import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.ibatis.factory.SqlMapClientFactory;
import kr.or.ddit.vo.PostVO;

public class IFreeboardDAOImpl implements IFreeboardDAO {

	private static IFreeboardDAO dao = new IFreeboardDAOImpl();
	private SqlMapClient smc;

	private IFreeboardDAOImpl() {
		smc = SqlMapClientFactory.getSqlMapClient();

	}

	public static IFreeboardDAO getInstance() {
		return (dao == null) ? dao = new IFreeboardDAOImpl() : dao;
	}

	@Override
	public List<Map<String,String>> freeboardList(Map<String, String> params) throws Exception {

		return smc.queryForList("freeboard.freeboardList", params);
	}

	@Override
	public PostVO freeboardInfo(Map<String, String> params) throws Exception {
		// TODO Auto-generated method stub
		return (PostVO) smc.queryForObject("freeboard.freeboardInfo", params);
	}

	@Override
	public String insertFreeboard(PostVO freeboardInfo) throws Exception {

		return  (String) smc.insert("freeboard.insertFreeboard", freeboardInfo);
		 
	}

	@Override
	public void deleteFreeboard(Map<String, String> params) throws Exception {
		
		smc.update("freeboard.deleteFreeboard", params);
		
	}

	@Override
	public void updateFreeboard(PostVO freeboardInfo) throws Exception {
		smc.update("freeboard.updateFreeboard", freeboardInfo);
		
	}

	@Override
	public String totalCount(Map<String, String> params) throws Exception {
		return(String) smc.queryForObject("freeboard.totalCount", params);
	}

	@Override
	public String insertFreeboardReply(PostVO freeboardInfo) throws Exception {
		String Post_no ="";
		try {
			smc.startTransaction();
			
			String Post_seq;
			if("0".intern() == freeboardInfo.getPosts_seq().intern()) {
				Post_seq = (String) smc.queryForObject("freeboard.incrementSeq", freeboardInfo);
			}else {
				smc.update("freeboard.updateSeq", freeboardInfo);
				Post_seq =String.valueOf(Integer.parseInt(freeboardInfo.getPosts_seq())+1);
			}
			freeboardInfo.setPosts_seq(Post_seq);
			
			String bo_depth = String.valueOf(Integer.parseInt(freeboardInfo.getPost_depth())+1);
			freeboardInfo.setPost_depth(bo_depth);
			
			Post_no = (String)smc.insert("freeboard.insertFreeboardReply", freeboardInfo);
			
			smc.commitTransaction();
		} finally {
			smc.endTransaction();
		}
		
		
		return Post_no;
	}

	@Override
	public void hitupInfo(Map<String, String> params) throws Exception {
		smc.update("qnapost.hitup", params);
		
	}



}
