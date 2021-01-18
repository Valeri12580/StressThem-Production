package com.stressthem.app.web.controllers;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.stressthem.app.services.interfaces.PlanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.*;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/methods")
public class MethodController {
    private PlanService planService;

    @Autowired
    public MethodController(PlanService planService) {
        this.planService = planService;
    }

    @ResponseBody
    @PostMapping
    public ResponseEntity<List<String>>getMethods(@RequestBody String plan, ObjectMapper objectMapper) throws JsonProcessingException {
        String planValue=objectMapper.readValue(plan, ObjectNode.class).get("plan").asText();

        List<String> methods = this.planService.findPlanByType(planValue).getMethods().stream().map(e -> e.getName()).collect(Collectors.toList());
        return ResponseEntity.ok(methods);
    }
}
