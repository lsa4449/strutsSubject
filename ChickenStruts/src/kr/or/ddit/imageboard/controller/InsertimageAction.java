package kr.or.ddit.imageboard.controller;

import java.io.File;
import java.util.List;

import org.apache.commons.io.FileUtils;

import kr.or.ddit.global.GlobalConstant;
import kr.or.ddit.imageboard.service.IImageBoardService;
import kr.or.ddit.imageboard.service.IImageBoardServiceImpl;
import kr.or.ddit.vo.PostVO;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ModelDriven;

public class InsertimageAction implements Action, ModelDriven<PostVO> {
	
	private PostVO imageInfo;
	private String fileName;
	
	@Override
	public String execute() throws Exception {
		List<File> files = this.imageInfo.getFiles();
		List<String> contentTypes = this.imageInfo.getFilesContentType();
		List<String> fileNames = this.imageInfo.getFilesFileName();
		
		for(int i=0; i<files.size(); i++){
			File targetFile = files.get(i);
			if (targetFile.length() > 0){
				File saveFile = new File(GlobalConstant.FILE_PATH, fileNames.get(i));
				
				FileUtils.copyFile(targetFile, saveFile);
				this.fileName = fileNames.get(i);
			}
		}
		
		IImageBoardService service = IImageBoardServiceImpl.getInstance();
		service.insertImage(imageInfo);
		
		return SUCCESS;
		
	}
	
	@Override
	public PostVO getModel() {
		this.imageInfo = new PostVO();
		return this.imageInfo;
	}

	public String getFileName() {
		return fileName;
	}
	

}
