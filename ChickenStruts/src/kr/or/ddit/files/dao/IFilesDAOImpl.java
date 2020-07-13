package kr.or.ddit.files.dao;

import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.ibatis.factory.SqlMapClientFactory;
import kr.or.ddit.vo.FilesVO;

public class IFilesDAOImpl implements IFilesDAO {
	private static IFilesDAO dao = new IFilesDAOImpl();
	private SqlMapClient client;
	
	private IFilesDAOImpl(){
		client = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static IFilesDAO getInstance(){
		return (dao == null) ? dao = new IFilesDAOImpl() : dao;
	}

	@Override
	public void insertFileItem(List<FilesVO> fileitemList) throws Exception {
		try{
			// iBatis 트랜잭션
			// 	  Commit : startTransaction() => 쿼리 질의(전체 성공)
			//			   => commitTransaction()
			//			   => client.endTransaction();
			//	  Rollback : startTransaction() => 쿼리 질의( 일부 성공후 에러)
			//			   => client.endTransaction();
			
			client.startTransaction();
			
		 for(FilesVO fileItemInfo : fileitemList){
			 client.insert("files.insertFileItem", fileItemInfo);
		 }
		 
		 client.commitTransaction();
	}finally{
		 client.endTransaction();
			 
		 }
		
	}


	@Override
	public FilesVO fileitemInfo(Map<String, String> params) throws Exception {
		return (FilesVO) client.queryForObject("files.fileitemInfo", params);
	}
}
