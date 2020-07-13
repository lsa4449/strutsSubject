package kr.or.ddit.post.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.apache.commons.io.FileUtils;

import kr.or.ddit.global.GlobalConstant;
import kr.or.ddit.post.service.IPostService;
import kr.or.ddit.post.service.IPostServiceImpl;
import kr.or.ddit.vo.PostVO;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ModelDriven;

public class ReferenceInsertAction implements Action, ModelDriven<PostVO> {

	private PostVO postInfo;
	private String fileName;

	public String execute() throws Exception {

		List<File> files = this.postInfo.getFiles();
		List<String> contentTypes = this.postInfo.getFilesContentType();
		List<String> fileNames = this.postInfo.getFilesFileName();

		for (int i = 0; i < files.size(); i++) {
			File targetFile = files.get(i);
			if (targetFile.length() > 0) {  
				File saveFile = new File(GlobalConstant.FILE_PATH,
						fileNames.get(i));  

				FileUtils.copyFile(targetFile, saveFile);  
															 
				this.fileName = fileNames.get(i);
			}
		}

		IPostService service = IPostServiceImpl.getInstance();
		service.insertPost(postInfo);

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

	public String fileDownload() {
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
