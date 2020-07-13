package kr.or.ddit.freeboard.controllerAd;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;

import kr.or.ddit.freeboard.service.IFreeboardService;
import kr.or.ddit.freeboard.service.IFreeboardServiceImpl;
import kr.or.ddit.global.GlobalConstant;
import kr.or.ddit.vo.PostVO;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ModelDriven;

public class AdminFreeBoardUpdateAction implements Action, ModelDriven<PostVO> {
	
	private PostVO freeboardInfo;
	private String fileName;

	@Override
	public String execute() throws Exception {
		IFreeboardService service = IFreeboardServiceImpl.getInstance();
		service.updateFreeboard(this.freeboardInfo);
		return "success";
		
	}

	@Override
	public PostVO getModel() {
		this.freeboardInfo = new PostVO();
		return this.freeboardInfo;
	}
	
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	
	private String contentDisposition;
	private long contentLength;
	private InputStream inputStream;
	
	public String fileDownload(){
		File downloadFile = new File(GlobalConstant.FILE_PATH,this.fileName);
		this.contentDisposition = "attachment;fileName=" + this.fileName;
		this.contentLength = downloadFile.length();
		
		try{
			this.inputStream = new FileInputStream(downloadFile);
		}catch(FileNotFoundException e){
			e.printStackTrace();
		}
		
		return "success";
	}

	public String getContentDisposition() {
		return contentDisposition;
	}

	public long getContentLength() {
		return contentLength;
	}

	public InputStream getInputStream() {
		return inputStream;
	}

}
