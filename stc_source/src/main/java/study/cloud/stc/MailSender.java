package study.cloud.stc;

import java.io.IOException;
import java.io.Reader;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.env.Environment;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ctc.wstx.shaded.msv_core.util.Util;

import study.cloud.stc.member.model.service.MemberService;
import study.cloud.stc.member.model.vo.MemberVo;

@Controller
@RequestMapping("/sendmail")
public class MailSender {

    @Autowired
    MemberService service;

    @PostMapping("/joinemail")
    @ResponseBody
	public String joinemail(ModelAndView mv,HttpServletRequest request, HttpServletResponse response, @RequestParam("memEmail") String memEmail) throws Exception{
		
		String proId = WebUtil.getProperty("mail_id");
		String proPass = WebUtil.getProperty("mail_password");
		String proEmail = WebUtil.getProperty("mail_email"); // 보내는 사람

		System.out.println("proId: " + proId);
		System.out.println("propass: " + proPass);
		System.out.println("sendTo: "+ memEmail);

		String sendTo= memEmail;
		String host = "smtp.naver.com";

		final String username = proId;
		final String password = proPass;
		int port = 465;

		// 메일 내용
		String change = "";
		for (int i = 0; i < 12; i++) {
			change += (char) ((Math.random() * 26) + 97);
		}

		System.out.println();
		System.out.println("인증코드: "+ change);
		
		System.out.println(memEmail);


		// 받는 사람
		String recipient  = sendTo;

		String subject = "StudyCloud 회원가입 인증 코드입니다.";
		String body = "StudyCloud를 방문해 주셔서 감사합니다.\n\n" +
                		"인증 코드는 " + change + "입니다.\n" +
                		"인증 코드를 이메일 인증 코드란에 기입하세요.";


		Properties props = System.getProperties();
		
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", port);
		props.put("mail.smtp.auth", true);
		props.put("mail.smtp.ssl.enable", true);
		props.put("mail.smtp.ssl.trust", host);
		
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() { 
            String un=username;
            String pw=password; 
            protected PasswordAuthentication getPasswordAuthentication() { 
                return new PasswordAuthentication(un, pw); 
            } 
        });
		session.setDebug(true);
		
		Message mimeMessage = new MimeMessage(session); 
	    mimeMessage.setFrom(new InternetAddress(proEmail)); 
	    mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient)); 
	    mimeMessage.setSubject(subject); 
	    mimeMessage.setText(body); 
	    Transport.send(mimeMessage);
	  
	    
	    System.out.println("memEmail: " + memEmail);
	    
	    return change;
		
	}
	
	@GetMapping("/password")
	public String passwordMailSend(ModelAndView mv,HttpServletRequest request, HttpServletResponse response, MemberVo vo) throws Exception{

		MemberVo renewal = new MemberVo();
		
		String proId = WebUtil.getProperty("mail_id");
		String proPass = WebUtil.getProperty("mail_password");
		String proEmail = WebUtil.getProperty("mail_email"); // 보내는 사람

		System.out.println("proId: " + proId);
		System.out.println("propass: " + proPass);
		System.out.println("sendTo: "+vo.getMemEmail());

		String sendTo= vo.getMemEmail();
		String host = "smtp.naver.com";

		final String username = proId;
		final String password = proPass;
		int port = 465;

		// 메일 내용

		String change = "";
		for (int i = 0; i < 12; i++) {
			change += (char) ((Math.random() * 26) + 97);
		}

		System.out.println();
		System.out.println("pw1: "+ change);

		renewal.setMemPasswd(change);
		renewal.setMemEmail(vo.getMemEmail());
		renewal.setMemId(vo.getMemId());

		System.out.println(renewal);

		service.mailPasswd(renewal);

		// 받는 사람
		String recipient  = sendTo;

		String subject = "임시 비밀번호 발급 메일 입니다.";
		String body = "귀하의 변경된 비밀번호는 " + change + " 입니다.";

		Properties props = System.getProperties();
		
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", port);
		props.put("mail.smtp.auth", true);
		props.put("mail.smtp.ssl.enable", true);
		props.put("mail.smtp.ssl.trust", host);
		
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() { 
            String un=username;
            String pw=password; 
            protected PasswordAuthentication getPasswordAuthentication() { 
                return new PasswordAuthentication(un, pw); 
            } 
        });
		session.setDebug(true);
		
		Message mimeMessage = new MimeMessage(session); 
	    mimeMessage.setFrom(new InternetAddress(proEmail)); 
	    mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient)); 
	    mimeMessage.setSubject(subject); 
	    mimeMessage.setText(body); 
	    Transport.send(mimeMessage);
	        
		/* mv.setViewName("/changemail"); */
	    
	    return "redirect:/login";
		
	}
	
	@GetMapping("/id")
	public String idMailSend(ModelAndView mv,HttpServletRequest request, HttpServletResponse response, MemberVo vo) throws Exception{

		MemberVo renewal = new MemberVo();
		
		String proId = WebUtil.getProperty("mail_id");
		String proPass = WebUtil.getProperty("mail_password");
		String proEmail = WebUtil.getProperty("mail_email"); // 보내는 사람

		System.out.println("proId: " + proId);
		System.out.println("propass: " + proPass);
		System.out.println("sendTo: "+vo.getMemEmail());

		String sendTo= vo.getMemEmail();
		String host = "smtp.naver.com";

		final String username = proId;
		final String password = proPass;
		int port = 465;

		// 메일 내용
		System.out.println(vo.getMemName());
		System.out.println(vo.getMemPhone());
		System.out.println(vo.getMemEmail());

		renewal = service.mailId(vo);

		System.out.println("renewal: "+ renewal);
		
		// 받는 사람
		String recipient  = sendTo;

		String subject = "귀하의 아이디 입니다.";
		String body = "귀하의 아이디는 " + renewal.getMemId() + " 입니다.";

		Properties props = System.getProperties();
		
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", port);
		props.put("mail.smtp.auth", true);
		props.put("mail.smtp.ssl.enable", true);
		props.put("mail.smtp.ssl.trust", host);
		
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() { 
            String un=username;
            String pw=password; 
            protected PasswordAuthentication getPasswordAuthentication() { 
                return new PasswordAuthentication(un, pw); 
            } 
        });
		session.setDebug(true);
		
		Message mimeMessage = new MimeMessage(session); 
	    mimeMessage.setFrom(new InternetAddress(proEmail)); 
	    mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient)); 
	    mimeMessage.setSubject(subject); 
	    mimeMessage.setText(body); 
	    Transport.send(mimeMessage);
	        
		/* mv.setViewName("/changemail"); */
	    
	    return "redirect:/login";
		
	}

}
