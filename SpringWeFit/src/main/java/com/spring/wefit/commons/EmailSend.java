package com.spring.wefit.commons;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;

public class EmailSend {
	
	@Autowired
	private JavaMailSender mailSender;

	
	
	public void sendEmail(String htmlStr, String email){
		System.out.println("받은 이메일"+email);
		System.out.println("받은 내용"+htmlStr);
		
		
		MimeMessage mail = mailSender.createMimeMessage();
		
		try {
			mail.setSubject("[본인인증] WeFit 인증메일입니다", "utf-8");
			mail.setText(htmlStr, "utf-8", "html");
			mail.addRecipient(RecipientType.TO, new InternetAddress(email));
			mailSender.send(mail); 
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
}
