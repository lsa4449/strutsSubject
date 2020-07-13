package kr.or.ddit.base.uri.adapter;

import java.util.Map;

import kr.or.ddit.base.action.controller.IAction;
import kr.or.ddit.base.uri.handler.URIHandlerMapper;

public class URIHandlerAdapter {
	public static IAction getAction(String servletPath) {
		Map<String, String> actionMap = URIHandlerMapper.getActionMap();

		IAction action = null;

		if (actionMap.containsKey(servletPath)) {
			try {
				Class targetClazz = Class.forName(actionMap.get(servletPath));
				action = (IAction) targetClazz.newInstance();
			} catch (ClassNotFoundException | InstantiationException | IllegalAccessException e) {
				e.printStackTrace();
			}	
		}
		return action;

	}

}
