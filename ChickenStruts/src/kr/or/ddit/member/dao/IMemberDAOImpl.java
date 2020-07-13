package kr.or.ddit.member.dao;

import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.ibatis.factory.SqlMapClientFactory;
import kr.or.ddit.vo.MemberVO;

public class IMemberDAOImpl implements IMemberDAO {
	
	private static IMemberDAO dao = new IMemberDAOImpl();
	private SqlMapClient client;
	
	private IMemberDAOImpl() {
		client = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static IMemberDAO getInstance(){
		return (dao == null) ? dao = new IMemberDAOImpl() : dao;
	}

	@Override
	public MemberVO memberInfo(Map<String, String> params) throws Exception{

		return (MemberVO) client.queryForObject("member.memberInfo", params);
	}

	@Override
	public List<MemberVO> memberList(Map<String, String> params) throws Exception {

		return client.queryForList("member.memberList", params);
	}

	@Override
	public void updateMemberInfo(MemberVO memberInfo) throws Exception {
		
		client.update("member.updateMember", memberInfo);	
	}

	@Override
	public void insertMemberInfo(MemberVO memberInfo) throws Exception {

		client.insert("member.insertMember", memberInfo);
	}

	@Override
	public String totalCount(Map<String, String> params) throws Exception {
		return (String) client.queryForObject("member.totalCount", params);
	}

	@Override
	public void memberDelete(Map<String, String> params) throws Exception {
		client.update("member.memberDelete", params);
		
	}

	@Override
	public void memberDeleteSuccess(Map<String, String> params)
			throws Exception {
		client.update("member.memberDeleteSuccess", params);
		
	}
}
