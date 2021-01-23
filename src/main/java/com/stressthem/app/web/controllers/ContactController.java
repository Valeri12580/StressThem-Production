package com.stressthem.app.web.controllers;

import com.stressthem.app.domain.models.binding.ContactFormModel;
import com.stressthem.app.services.interfaces.EmailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@Controller
@RequestMapping("/contact")
public class ContactController {

    private EmailService emailService;

    @Autowired
    public ContactController(EmailService emailService) {
        this.emailService = emailService;
    }

    @GetMapping
    public String contactForm(){
        return "contact-us";
    }


    @PostMapping
    public String postContactForm(@RequestParam Map<String,String> formData) {
        this.emailService.sendEmail(formData.get("name"),formData.get("email"),formData.get("message"));
        return "redirect:/contact";
    }
}
