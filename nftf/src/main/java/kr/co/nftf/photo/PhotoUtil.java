package kr.co.nftf.photo;

import java.io.File;
import java.nio.file.Files;
import java.util.UUID;

import org.springframework.util.FileCopyUtils;

import net.coobird.thumbnailator.Thumbnails;

public class PhotoUtil {

	static final int THUMB_WIDTH = 300;
	static final int THUMB_HEIGHT = 300;

	public String fileUpload(String uploadPath, String fileName, byte[] fileData) 
			throws Exception {
		UUID uid = UUID.randomUUID();

		String newFileName = uid + "_" + fileName;
		String imgPath = uploadPath + File.separator;

		File target = new File(imgPath, newFileName);
		FileCopyUtils.copy(fileData, target);

		String thumbFileName = "s_" + newFileName;
		File image = new File(imgPath + File.separator + newFileName);

		File thumbnail = new File(imgPath + File.separator + "s" + File.separator + thumbFileName);

		if (image.exists()) {
			thumbnail.getParentFile().mkdirs();
			Thumbnails.of(image).size(THUMB_WIDTH, THUMB_HEIGHT).toFile(thumbnail);
		}
		
		System.out.println("newFileName : " + newFileName);
		return newFileName;
	}
	
	//이미지 가져오기
	public byte[] getFile(Photo photo) {
		try {
			if (photo != null) {
				File file =  new File(photo.getPath() + photo.getPhysicalName());
				
				return Files.readAllBytes(file.toPath());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	//사진 파일 삭제
	public boolean deleteFile(Photo photo) {
		String thumbNailFolder = "\\s\\s_";
		if (photo != null) {
			if(new File(photo.getPath() + photo.getPhysicalName()).delete()) {
				return new File(photo.getPath() + thumbNailFolder + photo.getPhysicalName()).delete();
			}
		}

		return false;
	}

	/*
	 * public static String calcPath(String uploadPath) { Calendar cal =
	 * Calendar.getInstance(); String yearPath = File.separator +
	 * cal.get(Calendar.YEAR); String monthPath = yearPath + File.separator + new
	 * DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1); String datePath =
	 * monthPath + File.separator + new
	 * DecimalFormat("00").format(cal.get(Calendar.DATE));
	 * 
	 * makeDir(uploadPath, yearPath, monthPath, datePath); makeDir(uploadPath,
	 * yearPath, monthPath, datePath + "\\s");
	 * 
	 * return datePath; }
	 */

	/*
	 * private static void makeDir(String uploadPath, String... paths) {
	 * 
	 * if (new File(paths[paths.length - 1]).exists()) { return; }
	 * 
	 * for (String path : paths) { File dirPath = new File(uploadPath + path);
	 * 
	 * if (!dirPath.exists()) { dirPath.mkdir(); } } }
	 */
}
