package com.stressthem.app.web.controllers;

import com.stressthem.app.domain.entities.Role;
import com.stressthem.app.domain.models.binding.*;
import com.stressthem.app.domain.models.service.*;
import com.stressthem.app.exceptions.ChangeRoleException;
import com.stressthem.app.exceptions.UserDeletionException;
import com.stressthem.app.services.interfaces.*;
import com.stressthem.app.web.annotations.PageTitle;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.persistence.EntityExistsException;
import javax.validation.Valid;
import java.security.Principal;
import java.util.List;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/admin")
@PreAuthorize("hasAnyAuthority('ROOT','ADMIN')")
public class AdminPanelController {
    private final UserService userService;
    private final RoleService roleService;
    private final AnnouncementService announcementService;
    private final ModelMapper modelMapper;
    private final ArticleService articleService;
    private final CryptocurrencyService cryptocurrencyService;
    private final PlanService planService;
    private final PaymentService paymentService;
    private final MethodService methodService;

    @Autowired
    public AdminPanelController(UserService userService, RoleService roleService, AnnouncementService announcementService, ModelMapper modelMapper, ArticleService articleService, CryptocurrencyService cryptocurrencyService, PlanService planService, PaymentService paymentService, MethodService methodService) {
        this.userService = userService;
        this.roleService = roleService;
        this.announcementService = announcementService;
        this.modelMapper = modelMapper;
        this.articleService = articleService;
        this.cryptocurrencyService = cryptocurrencyService;
        this.planService = planService;
        this.paymentService = paymentService;
        this.methodService = methodService;
    }

    @PageTitle("Change roles")
    @GetMapping("/user-roles")
    public String changeRole(Model model) {
        model.addAttribute("users", this.userService.getAllUsers().stream().map(UserServiceModel::getUsername).collect(Collectors.toList()));
        model.addAttribute("roles", this.roleService.getAllRoles().stream().map(Role::getName).filter(e -> !e.equals("USER")).collect(Collectors.toList()));
        return "admin-panel-user-roles";
    }

    @PostMapping("/user-roles")
    public String postChangeRole(@RequestParam String username, @RequestParam String role, @RequestParam String type
            , Principal principal, RedirectAttributes redirectAttributes) {
        try {
            this.userService.changeUserRole(username, role, type, principal.getName());
        } catch (ChangeRoleException ex) {
            redirectAttributes.addFlashAttribute("error", ex.getMessage());
        }

        return "redirect:/admin/user-roles";
    }

    @PageTitle("Delete user")
    @GetMapping("/disable-user")
    public String deleteUser(Model model) {
        model.addAttribute("users", this.userService.getAllUsers().stream().map(UserServiceModel::getUsername).collect(Collectors.toList()));

        return "admin-panel-disable-user";
    }

    @PostMapping("/disable-user")
    public String postDisableUser(@RequestParam String username,RedirectAttributes redirectAttributes) {
        try {
            this.userService.disableUser(username);
        } catch (UserDeletionException ex) {
            redirectAttributes.addFlashAttribute("error", ex.getMessage());
        }
        return "redirect:/admin/disable-user";
    }

    @PageTitle("Add announcement")
    @GetMapping("/add-announcement")
    public String addAnnouncement(Model model) {
        if (!model.containsAttribute("announcement")) {
            model.addAttribute("announcement", new AnnouncementBindingModel());
        }


        return "admin-panel-announcement-add";
    }

    @PostMapping("/add-announcement")
    public String postAddAnnouncement(@Valid @ModelAttribute("announcement") AnnouncementBindingModel announcementBindingModel,
                                      BindingResult bindingResult, RedirectAttributes redirectAttributes, Principal principal) {
        if (bindingResult.hasErrors()) {
            redirectAttributes.addFlashAttribute("announcement", announcementBindingModel);
            redirectAttributes.addFlashAttribute("org.springframework.validation.BindingResult.announcement", bindingResult);

        } else {
            this.announcementService.registerAnnouncement(this.modelMapper.map(announcementBindingModel, AnnouncementServiceModel.class)
                    , principal.getName());

        }


        return "redirect:/admin/add-announcement";
    }

    @PageTitle("Add article")
    @GetMapping("/add-article")
    public String addArticle(Model model) {
        if (!model.containsAttribute("article")) {
            model.addAttribute("article", new ArticleBindingModel());
        }

        return "admin-panel-article-add";

    }


    @PostMapping("/add-article")
    public String postAddArticle(@Valid @ModelAttribute ArticleBindingModel articleBindingModel, BindingResult bindingResult
            , RedirectAttributes redirectAttributes, Principal principal) {

        if (bindingResult.hasErrors()) {
            redirectAttributes.addFlashAttribute("article", articleBindingModel);
            redirectAttributes.addFlashAttribute("org.springframework.validation.BindingResult.article", bindingResult);
        } else {
            articleService.registerArticle(this.modelMapper.map(articleBindingModel, ArticleServiceModel.class), principal.getName());
        }

        return "redirect:/admin/add-article";
    }

    @PageTitle("Add cryptocurrency")
    @GetMapping("/add-cryptocurrency")
    public String addCryptocurrency(Model model) {
        if (!model.containsAttribute("cryptocurrency")) {
            model.addAttribute("cryptocurrency", new CryptocurrencyBindingModel());
        }

        return "admin-panel-add-cryptocurrency";
    }

    @PostMapping("/add-cryptocurrency")
    public String postAddCryptocurrency(@Valid @ModelAttribute CryptocurrencyBindingModel cryptocurrencyBindingModel, BindingResult bindingResult,
                                        RedirectAttributes redirectAttributes, Principal principal) {
        if (bindingResult.hasErrors()) {
            redirectAttributes.addFlashAttribute("cryptocurrency", cryptocurrencyBindingModel);
            redirectAttributes.addFlashAttribute("org.springframework.validation.BindingResult.cryptocurrency", bindingResult);
        } else {
            this.cryptocurrencyService.registerCryptocurrency(this.modelMapper.map(cryptocurrencyBindingModel, CryptocurrencyServiceModel.class)
                    , principal.getName());
        }

        return "redirect:/admin/add-cryptocurrency";
    }

    @PageTitle("Add plan")
    @GetMapping("/add-plan")
    public String addPlan(Model model) {
        model.addAttribute("methods", methodService.findAllMethods().stream().map(MethodServiceModel::getName).collect(Collectors.toList()));
        if (!model.containsAttribute("plan")) {
            model.addAttribute("plan", new PlanBindingModel());
        }


        return "admin-panel-add-plan";
    }


    @PostMapping("/add-plan")
    public String postAddPlan(@Valid @ModelAttribute PlanBindingModel planBindingModel, BindingResult result, RedirectAttributes redirectAttributes,
                              Principal principal) {

        if (result.hasErrors()) {
            redirectAttributes.addFlashAttribute("plan", planBindingModel);
            redirectAttributes.addFlashAttribute("org.springframework.validation.BindingResult.plan", result);
        } else {
            this.planService.register(this.modelMapper.map(planBindingModel,
                    PlanServiceModel.class),planBindingModel.getMethods(), principal.getName());
        }

        return "redirect:/admin/add-plan";
    }



    @PageTitle(value = "Add payment code")
    @GetMapping("/add-payment-code")
    public String addPaymentCode(Model model) {
        List<String> plans = this.planService.getAllPlans().stream().map(PlanServiceModel::getType).collect(Collectors.toList());

        model.addAttribute("plans", plans);
        if (!model.containsAttribute("paymentCode")) {
            model.addAttribute("paymentCode", new PaymentCodeBindingModel());
        }


        return "admin-panel-add-payment-code";
    }


    @PostMapping("/add-payment-code")
    public String postAddPaymentCode(@Valid @ModelAttribute PaymentCodeBindingModel paymentCodeBindingModel, BindingResult bindingResult, RedirectAttributes redirectAttributes, Principal principal) {

        if (bindingResult.hasErrors()) {
            redirectAttributes.addFlashAttribute("paymentCode", paymentCodeBindingModel);
            redirectAttributes.addFlashAttribute("org.springframework.validation.BindingResult.paymentCode", bindingResult);

        }else{
            try {
                this.paymentService.saveCode(paymentCodeBindingModel.getCode(), paymentCodeBindingModel.getPlanName(), principal.getName());
            } catch (EntityExistsException ex) {
                redirectAttributes.addFlashAttribute("existError", ex.getMessage());
            }
        }




        return "redirect:/admin/add-payment-code";


    }

    @PageTitle("Add method")
    @GetMapping("/add-method")
    public String addMethod(Model model) {
        List<String> plans = this.planService.getAllPlans().stream().map(PlanServiceModel::getType).collect(Collectors.toList());
        model.addAttribute("plans", plans);
        if (!model.containsAttribute("method")) {
            model.addAttribute("method", new MethodBindingModel());
        }

        return "admin-panel-add-method";
    }

    @PostMapping("/add-method")
    public String addMethodPost(@Valid @ModelAttribute MethodBindingModel method, BindingResult result, RedirectAttributes redirectAttributes) {
        if (result.hasErrors()) {
            redirectAttributes.addFlashAttribute("method", method);
            redirectAttributes.addFlashAttribute("org.springframework.validation.BindingResult.method", result);

        } else {
            try {
                this.methodService.saveMethod(this.modelMapper.map(method, MethodServiceModel.class), method.getPlans());
            } catch (EntityExistsException ex) {
                redirectAttributes.addFlashAttribute("existError", ex.getMessage());
            }
        }

        return "redirect:/admin/add-method";
    }

    @PageTitle("Remove method")
    @GetMapping("/remove-method")
    public String removeMethod(Model model){
        List<String> plans = this.planService.getAllPlans().stream().map(e -> e.getType()).collect(Collectors.toList());
        model.addAttribute("plans",plans);
        model.addAttribute("model",new MethodRemoveBindingModel());
        return "admin-panel-remove-method";
    }


}
