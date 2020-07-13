package kr.or.ddit.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.apache.commons.lang3.StringUtils;

public class EncodingFilter implements Filter{

	@Override
	public void destroy() {
		
	}

	@Override
	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse,
			FilterChain chain) throws IOException, ServletException {
		// 클라이언트 전송하는 쿼리스트링 전송 방식 :
		//			GET		: server.xml <- connector URIEncoding="UTF-8" 
		//			POST 	: jsp 내 스크립트릿 영역 request.setCharacterEncoding("UTF-8");
		// 클라이언트의 쿼리스트링 전송시 특정 인코딩 처리 요구를 요청 헤더에 포함 시킬 수 있다.
		//			자바스크립트 코드로 가능 : Accept_Charset : UTF-8

		String encodingType = servletRequest.getCharacterEncoding();
		
		// http://commons.apache.org
		//		commons-lang3-3.1.jar
		// java.lang.String 클래스의 확장 API 라이브러리
		//	if(encodingType == null && encodingType == "") 이 조건을 확장 라이브러리를 사용하면
		//		StringUtils.isNotEmpty(encodingType) 이렇게 짧아진다.
		
		if (!StringUtils.isNotEmpty(encodingType)) { // 비어 있다면
			encodingType = "UTF-8";
		}
		
		servletRequest.setCharacterEncoding(encodingType);
		
		chain.doFilter(servletRequest, servletResponse);
		// 여기까지 하면 jsp에 선언된 request.setCharacterEncoding("UTF-8"); 이 선언이 필요 없어진다.
		
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		
	}

}
