//
//  GameVC.swift
//  MemoryGame
//
//  Created by Rodrigo Gaspar on 27/02/21.
//


import UIKit
import FirebaseDatabase

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
    
    let ref = Database.database().reference(withPath: "scoreBoard")
    
    let nickRef = Database.database().reference(withPath: "users")
    
    var inserNamePopUp : InserNamePopUp!
    
    var visualEffectView: UIVisualEffectView!
    
    var viewAdded : UIView!
    
    var nicknames : [String] = []
    
    /* **************************************************************************************************
     **
     **  MARK: View
     **
     ****************************************************************************************************/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //------------------ View ------------------
        
        gameView = GameView(view: view, parent: self)
        
        //------------------ Buttons Targets ------------------
        
        gameView.roundButton.addTarget(self, action: #selector(startGame), for: .touchUpInside)
        
        gameView.oneView.addTarget(self, action: #selector(greenClick), for: .touchUpInside)
        gameView.oneView.addTarget(self, action: #selector(greenAction), for: .touchUpInside)
        
        gameView.twoView.addTarget(self, action: #selector(redClick), for: .touchUpInside)
        gameView.twoView.addTarget(self, action: #selector(redAction), for: .touchUpInside)
        
        gameView.threeView.addTarget(self, action: #selector(blueClick), for: .touchUpInside)
        gameView.threeView.addTarget(self, action: #selector(blueAction), for: .touchUpInside)
        
        gameView.fourView.addTarget(self, action: #selector(yellowClick), for: .touchUpInside)
        gameView.fourView.addTarget(self, action: #selector(yellowAction), for: .touchUpInside)
        
        //------------------Insert Name pop up------------------
        inserNamePopUp = InserNamePopUp(frame: CGRect(x: view.frame.width*0.05, y: 0, width: view.frame.width*0.9, height: 180))
        
        inserNamePopUp.center.y = view.center.y
        
        inserNamePopUp.saveButton.addTarget(self, action: #selector(nicknameAction), for: .touchUpInside)
        
        //------------------------- Visual Effect -------------------------------

        visualEffectView = UIVisualEffectView()
        visualEffectView.backgroundColor = .black
        visualEffectView.alpha = 0.75
        visualEffectView.frame = view.bounds
        visualEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        visualEffectView.isUserInteractionEnabled = true

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        nickRef.observe(.value) { (snapshot) in
            
            var strings = [String]()
            
            for child in snapshot.children {
                
                if let snap = child as? DataSnapshot {
                    
                    strings.append(snap.key)
                    
                }
                
            }
            
            self.nicknames = strings
            
            
        }
        
        let preferences = UserDefaults.standard
        
        if (preferences.object(forKey: "preferenceNickname") as? String) != nil {
            
            setInfo()
            
        } else {
            
            openInsertNamePopUp()

            
        }
        
        
    }
    
    /* **************************************************************************************************
     **
     **  MARK: Set Info
     **
     ****************************************************************************************************/
    
    func setInfo() {
        
        let preferences = UserDefaults.standard
        
        if let highScore = preferences.object(forKey: "preferenceHighScore") as? Int {
            
            self.gameView.highScoreLabel.text = "Highscore : \(highScore)"
            
        }
        
        self.gameView.scoreLabel.text = "Score : \(score)"
        
        self.gameView.roundButton.setTitle("Round \(self.score + 1)", for: .normal)
        
        
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
     **  MARK: Func sort Color
     **
     ****************************************************************************************************/
    
    func sortColor() {
        
        let random = Int.random(in: 1...4)
        
        self.colorsArray.append(random)
        
        
    }
    
    /* **************************************************************************************************
     **
     **  MARK: Set Loop colors
     **
     ****************************************************************************************************/
    
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
    
    /* **************************************************************************************************
     **
     **  MARK: Colors CLicks
     **
     ****************************************************************************************************/
    
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
    
    /* **************************************************************************************************
     **
     **  MARK: Check click
     **
     ****************************************************************************************************/
    
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
                    
                    let roundScore = self.score
                    
                    self.colorsArray = []
                    
                    self.count = 1
                    
                    self.score = 0
                    
                    self.timer = nil
                    
                    self.disableEnableButton()
                    
                    preferences.setValue(roundScore, forKey: "preferenceHighScore")
                    
                    self.sendToFireBase()
                    
                    self.setInfo()
                    
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
                
                self.sendToFireBase()
                
                self.score = 0
                
                self.timer = nil
                
                self.setInfo()
                
                self.disableEnableButton()
                
                GenericAlert.genericAlert(self, title: "Ops, you miss. Better luck next time!".localized, message: "", actions: [])
                
                
            }
            
        }
        
    }
    
    /* **************************************************************************************************
     **
     **  MARK: Disable Enable button
     **
     ****************************************************************************************************/
    
    func disableEnableButton() {
        
        if enable {
            
            self.gameView.roundButton.isUserInteractionEnabled = false
            self.gameView.roundButton.backgroundColor = .darkGray
            self.gameView.roundButton.setTitle("Your up".localized, for: .normal)
            
            self.enable = false
            
            self.gameView.oneView.isUserInteractionEnabled = true
            self.gameView.twoView.isUserInteractionEnabled = true
            self.gameView.threeView.isUserInteractionEnabled = true
            self.gameView.fourView.isUserInteractionEnabled = true
            
        } else if !enable {
            
            self.gameView.roundButton.isUserInteractionEnabled = true
            self.gameView.roundButton.backgroundColor = .white
            self.gameView.roundButton.setTitle("Round \(self.score + 1)".localized, for: .normal)
            
            self.enable = true
            
            self.gameView.oneView.isUserInteractionEnabled = false
            self.gameView.twoView.isUserInteractionEnabled = false
            self.gameView.threeView.isUserInteractionEnabled = false
            self.gameView.fourView.isUserInteractionEnabled = false
            
        }
        
    }
    
    /* **************************************************************************************************
     **
     **  MARK: Send to firebase
     **
     ****************************************************************************************************/
    
    func sendToFireBase() {
        
        let preferences = UserDefaults.standard
        
        if let scoreSend = preferences.object(forKey: "preferenceHighScore") as? Int {
            
            let nickname = preferences.string(forKey: "preferenceNickname")
            
            let thisScore = Score(addedByUser: nickname!, score: scoreSend)
            
            let scoreRef = self.ref.child(nickname!.lowercased())

            scoreRef.setValue(thisScore.toAnyObject())
            
        }
        
    }
    
    /* *********************************************************************************
    **
    **  MARK: Open Inser Name Pop Up
    **
    ***********************************************************************************/

    @objc func openInsertNamePopUp() {
        
        if viewAdded == nil {
            
            self.animatingOpenView(addView: inserNamePopUp)
            
        }
        
    }
    
    /* *********************************************************************************
     **
     **  MARK: Animating Open View
     **
     ***********************************************************************************/

    @objc func animatingOpenView(addView : UIView) {

        view.addSubview(visualEffectView)
        
        self.view.addSubview(addView)

        self.viewAdded = addView

        addView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        addView.alpha = 0

        UIView.animate(withDuration: 0.4) {
            addView.alpha = 1
            addView.transform = CGAffineTransform.identity
        }

    }
    
    /* *********************************************************************************
     **
     **  MARK: Animating Close View
     **
     ***********************************************************************************/

    func animatingCloseView(removeView : UIView) {

        let effect = self.visualEffectView.effect

        UIView.animate(withDuration: 0.3, animations: {
            removeView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
            removeView.alpha = 0

            self.visualEffectView.effect = nil
            self.visualEffectView.removeFromSuperview()
            self.visualEffectView.effect = effect

        }) { (success:Bool) in

            removeView.removeFromSuperview()

            self.viewAdded = nil


        }

    }
    
    /* *************************************************************************************
    **
    **  MARK: Close View
    **
    ***************************************************************************************/
    @objc func closeView() {
        if viewAdded != nil {

            self.animatingCloseView(removeView: viewAdded)

        }
    }
    
    /* *************************************************************************************
    **
    **  MARK: NicknameAction
    **
    ***************************************************************************************/
    
    @objc func nicknameAction() {
        
        if self.inserNamePopUp.nameTextField.text == nil || self.inserNamePopUp.nameTextField.text!.isEmpty {
            
            GenericAlert.genericAlert(self, title: "You need to insert a nickname".localized, message: "", actions: [])
            
            return
            
        }
        
        if self.inserNamePopUp.nameTextField.text!.count < 3 {
            
            GenericAlert.genericAlert(self, title: "Your nickname has to be at least 3 words", message: "", actions: [])
            
            return
            
        }
        
        if self.nicknames.contains(self.inserNamePopUp.nameTextField.text!) {
            
            GenericAlert.genericAlert(self, title: "User with that nickname already exists".localized, message: "", actions: [])
            
            return
            
        }
        
        let preferences = UserDefaults.standard
        
        preferences.setValue(self.inserNamePopUp.nameTextField.text!, forKey: "preferenceNickname")
        
        let user = User(nickname: self.inserNamePopUp.nameTextField.text!)
            
        let nickRef = self.nickRef.child(self.inserNamePopUp.nameTextField.text!.lowercased())

        nickRef.setValue(user.toAnyObject())
        
        self.closeView()
        
    }
    
    
}




