package kr.or.ddit.listener;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextAttributeEvent;
import javax.servlet.ServletContextAttributeListener;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import kr.or.ddit.utiles.Log4jInitialize;

public class Log4jInitializeListener implements
		ServletContextAttributeListener, ServletContextListener {

	@Override
	public void contextInitialized(ServletContextEvent arg0) {
		System.out.println("Application(ServletContent) 최초 인스턴스시 전파되는 이벤트 청취자 리스너");
		
		Log4jInitialize.init();
	}

	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		System.out.println("Application(ServletContent) GC되기 직전 전파되는 이벤트 청취자 리스너");
	}


	@Override
	public void attributeAdded(ServletContextAttributeEvent event) {
		System.out.println("applicaion.setAttribute(키, 값) 저장시 전파되는 이벤트 청취자 리스너");
		ServletContext application = event.getServletContext();
		// application.setAttribute(키, 값)
		String key = event.getName();
		Object value = event.getValue();
	}

	@Override
	public void attributeRemoved(ServletContextAttributeEvent arg0) {
		System.out.println("applicaion.removeAttribute(키) 삭제시 전파되는 이벤트 청취자 리스너");

	}

	@Override
	public void attributeReplaced(ServletContextAttributeEvent arg0) {
		System.out.println("applicaion.setAttribute(기존 동일키, 상이값) 갱신시 전파되는 이벤트 청취자 리스너");

	}

}
