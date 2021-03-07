//
//  GameView.swift
//  MemoryGame
//
//  Created by Rodrigo Gaspar on 27/02/21.
//


import UIKit

class GameView: UIView {
    
    /* ********************************************************************************
     **
     **  MARK: Variables Declaration
     **
     **********************************************************************************/
    
    var scrollView: UIScrollView!
    
    var scoreLabel : UILabel!
    
    var highScoreLabel : UILabel!
    
    var oneView : UIButton!
    
    var twoView : UIButton!
    
    var threeView : UIButton!
    
    var fourView : UIButton!
    
    var roundButton : UIButton!
    
    /* ******************************************************************************
     **
     **  MARK: Init
     **
     ********************************************************************************/
    
    init(view: UIView, parent: UIViewController) {
        super.init(frame: view.frame);
        
        view.backgroundColor = .white
        
        let width = view.frame.size.width
        let height = view.frame.size.height
        
        var yPosition = height*0.05
        
        //------------------------- Scroll View -----------------------------
        
        scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        scrollView.isScrollEnabled = true
        scrollView.backgroundColor = .black
        
        view.addSubview(scrollView)
        
        //------------------------- HighscoreLabel -----------------------------
        
        highScoreLabel = UILabel(frame: CGRect(x: width*0.05, y: yPosition, width: width*0.4, height: 25))
        highScoreLabel.textColor = .white
        highScoreLabel.font = UIFont.defaultFont(size: 18, type: .bold)
        
        scrollView.addSubview(highScoreLabel)
        
        //------------------------- Score Label -----------------------------
        
        scoreLabel = UILabel(frame: CGRect(x: 0, y: yPosition, width: width*0.4, height: 25))
        scoreLabel.textColor = .white
        scoreLabel.font = UIFont.defaultFont(size: 18, type: .bold)
        scoreLabel.frame.origin.x = width*0.95 - scoreLabel.frame.width
        scoreLabel.textAlignment = .right
        
        scrollView.addSubview(scoreLabel)
        
        yPosition = yPosition + scoreLabel.frame.height + 50
        
        //------------------------- One view -----------------------------
        
        oneView = UIButton(frame: CGRect(x: width*0.05, y: yPosition, width: width*0.4375, height: width*0.4375))
        oneView.backgroundColor = .green
        oneView.layer.borderWidth = 3
        
        scrollView.addSubview(oneView)
        
        let xPosition = oneView.frame.origin.x + oneView.frame.width + width*0.025
        
        //------------------------- Two view -----------------------------
        
        twoView = UIButton(frame: CGRect(x: xPosition, y: yPosition, width: width*0.4375, height: width*0.4375))
        twoView.backgroundColor = .red
        twoView.layer.borderWidth = 3
        
        scrollView.addSubview(twoView)
        
        yPosition = yPosition + twoView.frame.height + 20
        
        //------------------------- Three view -----------------------------
        
        threeView = UIButton(frame: CGRect(x: width*0.05, y: yPosition, width: width*0.4375, height: width*0.4375))
        threeView.backgroundColor = .blue
        threeView.layer.borderWidth = 3
        
        scrollView.addSubview(threeView)
        
        //------------------------- Four view -----------------------------
        
        fourView = UIButton(frame: CGRect(x: xPosition, y: yPosition, width: width*0.4375, height: width*0.4375))
        fourView.backgroundColor = .yellow
        fourView.layer.borderWidth = 3
        
        scrollView.addSubview(fourView)
        
        yPosition = yPosition + threeView.frame.height + 20
        
        //------------------------- Some Button  -----------------------------
        
        roundButton = UIButton(frame: CGRect(x: 0, y: yPosition, width: width*0.7, height: 50))
        roundButton.backgroundColor = .white
        roundButton.setTitle("Go!", for: .normal)
        roundButton.setTitleColor(.black, for: .normal)
        roundButton.center.x = width/2
        
        scrollView.addSubview(roundButton)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


