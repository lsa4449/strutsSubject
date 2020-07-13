package kr.or.ddit.base.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.base.action.controller.IAction;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.IMemberServiceImpl;
import kr.or.ddit.vo.MemberVO;





public class LoginCheckAction implements IAction{
	private boolean redirectFlag = false;

	@Override
	public boolean isRedirect() {
		return redirectFlag;
	}

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) {
		
	
		
		
		String mem_id = request.getParameter("mem_id");
		String mem_pw = request.getParameter("mem_pw");
		
		Map<String, String> params = new HashMap<String, String>();
		params.put("mem_id", mem_id);
		params.put("mem_pw", mem_pw);

		IMemberService service = IMemberServiceImpl.getInstance();
		MemberVO memberInfo = service.memberInfo(params);

		String message = ""; 
		if (memberInfo == null) {
			try {
				message = URLEncoder.encode("회원이 아닙니다.", "UTF-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		} else {
			request.getSession().setAttribute("LOGINMEMBERINFO", memberInfo);
			try {
				message = URLEncoder.encode(memberInfo.getMem_name() + "님 환영합니다 ", "UTF-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		request.setAttribute("message", message);
		
		if (memberInfo.getMem_auth().equals("1")) {
			return "/user/main/main.do?message=" + message;
		
		} else {
			return "/admin/main/main.do1?message=" + message;
		}
		
	}

}
