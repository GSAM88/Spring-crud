/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.demo.Controllers;

import com.example.demo.Services.TrainerInterface;
import com.example.demo.models.Trainer;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class Controllers {

    @Autowired
    TrainerInterface ti;


    @GetMapping(value = "/")
    public String showTrainerPage(ModelMap mm) {
        mm.addAttribute("alltrainers", ti.getAllTrainers());
        return "trainerpage";
    }
    
    @PostMapping(value = "/update")
    public String updateTrainer(@RequestParam(name = "id") String id,@Valid @RequestParam(name = "firstname") String firstname,
            @RequestParam(name = "lastname") String lastname,@Valid @RequestParam(name = "subject") String subject) {
        Trainer tr = new Trainer();
        tr.setTrainerId(Integer.parseInt(id));
        tr.setTrainerFirstname(firstname.toUpperCase());
        tr.setTrainerLastname(lastname.toUpperCase());
        tr.setTrainerSubject(subject.toUpperCase());
        ti.updateTrainer(tr);
        return "redirect:/";
    }

        @PostMapping(value = "/inserttrainer")
    public String insertTrainer(@Valid @RequestParam(name = "firstname") String firstname,
            @Valid @RequestParam(name = "lastname") String lastname,@Valid @RequestParam(name = "subject") String subject) {
        Trainer tr = new Trainer();
        tr.setTrainerFirstname(firstname.toUpperCase());
        tr.setTrainerLastname(lastname.toUpperCase());
        tr.setTrainerSubject(subject.toUpperCase());
        ti.updateTrainer(tr);
        return "redirect:/";
    }
    
    @GetMapping(value="/deletetrainer/{id}")
    public String deleteTrainer(@PathVariable String id){
        ti.deleteTrainerById(Integer.parseInt(id));      
    return "redirect:/";}

}
