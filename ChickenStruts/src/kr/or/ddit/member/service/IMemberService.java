package kr.or.ddit.member.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.MemberVO;

public interface IMemberService {
	
	public MemberVO memberInfo(Map<String, String> params);

	public List<MemberVO> memberList(Map<String, String> params);
	
	public void updateMemberInfo(MemberVO memberInfo);

	public void insertMemberInfo(MemberVO memberInfo);

	public void memberDelete(Map<String, String> params);

	public void memberDeleteSuccess(Map<String, String> params);

	public String totalCount(Map<String, String> params);

}
