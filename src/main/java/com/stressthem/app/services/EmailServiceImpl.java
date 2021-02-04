package com.stressthem.app.services;

import com.stressthem.app.services.interfaces.EmailService;
import org.springframework.stereotype.Service;

@Service
public class EmailServiceImpl implements EmailService {
    @Override
    public void sendConfirmationEmail(String to, String title, String description) {

    }

    @Override
    public void sendEmail(String name, String email, String message) {

    }

//    @Value("${spring.mail.username}")
//    private  final String STRESSER_EMAIL =null;
//
//    private JavaMailSender sender;
//
//    @Autowired
//    public EmailServiceImpl(JavaMailSender sender) {
//        this.sender = sender;
//    }
//
//    @Override
//    public void sendConfirmationEmail(String to, String title, String description) {
//            SimpleMailMessage msg=new SimpleMailMessage();
//            msg.setFrom(STRESSER_EMAIL);
//            msg.setTo(to);
//            msg.setSubject(title);
//            msg.setText(description);
//            sender.send(msg);
//    }
//
//    @Override
//    public void sendEmail(String senderName, String senderEmail, String message){
//      SimpleMailMessage simpleMailMessage=new SimpleMailMessage();
//      simpleMailMessage.setFrom(STRESSER_EMAIL);
//      simpleMailMessage.setTo(senderEmail);
//      simpleMailMessage.setSubject("Request WTF Support");
//      simpleMailMessage.setText(message);
//      sender.send(simpleMailMessage);
//
//    }
}
