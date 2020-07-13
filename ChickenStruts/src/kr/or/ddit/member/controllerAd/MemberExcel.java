package kr.or.ddit.member.controllerAd;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.IMemberServiceImpl;
import kr.or.ddit.vo.MemberVO;

import org.apache.struts2.ServletActionContext;

public class MemberExcel {
	
	
	private List<MemberVO> memberList;
	
	

//		private List<MemberVO> memberList = new ArrayList<>();
		
		public String execute(){

			
			HttpServletResponse response = ServletActionContext.getResponse();		

				

			IMemberService service = IMemberServiceImpl.getInstance();
			List<MemberVO> memberList = service.memberList(new HashMap<String, String>());	

		

			response.setHeader("content-Disposition", "attachment;fileName=members.xls");
	    	response.setHeader("Content-Discription", "Generate Exel File");
	    	response.setContentType("application/vnd.ms-excel");
			

			return "success";



		}

	
		


	public List<MemberVO> getMemberList() {
		return memberList;
	}





	public void setMemberList(List<MemberVO> memberList) {
		this.memberList = memberList;
	}
	}
