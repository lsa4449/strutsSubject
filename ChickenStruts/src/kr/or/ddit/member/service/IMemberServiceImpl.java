package kr.or.ddit.member.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.member.dao.IMemberDAO;
import kr.or.ddit.member.dao.IMemberDAOImpl;
import kr.or.ddit.vo.MemberVO;

public class IMemberServiceImpl implements IMemberService {

	// 싱글톤 패턴
	private static IMemberService service = new IMemberServiceImpl();
	private IMemberDAO dao;

	private IMemberServiceImpl() {
		dao = IMemberDAOImpl.getInstance();
	}

	public static IMemberService getInstance() {
		return (service == null) ? service = new IMemberServiceImpl() : service;
	}

	@Override
	public MemberVO memberInfo(Map<String, String> params) {

		MemberVO memberInfo = null;

		try {
			memberInfo = dao.memberInfo(params);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return memberInfo;
	}

	@Override
	public List<MemberVO> memberList(Map<String, String> params) {

		List<MemberVO> list = null;

		try {
			list = dao.memberList(params);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public void updateMemberInfo(MemberVO memberInfo) {

		try {
			dao.updateMemberInfo(memberInfo);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void insertMemberInfo(MemberVO memberInfo) {

		try {
			dao.insertMemberInfo(memberInfo);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@Override
	public String totalCount(Map<String, String> params) {
		String total = null;
	
		try {
			total = dao.totalCount(params);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return total;
	}

	@Override
	public void memberDelete(Map<String, String> params) {

		try {
			dao.memberDelete(params);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void memberDeleteSuccess(Map<String, String> params) {
		
		try {
			dao.memberDeleteSuccess(params);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
