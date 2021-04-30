package kr.co.nftf;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackages = { "kr.co.nftf" })
@MapperScan(basePackages = "kr.co.nftf")
public class NftfApplication {

	public static void main(String[] args) {
		SpringApplication.run(NftfApplication.class, args);
	}
}
