package com.ict.common;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;

import com.ict.edu05.service.BbsService;
import com.ict.edu05.vo.BbsVO;

@Configuration
@EnableScheduling
public class SchedulerConfig {
	
	@Autowired
	private BbsService bbsService;
	
	@Scheduled(cron = "0 0 0 * * *")
	public void shedulerTest() {
		System.out.println("start every 10sec");
		List<BbsVO> list = bbsService.getBbsList()	;
		System.out.println("BBS list size: " + list.size());
	}
}
