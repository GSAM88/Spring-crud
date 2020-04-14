/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.demo.Services;

import com.example.demo.models.Trainer;
import java.util.List;

/**
 *
 * @author gsami
 */
public interface TrainerInterface {
    
    public List<Trainer> getAllTrainers();
    
//    public Trainer getTrainerById(Integer id);
    
    public void updateTrainer(Trainer trainer);
    
    public void deleteTrainerById(Integer id);
}
