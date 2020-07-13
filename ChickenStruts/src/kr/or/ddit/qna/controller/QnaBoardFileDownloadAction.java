package kr.or.ddit.qna.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.base.action.controller.IAction;
import kr.or.ddit.fileitem.service.IFileItemService;
import kr.or.ddit.fileitem.service.IFileItemServiceImpl;
import kr.or.ddit.global.GlobalConstant;
import kr.or.ddit.vo.FilesVO;

public class QnaBoardFileDownloadAction implements IAction {


	
	@Override
	public boolean isRedirect() {
		return false;
	}

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) {
		
		String file_no = request.getParameter("file_no");
		
		Map<String, String> params = new HashMap<String,String>();
		params.put("file_no",  file_no);
		
		IFileItemService service = IFileItemServiceImpl.getInstance();
		FilesVO fileInfo = service.fileitemInfo(params);
		
		File downloadFile = new File(GlobalConstant.FILE_PATH, fileInfo.getFile_save_name());
		
		if(downloadFile.exists()){
			String fileName = null;
			
			try{
				fileName = URLEncoder.encode(fileInfo.getFile_upload_name(), "UTF-8");
			} catch(UnsupportedEncodingException e){
				e.printStackTrace();
			}
			
			 response.setHeader("Content-Disposition", "attachment;fileName=" + fileName);
	         response.setContentType("application/octet-stream");
	         response.setContentLength((int)downloadFile.length());
	         
	         byte[] buffer = new byte[(int)downloadFile.length()];
	         
	           BufferedInputStream inputStream = null;
	               
	               try{
	               inputStream = new BufferedInputStream(new FileInputStream(downloadFile));
	               } catch(FileNotFoundException e){
	                  e.printStackTrace();
	               }
	               BufferedOutputStream outputStream = null;
	               
	               try {
	                  outputStream = new BufferedOutputStream(response.getOutputStream());
	               } catch (IOException e) {
	                  e.printStackTrace();
	               }
	               
	               int readCNT = 0;
	               try {
	                  while((readCNT = inputStream.read(buffer)) != -1){
	                     outputStream.write(buffer);
	                  }
	               } catch (IOException | IllegalStateException e) {
	                  e.printStackTrace();
	               }
	               
	               try {
	                  inputStream.close();
	                  outputStream.close();
	               } catch (IOException  | IllegalStateException e) {
	                  e.printStackTrace();
	               }
		}
		
		return null;
		
		
	}

}
