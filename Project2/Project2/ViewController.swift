//
//  ViewController.swift
//  Project2
//
//  Created by Selen Yanar on 13.06.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var questionsAsked = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        askQuestion()
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
    }
    
    func askQuestion(action: UIAlertAction! = nil) {
        
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = "\(countries[correctAnswer].uppercased())  |   SCORE: \(score)"
        
        questionsAsked += 1
        
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
        } else {
            title = "Wrong"
            score -= 1
        }
        
        
        let ac = UIAlertController(title: title,
                                   message: "Your score is \(score)",
                                   preferredStyle: .alert)
        
        ac.addAction(UIAlertAction(title: "Continue",
                                   style: .default,
                                   handler: askQuestion))
        
        let secondAC = UIAlertController(title: "Congratulations!",
                                         message: "You have answered 10 questions.",
                                         preferredStyle: .alert)
        secondAC.addAction(UIAlertAction(title: "Continue",
                                         style: .default,
                                         handler: askQuestion))
        
        if questionsAsked % 10 == 0 {
            
            present(secondAC, animated: true)
            
        }
        present(ac, animated: true)
        
        
    }
}

