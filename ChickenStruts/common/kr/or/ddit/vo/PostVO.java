package kr.or.ddit.vo;

import java.io.File;
import java.util.List;

public class PostVO {
	private String post_pw;
	private String post_no;
	private String post_title;
	private String post_content;
	private String post_ip;
	private String post_status;
	private String post_group;
	private String posts_seq;
	private String post_depth;
	private String mem_no;
	private String board_no;
	private String post_date;
	private String rnum;
	private String post_hit;
	private String mem_name;
	private String mem_mail;
	private String file_no;
	private String file_save_name;
	
	
	// 전송되는 파일, 파일 컨텐츠 타입, 파일명 을 
	// 파람스 인터셉터로 세팅하게 만들자
	// input type=file name=files
	// 1. 전송되는 파일(변수명 필드네임)
	private List<File> files; // 필드네임은 name 속성에 사용한 이름을 말한다.
	// 2. 전송되는 파일 컨텐츠 타입
	// 변수명명 규칙 : 필드네임 + ContentType
	private List<String> filesContentType;
	// 3. 전송되는 파일명
	// 변수명명 규칙 : 필드 네임 + FileName
	private List<String> filesFileName;
	
	
	public String getMem_mail() {
		return mem_mail;
	}
	public void setMem_mail(String mem_mail) {
		this.mem_mail = mem_mail;
	}
	private List<FilesVO> items;
	
	public String getPost_no() {
		return post_no;
	}
	public void setPost_no(String post_no) {
		this.post_no = post_no;
	}
	public String getPost_title() {
		return post_title;
	}
	public void setPost_title(String post_title) {
		this.post_title = post_title;
	}
	public String getPost_content() {
		return post_content;
	}
	public void setPost_content(String post_content) {
		this.post_content = post_content;
	}
	public String getPost_ip() {
		return post_ip;
	}
	public void setPost_ip(String post_ip) {
		this.post_ip = post_ip;
	}
	public String getPost_status() {
		return post_status;
	}
	public void setPost_status(String post_status) {
		this.post_status = post_status;
	}
	public String getPost_group() {
		return post_group;
	}
	public void setPost_group(String post_group) {
		this.post_group = post_group;
	}
	public String getPosts_seq() {
		return posts_seq;
	}
	public void setPosts_seq(String posts_seq) {
		this.posts_seq = posts_seq;
	}
	public String getPost_depth() {
		return post_depth;
	}
	public void setPost_depth(String post_depth) {
		this.post_depth = post_depth;
	}
	public String getMem_no() {
		return mem_no;
	}
	public void setMem_no(String mem_no) {
		this.mem_no = mem_no;
	}
	public String getBoard_no() {
		return board_no;
	}
	public void setBoard_no(String board_no) {
		this.board_no = board_no;
	}
	public String getPost_date() {
		return post_date;
	}
	public void setPost_date(String post_date) {
		this.post_date = post_date;
	}
	public String getRnum() {
		return rnum;
	}
	public void setRnum(String rnum) {
		this.rnum = rnum;
	}
	public String getPost_hit() {
		return post_hit;
	}
	public void setPost_hit(String post_hit) {
		this.post_hit = post_hit;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public List<FilesVO> getItems() {
		return items;
	}
	public void setItems(List<FilesVO> items) {
		this.items = items;
	}
	public String getPost_pw() {
		return post_pw;
	}
	public void setPost_pw(String post_pw) {
		this.post_pw = post_pw;
	}
	public String getFile_no() {
		return file_no;
	}
	public String getFile_save_name() {
		return file_save_name;
	}
	public void setFile_no(String file_no) {
		this.file_no = file_no;
	}
	public void setFile_save_name(String file_save_name) {
		this.file_save_name = file_save_name;
	}
	public List<File> getFiles() {
		return files;
	}
	public void setFiles(List<File> files) {
		this.files = files;
	}
	public List<String> getFilesContentType() {
		return filesContentType;
	}
	public void setFilesContentType(List<String> filesContentType) {
		this.filesContentType = filesContentType;
	}
	public List<String> getFilesFileName() {
		return filesFileName;
	}
	public void setFilesFileName(List<String> filesFileName) {
		this.filesFileName = filesFileName;
	}
	

	
}
