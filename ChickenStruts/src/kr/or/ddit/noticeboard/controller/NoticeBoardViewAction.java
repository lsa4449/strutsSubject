package kr.or.ddit.noticeboard.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.global.GlobalConstant;
import kr.or.ddit.notice.service.INoticeBoardService;
import kr.or.ddit.notice.service.INoticeBoardServiceImpl;


import kr.or.ddit.utiles.CLOBToStringConvert;
import kr.or.ddit.vo.FilesVO;

import com.opensymphony.xwork2.Action;

public class NoticeBoardViewAction implements Action {
	
	private String post_no;
	private Map<String, String> postInfo;
	private List<FilesVO> fileInfo;
	private String fileName;

	@Override
	public String execute() throws Exception {
		List<Map<String, String>> postInfotemp;
		List<FilesVO> filetemp;
		
		Map<String,String> params = new HashMap<String,String>();
		params.put("post_no", this.post_no);
		
		INoticeBoardService service = INoticeBoardServiceImpl.getInstance();
		postInfotemp = service.noticeBoardInfo(params);
		service.udpateHit(params);
		this.postInfo = postInfotemp.get(0);
		
		String convertString = "";
		try {
			convertString = CLOBToStringConvert.convert(postInfo.get("POST_CONTENT"));
			postInfo.put("POST_CONTENT", convertString);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		filetemp = service.selectfileInfo(params);
		this.fileInfo = filetemp;
		
		
		return SUCCESS;
	}
	
	

	public Map<String, String> getPostInfo() {
		return postInfo;
	}



	public void setPost_no(String post_no) {
		this.post_no = post_no;
	}



	public List<FilesVO> getFileInfo() {
		return fileInfo;
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
