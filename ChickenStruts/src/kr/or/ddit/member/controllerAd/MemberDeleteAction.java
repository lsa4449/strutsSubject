package kr.or.ddit.member.controllerAd;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.base.action.controller.IAction;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.IMemberServiceImpl;

public class MemberDeleteAction implements IAction{

	private boolean f = false;
	@Override
	public boolean isRedirect() {
		return f;
	}

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) {

		String mem_id = request.getParameter("mem_id");
		
		Map<String,String> params = new HashMap<String,String>();
		params.put("mem_id", mem_id);
		
		IMemberService service = IMemberServiceImpl.getInstance();
		service.memberDelete(params);
		
		return "/user/main/main.tiles";
	}

}
