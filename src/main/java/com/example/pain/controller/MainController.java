package com.example.pain.controller;

import com.example.pain.domain.Message;
import com.example.pain.domain.Role;
import com.example.pain.domain.User;
import com.example.pain.repos.MessageRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
        import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@Controller
public class MainController {
    @Autowired
    private MessageRepo messageRepo;

    @GetMapping("/")
    public String greeting(Map<String,Object> model) {
        return "greeting";
    }



    @GetMapping("/main")
    public String main(
            @AuthenticationPrincipal User user,
            @RequestParam(required = false, defaultValue = "") String kek,
            @RequestParam(required = false, defaultValue = "") String filter,
            Map<String,Object > model){
        Iterable<Message> messages = messageRepo.findAll();

        if(filter != null && !filter.isEmpty()){
            messages = messageRepo.findByTag(filter);
        }else{
            messages = messageRepo.findAll();
        }

        if (user.getRoles().contains(Role.ADMIN))
        kek = "вы админ)";
        model.put("messages",messages);
        model.put("filter",filter);
        model.put("kek",kek);
        return "main";
    }

    @PostMapping("/main")
    public String add(
            @AuthenticationPrincipal User user,
            @RequestParam String text,@RequestParam String tag, Map<String,Object> model){ ///////
        Message message = new Message(text,tag, user);
        messageRepo.save(message);

        Iterable<Message> messages = messageRepo.findAll();
        model.put("messages",messages);
        return "main";
    }

}