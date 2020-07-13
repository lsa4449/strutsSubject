package kr.or.ddit.filter;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;

public class IPCheckFilter implements Filter{
	// 맵을 만들어서 접근 가능한 ip와 불가능한 ip 흉내를 내보려고 한다.
	private static Map<String, String> ipMap;

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		ipMap = new HashMap<String, String>();
		ipMap.put("127.0.0.1", "A");
		ipMap.put("0.0.0.0.0.0.0.1", "A");
		ipMap.put("192.168.206.45", "A");
		ipMap.put("192.168.206.12", "A");
		ipMap.put("192.168.206.37", "F");
		ipMap.put("192.168.206.40", "F");
		
	}
	
	@Override
	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse ,
			FilterChain chain) throws IOException, ServletException {
		// 02 폴더만 해 놓았다.
		
		String clientIP = servletRequest.getRemoteAddr();
		
		boolean flag = true;
		if(StringUtils.isNotEmpty(clientIP) && 
				ipMap.containsKey(clientIP)){
			if("A".intern() == ipMap.get(clientIP).intern()){
				chain.doFilter(servletRequest, servletResponse);
			}else{
				flag = false;
			}
			
		}else{
			// 없는 아이피로 접근할 경우
			flag = false;
		}
		if(!flag){ // A 가 아니면 여기로 들어옴
			HttpServletResponse response = (HttpServletResponse) servletResponse; // 이것을 받앗으니까
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			
			PrintWriter out = response.getWriter();
			out.println("<html>");
			out.println("<body>");
			
			out.println("<font color='red'>꺼져..</font>");
			
			out.println("</body>");
			out.println("</html>");
		}
	}
	
	@Override
	public void destroy() {
		
	}




}
