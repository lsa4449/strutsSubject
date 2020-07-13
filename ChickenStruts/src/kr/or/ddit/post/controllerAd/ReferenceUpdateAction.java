package kr.or.ddit.post.controllerAd;

import kr.or.ddit.post.service.IPostService;
import kr.or.ddit.post.service.IPostServiceImpl;
import kr.or.ddit.vo.PostVO;

import com.opensymphony.xwork2.ModelDriven;

public class ReferenceUpdateAction implements ModelDriven<PostVO> {

	private PostVO postInfo;

	public String execute() {

		IPostService service = IPostServiceImpl.getInstance();
		service.updatePost(postInfo);

		return "success";
	}

	@Override
	public PostVO getModel() {
		this.postInfo = new PostVO();
		return this.postInfo;
	}

	public PostVO getPostInfo() {
		return postInfo;
	}

}
