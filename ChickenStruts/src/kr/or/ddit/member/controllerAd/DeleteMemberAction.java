package kr.or.ddit.member.controllerAd;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.IMemberServiceImpl;
import kr.or.ddit.vo.MemberVO;

public class DeleteMemberAction {

	private String mem_id;
	// request.setAttribute("memberInfo", memberInfo);
	private MemberVO memberInfo;

	public String deleteMemberInfo() {
		

		HttpServletRequest request = ServletActionContext.getRequest();
		this.mem_id = request.getParameter("mem_id");
		
		Map<String, String> params = new HashMap<String, String>();
		params.put("mem_id", this.mem_id);

		IMemberService service = IMemberServiceImpl.getInstance();
		// this가 MemberVO가 된다(전역변수 선택)
		service.memberDeleteSuccess(params);
		
		return "success";

	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public MemberVO getMemberInfo() {
		return memberInfo;
	}

}
