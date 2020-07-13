package kr.or.ddit.notice.dao;

import java.util.List;
import java.util.Map;

import org.apache.commons.fileupload.FileItem;

import kr.or.ddit.ibatis.factory.SqlMapClientFactory;
import kr.or.ddit.vo.FilesVO;
import kr.or.ddit.vo.PostVO;
import sun.misc.Cleaner;

import com.ibatis.sqlmap.client.SqlMapClient;

public class INoticeBoardDaoImpl implements INoticeBoardDao {
	private SqlMapClient client;
	private static INoticeBoardDao dao = new INoticeBoardDaoImpl();
	private INoticeBoardDaoImpl(){
		client = SqlMapClientFactory.getSqlMapClient();
	}
	public static INoticeBoardDao getInstance(){
		return (dao == null) ? dao = new INoticeBoardDaoImpl() : dao;
	}
	
	@Override
	public List<Map<String, String>> selectNoticeBoard(
			Map<String, String> params) throws Exception {
		return client.queryForList("notice.selectNoticeBoard", params);
	}
	@Override
	public List<Map<String, String>> noticeBoardInfo(Map<String, String> params)
			throws Exception {
		return client.queryForList("notice.noticeBoardInfo", params);
	}
	@Override
	public String insertNoticeboard(PostVO postVOInfo) throws Exception {
		return (String) client.insert("notice.insertNoticeboard", postVOInfo);
	}
	@Override
	public void updateNoticeBoard(PostVO imageBoardInfo) throws Exception {
		client.update("notice.updateNoticeBoard", imageBoardInfo);
	}
	@Override
	public void deleteNoticeBoardInfo(Map<String, String> params) throws Exception {
		client.update("notice.deleteNoticeBoardInfo", params);
	}
	@Override
	public String totalCount(Map<String, String> params) throws Exception {
		return (String) client.queryForObject("notice.totalCount", params);
	}
	@Override
	public List<FilesVO> selectfileInfo(Map<String, String> params)
			throws Exception {
		return client.queryForList("notice.selectfileInfo", params);
	}
	@Override
	public void udpateHit(Map<String, String> params) throws Exception {
		client.update("notice.udpateHit", params);
	}

	
	

}
