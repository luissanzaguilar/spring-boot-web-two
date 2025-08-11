package lsz.training.web.two.webtwo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan("lsz.training.web.two.controller")
public class WebtwoApplication {

	public static void main(String[] args) {
		SpringApplication.run(WebtwoApplication.class, args);
	}

}
