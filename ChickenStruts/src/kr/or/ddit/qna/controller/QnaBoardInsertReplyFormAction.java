package kr.or.ddit.qna.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.util.List;

import kr.or.ddit.global.GlobalConstant;
import kr.or.ddit.qna.service.IQnaBoardService;
import kr.or.ddit.qna.service.IQnaBoardServiceImpl;
import kr.or.ddit.vo.PostVO;

import org.apache.commons.io.FileUtils;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ModelDriven;

public class QnaBoardInsertReplyFormAction implements Action, ModelDriven<PostVO> {
	
	private PostVO postInfo;
	private String fileName;
	
	@Override
	public String execute() throws Exception {
		
		List<File> files = this.postInfo.getFiles();
		List<String> contentTypes = this.postInfo.getFilesContentType();
		List<String> fileNames = this.postInfo.getFilesFileName();
		

		for(int i=0; i<files.size(); i++){
			File targetFile = files.get(i);
			if (targetFile.length() > 0) { // file size가 0보다 클때(파일이 존재할때)만 동작
				File saveFile = new File(GlobalConstant.FILE_PATH, fileNames.get(i)); // 여기서 서버에 저장되는 부분, 원래 어디서 해야하는데

				FileUtils.copyFile(targetFile, saveFile); // 1번째 인자가 원본파일, 2번째 파일이 대상파일에 쓰여지게 되는 것
				this.fileName = fileNames.get(i);
			}
		}
		IQnaBoardService service = IQnaBoardServiceImpl.getInstance();

		service.insertqnaboardReply(postInfo);
		
		return SUCCESS;
	}
	
	@Override
	public PostVO getModel() {
		this.postInfo = new PostVO();
		return this.postInfo;
	}

	public String getFileName() {
		return fileName;
	}
	
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	private String contentDisposition;
	private long contentLength;
	private InputStream inputStream;

	public String getContentDisposition() {
		return contentDisposition;
	}

	public long getContentLength() {
		return contentLength;
	}

	public InputStream getInputStream() {
		return inputStream;
	}

	public String fileDownload(){
		File downloadFile = new File(GlobalConstant.FILE_PATH, this.fileName);
		this.contentDisposition = "attachment;fileName=" + this.fileName;
		this.contentLength = downloadFile.length();

		try {
			this.inputStream = new FileInputStream(downloadFile);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}

		return "success";
	}
}
