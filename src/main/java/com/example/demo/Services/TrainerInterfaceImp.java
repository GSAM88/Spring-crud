/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.demo.Services;

import com.example.demo.Repositories.TrainerRepository;
import com.example.demo.models.Trainer;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author gsami
 */
@Service
@Transactional
public class TrainerInterfaceImp implements TrainerInterface {

    @Autowired
    TrainerRepository TrainerRepo;
    
    @Override
    public List<Trainer> getAllTrainers() {
        return (List)TrainerRepo.findAll();
    }

//    @Override
//    public Trainer getTrainerById(Integer id) {
//        
//        return TrainerRepo.findById(id).get();
//    }

    @Override

    public void updateTrainer(Trainer trainer) {
        TrainerRepo.save(trainer);
    }

    @Override
    public void deleteTrainerById(Integer id) {
        TrainerRepo.deleteById(id);
    }


    
    
    
}
