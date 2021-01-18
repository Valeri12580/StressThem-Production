package com.stressthem.app.web.controllers;

import com.stressthem.app.domain.models.view.PlanViewModel;
import com.stressthem.app.exceptions.PaymentCodeNotFound;
import com.stressthem.app.exceptions.UserPlanActivationException;
import com.stressthem.app.services.interfaces.CryptocurrencyService;
import com.stressthem.app.services.interfaces.PaymentService;
import com.stressthem.app.services.interfaces.PlanService;
import com.stressthem.app.services.interfaces.UserService;
import com.stressthem.app.web.annotations.PageTitle;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.websocket.server.PathParam;
import java.security.Principal;
import java.util.List;

@Controller
@RequestMapping("/plans")
public class  PlanController {
    private ModelMapper modelMapper;
    private PlanService planService;
    private UserService userService;
    private CryptocurrencyService cryptocurrencyService;
    private PaymentService paymentService;

    @Autowired
    public PlanController(ModelMapper modelMapper, PlanService planService, UserService userService, CryptocurrencyService cryptocurrencyService, PaymentService paymentService) {
        this.modelMapper = modelMapper;
        this.planService = planService;
        this.userService = userService;
        this.cryptocurrencyService = cryptocurrencyService;
        this.paymentService = paymentService;
    }




    @PageTitle("All plans")
    @GetMapping
    public String plans(Model model) {
        List<PlanViewModel> plans = List.of(this.modelMapper.map(this.planService.getAllPlans(), PlanViewModel[].class));
        model.addAttribute("plans", plans);


        return "pricing";
    }

    @PageTitle("Confirm order")
    @GetMapping("/confirm/{id}")
    @PreAuthorize("isAuthenticated()")
    public String confirm(@PathVariable("id") String id, Model model) {
        model.addAttribute("plan", this.modelMapper.map(this.planService.getPlanById(id),PlanViewModel.class));
        model.addAttribute("id", id);
        return "confirm-order";

    }

    @PostMapping("/confirm/{id}")
    public String postConfirm(@PathVariable("id") String id, @PathParam("paymentCode") String paymentCode, Principal principal
            , RedirectAttributes redirectAttributes) {
        try {
            this.paymentService.purchasePlan(id, principal.getName(), paymentCode);
        } catch (UserPlanActivationException  | PaymentCodeNotFound ex) {
            redirectAttributes.addFlashAttribute("activationError", ex.getMessage());

            return String.format("redirect:/plans/confirm/%s", id);
        }

        return "redirect:/home/launch";
    }

    @GetMapping("/delete/{id}")
    public String deletePlan(@PathVariable("id") String id) {
        this.planService.deletePlanById(id);
        return "redirect:/plans";
    }


}

//todo optinal v service and error handler here!