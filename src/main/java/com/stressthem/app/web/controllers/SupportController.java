package com.stressthem.app.web.controllers;

import com.stressthem.app.domain.entities.Ticket;
import com.stressthem.app.domain.models.binding.TicketBindingModel;
import com.stressthem.app.domain.models.service.TicketServiceModel;
import com.stressthem.app.domain.models.view.SupportPanelViewModel;
import com.stressthem.app.domain.models.view.TicketViewModel;
import com.stressthem.app.services.interfaces.SupportService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;

@Controller
@RequestMapping(value = "/support")
public class SupportController {



    private SupportService supportService;
    private ModelMapper modelMapper;

    @Autowired
    public SupportController(SupportService supportService, ModelMapper modelMapper) {
        this.supportService = supportService;
        this.modelMapper = modelMapper;
    }

    @GetMapping("/contact")
    public String contactForm(Model model) {
        if (!model.containsAttribute("ticket")) {
            model.addAttribute("ticket", new TicketBindingModel());
        }
        return "contact-us";
    }


    @PostMapping("/contact")
    public String postContactForm(@ModelAttribute @Valid TicketBindingModel ticketBindingModel, BindingResult bindingResult,
                                  RedirectAttributes redirectAttributes) {
        if (bindingResult.hasErrors()) {
            redirectAttributes.addFlashAttribute("ticket", ticketBindingModel);
            redirectAttributes.addFlashAttribute("org.springframework.validation.BindingResult.ticket", bindingResult);
        } else {

                this.supportService.saveTicket(this.modelMapper.map(ticketBindingModel, TicketServiceModel.class));

        }
        return "redirect:/support/contact";
    }


    @GetMapping("/tickets")
    public String tickets(@RequestParam("pageN") int pageNumber, @RequestParam(value = "filter", required = false) String filterBy,
                          Model model) {

        pageNumber--;
        Page<Ticket> allTickets = this.supportService.findAllTickets(pageNumber, filterBy);
        model.addAttribute("totalPages",allTickets.getTotalPages());
        model.addAttribute("tickets",this.modelMapper.map(allTickets.getContent(), TicketViewModel[].class));

        return "tickets-support";
    }
}
