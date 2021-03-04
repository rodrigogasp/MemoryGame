//
//  GameVC.swift
//  MemoryGame
//
//  Created by Rodrigo Gaspar on 27/02/21.
//


import UIKit

class GameVC: UIViewController {
    
    /* **************************************************************************************************
     **
     **  MARK: Variables Declaration
     **
     ****************************************************************************************************/
    
    var gameView : GameView!
    
    var count : Int = 1
    
    var timer : Timer!
    
    var colorsArray : [Int] = []
    
    var clickIndex : Int = 0
    
    var score : Int = 0
    
    var enable : Bool = true
    
    /* **************************************************************************************************
     **
     **  MARK: View
     **
     ****************************************************************************************************/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gameView = GameView(view: view, parent: self)
        
        gameView.someButton.addTarget(self, action: #selector(startGame), for: .touchUpInside)
        
        gameView.oneView.addTarget(self, action: #selector(greenClick), for: .touchUpInside)
        gameView.oneView.addTarget(self, action: #selector(greenAction), for: .touchUpInside)
        
        gameView.twoView.addTarget(self, action: #selector(redClick), for: .touchUpInside)
        gameView.twoView.addTarget(self, action: #selector(redAction), for: .touchUpInside)
        
        gameView.threeView.addTarget(self, action: #selector(blueClick), for: .touchUpInside)
        gameView.threeView.addTarget(self, action: #selector(blueAction), for: .touchUpInside)
        
        gameView.fourView.addTarget(self, action: #selector(yellowClick), for: .touchUpInside)
        gameView.fourView.addTarget(self, action: #selector(yellowAction), for: .touchUpInside)
        
        
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setInfo()
        
        
    }
    
    func setInfo() {
        
        let preferences = UserDefaults.standard
        
        if let highScore = preferences.object(forKey: "preferenceHighScore") as? Int {
            
            self.gameView.highScoreLabel.text = "Highscore : \(highScore)"
            
        }
        
        self.gameView.scoreLabel.text = "Score : \(score)"
        
        self.gameView.someButton.setTitle("Round \(self.score + 1)", for: .normal)
        
        
    }
    
    
    /* **************************************************************************************************
     **
     **  MARK: Func start Game
     **
     ****************************************************************************************************/
    
    @objc func startGame() {
        
        self.clickIndex = 0
        
        self.sortColor()
        
        var number = 1
        
        var index = 0
        
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { (timer) in
            
            self.loopColors(number: self.colorsArray[index])
            
            if number >= self.count {
                
                timer.invalidate()
                
                self.count += 1
                
                self.disableEnableButton()
              
            }
            
            number += 1
            
            index += 1
            
        })
        
        timer.fire()
    }
    
    /* **************************************************************************************************
     **
     **  MARK: Green Action
     **
     ****************************************************************************************************/
    
    @objc func greenAction() {
        
        gameView.oneView.layer.borderColor = UIColor.white.cgColor
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
            
            self.gameView.oneView.layer.borderColor = UIColor.black.cgColor
            
        }
        
    }
    
    /* **************************************************************************************************
     **
     **  MARK: Red Action
     **
     ****************************************************************************************************/
    
    @objc func redAction() {
        
        gameView.twoView.layer.borderColor = UIColor.white.cgColor
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
            
            self.gameView.twoView.layer.borderColor = UIColor.black.cgColor
            
        }
        
    }
    
    /* **************************************************************************************************
     **
     **  MARK: Blue Action
     **
     ****************************************************************************************************/
    
    @objc func blueAction() {
        
        gameView.threeView.layer.borderColor = UIColor.white.cgColor
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
            
            self.gameView.threeView.layer.borderColor = UIColor.black.cgColor
            
        }
        
    }
    
    /* **************************************************************************************************
     **
     **  MARK: Yellow Action
     **
     ****************************************************************************************************/
    
    @objc func yellowAction() {
        
        gameView.fourView.layer.borderColor = UIColor.white.cgColor
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
            
            self.gameView.fourView.layer.borderColor = UIColor.black.cgColor
            
        }
        
    }
    
    /* **************************************************************************************************
     **
     **  MARK: Func start Game
     **
     ****************************************************************************************************/
    
    func sortColor() {
        
        let random = Int.random(in: 1...4)
        
        self.colorsArray.append(random)
        
        
    }
    
    func loopColors(number : Int) {
        
        if number == 1 {
            
            self.greenAction()
            
        } else if number == 2 {
            
            self.redAction()
            
        } else if number == 3 {
            
            self.blueAction()
            
        } else if number == 4 {
            
            self.yellowAction()
            
        }
        
    }
    
    @objc func greenClick() {
        
        checkClick(number: 1)
        
    }
    
    @objc func redClick() {
        
        checkClick(number: 2)
        
    }
    
    @objc func blueClick() {
        
        checkClick(number: 3)
        
    }
    
    @objc func yellowClick() {
        
        checkClick(number: 4)
        
    }
    
    func checkClick(number : Int) {
        
        if number == self.colorsArray[clickIndex] {
            
            clickIndex += 1
            
            if clickIndex == self.colorsArray.count {
                
                self.score += 1
                
                self.setInfo()
                
                self.disableEnableButton()
                
                GenericAlert.genericAlert(self, title: "Nice! Are you for the next round?".localized, message: "", actions: [])
                
            }
            
        } else {
            
            let preferences = UserDefaults.standard
            
            if let highScore = preferences.object(forKey: "preferenceHighScore") as? Int {
                
                if self.score > highScore {
                    
                    var roundScore = self.score
                    
                    self.colorsArray = []
                    
                    self.count = 1
                    
                    self.score = 0
                    
                    self.timer = nil
                    
                    self.setInfo()
                    
                    self.disableEnableButton()
                    
                    preferences.setValue(roundScore, forKey: "preferenceHighScore")
                    
                    GenericAlert.genericAlert(self, title: "You did".localized + " \(roundScore) " + "points and this your new record! Congratulations!".localized, message: "", actions: [])
                    
                } else {
                    
                    self.colorsArray = []
                    
                    self.count = 1
                    
                    self.score = 0
                    
                    self.timer = nil
                    
                    self.setInfo()
                    
                    self.disableEnableButton()
                    
                    GenericAlert.genericAlert(self, title: "Ops, you miss. Better luck next time!".localized, message: "", actions: [])
                    
                }
            
            } else {
                
                self.colorsArray = []
                
                self.count = 1
                
                preferences.setValue(self.score, forKey: "preferenceHighScore")
                
                self.score = 0
                
                self.timer = nil
                
                self.setInfo()
                
                self.disableEnableButton()
                
                GenericAlert.genericAlert(self, title: "Ops, you miss. Better luck next time!".localized, message: "", actions: [])
                
                
            }
            
        }
        
    }
    
    func disableEnableButton() {
        
        if enable {
            
            self.gameView.someButton.isUserInteractionEnabled = false
            self.gameView.someButton.backgroundColor = .darkGray
            self.gameView.someButton.setTitle("Your up".localized, for: .normal)
            
            self.enable = false
            
            self.gameView.oneView.isUserInteractionEnabled = true
            self.gameView.twoView.isUserInteractionEnabled = true
            self.gameView.threeView.isUserInteractionEnabled = true
            self.gameView.fourView.isUserInteractionEnabled = true
            
        } else if !enable {
            
            self.gameView.someButton.isUserInteractionEnabled = true
            self.gameView.someButton.backgroundColor = .white
            self.gameView.someButton.setTitle("Round \(self.score + 1)".localized, for: .normal)
            
            self.enable = true
            
            self.gameView.oneView.isUserInteractionEnabled = false
            self.gameView.twoView.isUserInteractionEnabled = false
            self.gameView.threeView.isUserInteractionEnabled = false
            self.gameView.fourView.isUserInteractionEnabled = false
            
        }
        
    }
    
    
}




