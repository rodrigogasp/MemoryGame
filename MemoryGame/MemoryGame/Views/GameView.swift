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
    
    var oneView : UIButton!
    
    var twoView : UIButton!
    
    var threeView : UIButton!
    
    var someButton : UIButton!
    
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
        
        var yPosition = height*0.13
        
        //------------------------- Scroll View -----------------------------
        
        scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        scrollView.isScrollEnabled = true
        scrollView.backgroundColor = .white
        
        view.addSubview(scrollView)
        
        oneView = UIButton(frame: CGRect(x: 0, y: yPosition, width: 150, height: 150))
        oneView.backgroundColor = .green
        oneView.layer.borderWidth = 3
        oneView.center.x = width/2
        
        scrollView.addSubview(oneView)
        
        yPosition = yPosition + oneView.frame.height + 20
        
        twoView = UIButton(frame: CGRect(x: 0, y: yPosition, width: 150, height: 150))
        twoView.backgroundColor = .red
        twoView.layer.borderWidth = 3
        twoView.center.x = width/2
        
        scrollView.addSubview(twoView)
        
        yPosition = yPosition + twoView.frame.height + 20
        
        threeView = UIButton(frame: CGRect(x: 0, y: yPosition, width: 150, height: 150))
        threeView.backgroundColor = .blue
        threeView.layer.borderWidth = 3
        threeView.center.x = width/2
        
        scrollView.addSubview(threeView)
        
        yPosition = yPosition + threeView.frame.height + 20
        
        someButton = UIButton(frame: CGRect(x: 0, y: yPosition, width: width*0.7, height: 50))
        someButton.backgroundColor = .yellow
        someButton.setTitle("Go!", for: .normal)
        someButton.setTitleColor(.black, for: .normal)
        someButton.center.x = width/2
        
        scrollView.addSubview(someButton)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


