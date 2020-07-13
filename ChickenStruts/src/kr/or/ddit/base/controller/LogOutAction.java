package kr.or.ddit.base.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.base.action.controller.IAction;

public class LogOutAction implements IAction {

	private boolean redirectFlag = false;

	@Override
	public boolean isRedirect() {
		return redirectFlag;
	}

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) {
		
		request.getSession().invalidate();
		
		return "/loginForm.jsp";
	}

}
