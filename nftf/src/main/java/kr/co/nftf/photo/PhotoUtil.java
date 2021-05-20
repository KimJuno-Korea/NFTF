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
	
	//썸네일 가져오기
	public byte[] getThumbnail(Photo photo) {
		String thumbNailFolder = "\\s\\";
		try {
			if (photo != null) {
				File file =  new File(photo.getPath() + thumbNailFolder + photo.getThumbnail());
				
				return Files.readAllBytes(file.toPath());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	//사진 파일 삭제
	public boolean deleteFile(Photo photo) {
		String thumbNailFolder = "\\s\\";
		if (photo != null) {
			if(new File(photo.getPath() + photo.getPhysicalName()).delete()) {
				return new File(photo.getPath() + thumbNailFolder + photo.getThumbnail()).delete();
			}
		}

		return false;
	}
}
