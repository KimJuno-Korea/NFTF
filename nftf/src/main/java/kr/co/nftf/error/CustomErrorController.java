package kr.co.nftf.error;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import kr.co.nftf.photo.Photo;
import kr.co.nftf.photo.PhotoUtil;

@RestController
public class CustomErrorController implements ErrorController{
	@RequestMapping("/error")
	public ModelAndView handleError(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		Object status = request.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);
		if (status != null) {
			int statusCode = Integer.valueOf(status.toString());
			if (statusCode == HttpStatus.NOT_FOUND.value()) {
				modelAndView.setViewName("/errors/404");
				return modelAndView;
			} else if(statusCode == HttpStatus.FORBIDDEN.value()) {
				modelAndView.setViewName("/errors/500");
				return modelAndView;
			} else {
				modelAndView.setViewName("/errors/404");
				return modelAndView;
			}
		}
		return modelAndView;
	}
	

	@Override
	public String getErrorPath() {
		return null;
	}
}
