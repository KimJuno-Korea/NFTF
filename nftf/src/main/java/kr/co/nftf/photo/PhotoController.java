package kr.co.nftf.photo;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class PhotoController {
	@Autowired
	private PhotoService photoServiceImpl;
	
	@GetMapping("/photo/{no}")
	public void getPhoto(Photo photo, HttpServletResponse response) {
		PhotoUtil photoUtil = new PhotoUtil();
		System.out.println("boardNo :" + photo.getBoardNo());
		System.out.println("no :" + photo.getNo());
		try { 
			photo = photoServiceImpl.photoSelect(photo);
			byte[] file = photoUtil.getFile(photo);
			if (file != null) {
				response.setContentType("image/png");
				response.getOutputStream().write(file);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	@GetMapping("/photo/thumbnail/{no}")
	public void getThumbnail(@PathVariable String no, HttpServletResponse response) {
		System.out.println("/photo/thumbnail/{no} 접근 : " + no);
		PhotoUtil photoUtil = new PhotoUtil();
		Photo photo = new Photo();
		try { 
			photo.setBoardNo(Integer.valueOf(no));
			photo = photoServiceImpl.photoThumbnail(photo);
			photo = photoServiceImpl.photoSelect(photo);
			
			byte[] file = photoUtil.getThumbnail(photo);
			if (file != null) {
				response.setContentType("image/png");
				response.getOutputStream().write(file);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

}
