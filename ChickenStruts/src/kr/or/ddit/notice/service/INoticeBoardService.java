package kr.or.ddit.notice.service;

import java.util.List;
import java.util.Map;

import org.apache.commons.fileupload.FileItem;

import kr.or.ddit.vo.FilesVO;
import kr.or.ddit.vo.PostVO;

public interface INoticeBoardService {
	/**
	 * noticeBoard 검색, 전체 들로 가져온다. 전부 가져온다.
	 * @param Map<String, String> params
	 * @return List<Map<String, String>>
	 */
	public List<Map<String, String>> selectNoticeBoard(Map<String, String> params);

	/**
	 * noticeBoardInfo 를 가져온다. 공지사항 1개에 대한 값을 가져온다.
	 * @param Map<String, String> params
	 * @return List<Map<String, String>>
	 */
	public List<Map<String, String>> noticeBoardInfo(Map<String, String> params);

	/**
	 * 파일까지 인서트 할수 있게 한다.
	 * @param postVOInfo
	 * @param fileItemValues
	 * @return String
	 */
	public String insertNoticeboard(PostVO postVOInfo);

	/**
	 * 업데이트 한다. 인자 값은 postVO에 있는 값들 중에서 title, content 이고 조건은 post_no 이다.
	 * @param postVO 
	 */
	public void updateNoticeBoard(PostVO postVO);

	/**
	 * 삭제할 post의 번호를 가지고 삭제한다.
	 * @param params
	 */
	public void deleteNoticeBoardInfo(Map<String, String> params);

	/**
	 * 검색 조건에 맞는 list의 개수 반환
	 * @param params
	 * @return String 타입이기는 하나 list의 갯수를 String 타입으로 받은 것일뿐
	 */
	public String totalCount(Map<String, String> params);

	
	/**
	 * View 에 파일에 대한 정보를 보여주기 위해서 실행한다.
	 * @param params post_no
	 * @return List<FilesVO>
	 */
	public List<FilesVO> selectfileInfo(Map<String, String> params);

	/**
	 * 조회수 증가
	 * @param params
	 */
	public void udpateHit(Map<String, String> params);
	
}
