package kr.or.ddit.utiles;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import kr.or.ddit.global.GlobalConstant;
import kr.or.ddit.vo.FilesVO;
import kr.or.ddit.vo.PostVO;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;

public class AttachFileMapper {

	public static List<FilesVO> mapper(PostVO postVOInfo) {

		// FileItem은 common라이브러리인데 vo에 저장되있는건 List<fileVO>이다. 이걸 어떻게 변경하지?

		String fileName = "";

		List<FilesVO> FreeBoardFileItemList = new ArrayList<FilesVO>();

		if (postVOInfo.getFiles() != null) {

			FilesVO postFileItemInfo = null;

			List<File> files = postVOInfo.getFiles();
			List<String> contentType = postVOInfo.getFilesContentType();
			List<String> fileNames = postVOInfo.getFilesFileName();

			for (int i = 0; i < files.size(); i++) {
				postFileItemInfo = new FilesVO();

				File targetFile = files.get(i);

				if (targetFile.length() > 0) {

					fileName = fileNames.get(i);
					postFileItemInfo.setFile_upload_name(fileName);

					String baseName = FilenameUtils.getBaseName(fileName);
					// a.png => png
					String extension = FilenameUtils.getExtension(fileName);
					// -----------------유니크한 랜덤값 -------------
					// UUID(Univerally unique Identifier) : 128bit 유일값 생성("-"
					// 포함)
					String genID = UUID.randomUUID().toString()
							.replace("-", "");

					// a12341245135135135135871938571923847325.png
					String saveFileName = baseName + genID + "." + extension;

					postFileItemInfo.setFile_save_name(saveFileName);

					postFileItemInfo
							.setFile_content_type(contentType.get(i));
					postFileItemInfo.setFile_size(String.valueOf(files
							.get(i).length()));
					postFileItemInfo.setFile_no(postVOInfo.getPost_no());
					postFileItemInfo.setPost_no(postVOInfo.getPost_no());
					FreeBoardFileItemList.add(postFileItemInfo);

					saveFile(saveFileName, targetFile);
				}

			}
		}
		return FreeBoardFileItemList;
	}

	private static void saveFile(String saveFileName, File targetfile) {

		File saveFile = new File(GlobalConstant.FILE_PATH, saveFileName);

		try {
			FileUtils.copyFile(targetfile, saveFile);
		} catch (IOException e) {
			e.printStackTrace();
		} // 첫 번재 아규먼트 원본, 두번째 아규먼트 복사해서 저장할 파일
	}

}