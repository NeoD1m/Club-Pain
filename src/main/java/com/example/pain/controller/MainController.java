package com.example.pain.controller;

import com.example.pain.domain.Message;
import com.example.pain.domain.Role;
import com.example.pain.domain.Status;
import com.example.pain.domain.User;
import com.example.pain.repos.MessageRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
        import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.websocket.server.PathParam;
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
            @RequestParam(required = false, defaultValue = "") String filter,
            Map<String,Object > model){
        Iterable<Message> messages = messageRepo.findAll();

        /*if(filter != null && !filter.isEmpty()){
            messages = messageRepo.findByTag(filter);
        }else{
            messages = messageRepo.findAll();
        }*/

        model.put("messages",messages);
        model.put("filter",filter);
        return "main";
    }

    @GetMapping("/error")
    public String error(){
        return "main";
    }

    @GetMapping("/trainers")
    public String trainers(){
        return "trainers";
    }

    @PostMapping("/main")
    public String add(
            @AuthenticationPrincipal User user,
            @RequestParam String address,
            @RequestParam String time,
            @RequestParam String comment,
            @RequestParam(required = false) Status status,
            Map<String,Object> model){
        if (status == null) status = Status.NOT_REVIEWED;
        Message message = new Message(user,address,time, comment,status);
        messageRepo.save(message);

        Iterable<Message> messages = messageRepo.findAll();
        model.put("messages",messages);
        return "main";
    }

    @PostMapping("/accept")
    public String review(
            @RequestParam Message message,
            Map<String,Object> model){
        System.out.println("AAAAAAAAAAAAAAAAAA");

        messageRepo.delete(message);
        message.setStatus(Status.ACCEPTED);
        messageRepo.save(message);
        Iterable<Message> messages = messageRepo.findAll();
        model.put("messages",messages);
        return "/";
    }

}