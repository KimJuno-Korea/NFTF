package kr.co.nftf;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import kr.co.nftf.Interceptor.AuthCheckInterceptor;

@SpringBootApplication
@ComponentScan(basePackages = { "kr.co.nftf" })
@MapperScan(basePackages = "kr.co.nftf")
public class NftfApplication implements WebMvcConfigurer {

	public static void main(String[] args) {
		SpringApplication.run(NftfApplication.class, args);
	}
	
	//로그인, 로그아웃, 게시글 검색, 게시글 목록 조회, 조회, 지점 조회 할때 인터셉터 필요없음
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		//board
		//registry.addInterceptor(new AuthCheckInterceptor()).addPathPatterns("/board/**/form");
		//registry.addInterceptor(new AuthCheckInterceptor()).addPathPatterns("/board/form");
		//registry.addInterceptor(new AuthCheckInterceptor()).addPathPatterns("/board/*");
		
		/*
		 * registry.addInterceptor(new
		 * AuthCheckInterceptor()).addPathPatterns("/branch/**");
		 * 
		 * //payment registry.addInterceptor(new
		 * AuthCheckInterceptor()).addPathPatterns("/payment");
		 * registry.addInterceptor(new
		 * AuthCheckInterceptor()).addPathPatterns("/payment/**");
		 */
	}
}
