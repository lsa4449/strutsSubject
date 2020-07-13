package kr.or.ddit.fileitem.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.ibatis.factory.SqlMapClientFactory;
import kr.or.ddit.vo.FilesVO;

import com.ibatis.sqlmap.client.SqlMapClient;

public class IFileItemDAOImpl implements IFileItemDAO{
	private static IFileItemDAO dao = new IFileItemDAOImpl();
	
	private SqlMapClient client;
	
	private IFileItemDAOImpl(){
		client = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static IFileItemDAO getInstance(){
		return (dao == null) ? dao = new IFileItemDAOImpl() : dao;
	}
	
	@Override
	public void insertFileItem(List<FilesVO> fileitemList) throws Exception { // 트랜잭션 처리 해준다. 하나라도 실패하면 다 실패 
		try {
			// iBatis 트랜잭션
			//		Commit : startTransaction => 쿼리 질의(전체 성공)
			//				 => commitTransaction()
			//				 => client.endTransaction();
			//		Rollback : startTransaction => 쿼리 질의(일부 성공)
			//				 => client.endTransaction();
			client.startTransaction();
			
			for (FilesVO fileItemInfo : fileitemList) {
				client.insert("files.insertFileItem", fileItemInfo);
			}
			client.commitTransaction();
		} finally {
			client.endTransaction();
		}
	}

	@Override
	public FilesVO fileitemInfo(Map<String, String> params) throws Exception {
		
		return (FilesVO) client.queryForObject("files.fileitemInfo", params);
	}

}
