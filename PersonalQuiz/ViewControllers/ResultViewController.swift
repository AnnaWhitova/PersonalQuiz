//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Анна Белова on 31.05.2024.
//

import UIKit

final class ResultViewController: UIViewController {
    
    @IBOutlet var animalLabel: UILabel!
    @IBOutlet var animalDescriptionLabel: UILabel!
   
    var answerChosen: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        showResult()
    }
    
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    private func showResult() {
        var animals: [Animal] = []
        
        for object in answerChosen {
            animals.append(object.animal)
        }
        
        var catFrequency = 0
        var dogFrequency = 0
        var rabbitFrequency = 0
        var turtleFrequency = 0
        
        for animal in animals {
            switch animal {
            case .cat:
                catFrequency += 1
            case .dog:
                dogFrequency += 1
            case .rabbit:
                rabbitFrequency += 1
            case .turtle:
                turtleFrequency += 1
            }
        }
        
        var animalsFrequencies = [catFrequency, dogFrequency, rabbitFrequency, turtleFrequency]
        guard let maxValue = animalsFrequencies.max() else {return}
        
        if catFrequency == maxValue {
            animalLabel.text = "Вы - 🐱!"
            animalDescriptionLabel.text = Animal.cat.definition
        } else if dogFrequency == maxValue {
            animalLabel.text = "Вы - 🐶!"
            animalDescriptionLabel.text = Animal.dog.definition
        } else if rabbitFrequency == maxValue {
            animalLabel.text = "Вы - 🐰!"
            animalDescriptionLabel.text = Animal.rabbit.definition
        } else if turtleFrequency == maxValue {
            animalLabel.text = "Вы - 🐢!"
            animalDescriptionLabel.text = Animal.turtle.definition
        }
        
    }
    
    }
