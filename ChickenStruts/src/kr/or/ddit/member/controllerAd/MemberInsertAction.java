package kr.or.ddit.member.controllerAd;


import java.util.HashMap;
import java.util.Map;





import com.opensymphony.xwork2.ModelDriven;


import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.IMemberServiceImpl;
import kr.or.ddit.vo.MemberVO;

public class MemberInsertAction implements ModelDriven<MemberVO>{

	private String mem_id;
	// request.setAttribute("memberInfo", memberInfo);
	private MemberVO memberInfo;

	public String InsertMemberInfo() {
		Map<String, String> params = new HashMap<
				String, String>();
		params.put("mem_id", this.mem_id);

		IMemberService service = IMemberServiceImpl.getInstance();
		// this가 MemberVO가 된다(전역변수 선택)
		service.insertMemberInfo(this.memberInfo);
		
		return "success";

	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public MemberVO getMemberInfo() {
		return memberInfo;
	}

	@Override
	public MemberVO getModel() {

this.memberInfo = new MemberVO();
		return this.memberInfo;
	}
}
