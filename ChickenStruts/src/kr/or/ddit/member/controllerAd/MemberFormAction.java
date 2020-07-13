package kr.or.ddit.member.controllerAd;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.IMemberServiceImpl;
import kr.or.ddit.vo.MemberVO;

public class MemberFormAction {
	private String mem_id;
	
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public void execute(){
		Map<String, String> params = new HashMap<String, String>();
		params.put("mem_id", this.mem_id);
		
		IMemberService service = IMemberServiceImpl.getInstance();
		MemberVO memberInfo = service.memberInfo(params);
		
		Map<String, String> jsonMap = new HashMap<String, String>();
		if(memberInfo == null){
			jsonMap.put("flag", "기래 사용가능이다 ");
		}else{
			jsonMap.put("flag", "사용불가능 어떤데?");
			
		}
		
		ObjectMapper mapper = new ObjectMapper();
		try {
			String jsonData = mapper.writeValueAsString(jsonMap);
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setContentType("application/json; charset=UTF-8");
			
			PrintWriter out = response.getWriter();
			out.println(jsonData);
		} catch (JsonGenerationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
