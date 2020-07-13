package kr.or.ddit.qna.controller;

import java.lang.reflect.InvocationTargetException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.base.action.controller.IAction;
import kr.or.ddit.qna.service.IQnaBoardService;
import kr.or.ddit.qna.service.IQnaBoardServiceImpl;
import kr.or.ddit.vo.PostVO;

import org.apache.commons.beanutils.BeanUtils;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ModelDriven;

public class QnaBoardUpdateAction implements Action, ModelDriven<PostVO> {
	private PostVO qnaboardInfo;

	@Override
	public String execute() throws Exception {
		
//		try {
//			BeanUtils.populate(qnaboardInfo, request.getParameterMap());
//		} catch (IllegalAccessException e) {
//			e.printStackTrace();
//		} catch (InvocationTargetException e) {
//			e.printStackTrace();
//		}
		
		IQnaBoardService service = IQnaBoardServiceImpl.getInstance();
		service.updateqnaboardInfo(qnaboardInfo);
		
		return SUCCESS;
	}

	@Override
	public PostVO getModel() {
		this.qnaboardInfo = new PostVO();
		return this.qnaboardInfo;
	}

}
