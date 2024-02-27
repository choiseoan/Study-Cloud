package study.cloud.stc.member.model.service;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

@Component
public class MailSendService {
	
//	@Autowired 
//	private JavaMailSender javaMailSender;
	
	private int authNumber;
	
		//난수 생성
		public void RandomNumber() {
			Random r = new Random();
			int digit = r.nextInt(888888) + 111111;
			System.out.println("인증번호: "+ digit);
			authNumber = digit;
		}
		
		//이메일 발송 양식
		public String joinEmail(String memEmail) {
			RandomNumber();
			String setFrom = "studycloud.sc@gmail.com";
			String toMail = memEmail;
			String title = "StudyCloud 회원가입 인증 번호입니다.";
			String content = "StudyCloud를 방문해 주셔서 감사합니다.<br><br>" +
					"인증 번호는" + authNumber + "입니다.<br>" + 
					"인증 번호를 이메일 인증 번호란에 기입하세요.";
			mailSend(setFrom, toMail, title, content);
			return Integer.toString(authNumber);
		}

		
		//이메일 발송 메소드
		private void mailSend(String setFrom, String toMail, String title, String content) {
			JavaMailSender javaMailSender = new JavaMailSenderImpl();
			MimeMessage message = javaMailSender.createMimeMessage(); 	
			try {
				MimeMessageHelper helper = new MimeMessageHelper(message,true,"utf-8");
				helper.setFrom(setFrom);
				helper.setTo(toMail);
				helper.setSubject(title);
				helper.setText(content,true);
				javaMailSender.send(message);
			} catch (MessagingException e) {
				e.printStackTrace();
			}			
		}
}
