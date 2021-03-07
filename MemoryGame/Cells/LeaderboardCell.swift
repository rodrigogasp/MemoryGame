//
//  LeaderboardCell.swift
//  MemoryGame
//
//  Created by Rodrigo Gaspar on 07/03/21.
//

import UIKit


class Leaderboardcell: UITableViewCell {
    
    /* **************************************************************************************************
     **
     **  MARK: Variables declaration
     **
     ****************************************************************************************************/
    
    var nameLabel : UILabel!
    
    var scoreLabel : UILabel!
    
    var lineView : UIView!
    
    /* **************************************************************************************************
     **
     **  MARK: Init
     **
     ***************************************************************************************************/
    
    init(view: UIView) {
        super.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: nil)
        
        let width = view.frame.size.width
        
        let height : CGFloat = 40
        
        self.backgroundColor = UIColor.clear
        
        self.selectionStyle = .none
        
        //------------------------- Name Label -----------------------------
        
        nameLabel = UILabel(frame: CGRect(x: width*0.05, y: 0, width: width*0.45, height: 25))
        nameLabel.textColor = .white
        nameLabel.font = UIFont.defaultFont(size: 16, type: .regular)
        nameLabel.center.y = height/2

        contentView.addSubview(nameLabel)
        
        //------------------------- Score Label -----------------------------
        
        scoreLabel = UILabel(frame: CGRect(x: 0, y: 0, width: width*0.4, height: 25))
        scoreLabel.textColor = .white
        scoreLabel.font = UIFont.defaultFont(size: 16, type: .regular)
        scoreLabel.frame.origin.x = width*0.95 - scoreLabel.frame.width
        scoreLabel.textAlignment = .right
        scoreLabel.center.y = height/2
        
        contentView.addSubview(scoreLabel)
        
        //------------------------- Line -----------------------------
        
        lineView = UIView(frame: CGRect(x: 0, y: 0, width: width*0.9, height: 1))
        lineView.backgroundColor = .white
        lineView.center.x = width/2
        lineView.frame.origin.y = height - lineView.frame.height
        
        contentView.addSubview(lineView)
        

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}




