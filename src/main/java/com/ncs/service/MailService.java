package com.ncs.service;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

@Service
public class MailService {
	
	@Autowired       
	 private JavaMailSender mailSender;
 
    @Async
	public void authSendMail(String to, String subject, String body) {
      MimeMessage message = mailSender.createMimeMessage();  
      try {
    	  MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");  
    	  messageHelper.setFrom("last2599@gmail.com", "Okky");  
    	  messageHelper.setSubject(subject);
    	  messageHelper.setTo(to); 
    	  messageHelper.setText(body );
    	  mailSender.send(message);  
      	}catch(Exception e){
		e.printStackTrace();
      	}
	}

}

