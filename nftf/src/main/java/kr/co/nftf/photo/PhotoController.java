package kr.co.nftf.photo;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class PhotoController {
	@Autowired
	private PhotoService photoServiceImpl;
	
	@GetMapping("/photo/{no}")
	public void getPhoto(Photo photo, HttpServletResponse response) {
		PhotoUtil photoUtil = new PhotoUtil();
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

}
