package com.stressthem.app.services;

import com.stressthem.app.services.interfaces.EmailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class EmailServiceImpl implements EmailService {

    @Value("${mail.email}")
    private  final String  FROM_EMAIL=null;

    private JavaMailSender sender;

    @Autowired
    public EmailServiceImpl(JavaMailSender sender) {
        this.sender = sender;
    }

    @Override
    public void sendConfirmationEmail(String to, String title, String description) {
            SimpleMailMessage msg=new SimpleMailMessage();
            msg.setFrom(FROM_EMAIL);
            msg.setTo(to);
            msg.setSubject(title);
            msg.setText(description);
            sender.send(msg);
    }

    @Override
    public void sendEmail(String name, String senderEmail, String message){
        SimpleMailMessage messageEnt = new SimpleMailMessage();
         messageEnt.setFrom(FROM_EMAIL);
         messageEnt.setTo(senderEmail);
         messageEnt.setSubject("Request.wtf contact form");
         messageEnt.setText(message);
    }
}
