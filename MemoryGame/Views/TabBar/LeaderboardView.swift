//
//  LeaderboardView.swift
//  MemoryGame
//
//  Created by Rodrigo Gaspar on 07/03/21.
//

import UIKit

class LeaderBoardView: UIView {
    
    /* ********************************************************************************
     **
     **  MARK: Variables Declaration
     **
     **********************************************************************************/
    
    var scrollView: UIScrollView!
    
    var leaderboardLabel : UILabel!
    
    var tableView : UITableView!
    
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
        
        //-------------------------  LeaderBoard LAbel -----------------------------
        
        leaderboardLabel = UILabel(frame: CGRect(x: 0, y: yPosition, width: 0, height: 0))
        leaderboardLabel.text = "Leaderboard".localized
        leaderboardLabel.textColor = .white
        leaderboardLabel.font = UIFont.defaultFont(size: 20, type: .bold)
        leaderboardLabel.sizeToFit()
        leaderboardLabel.center.x = width/2
        
        scrollView.addSubview(leaderboardLabel)
        
        yPosition = yPosition + leaderboardLabel.frame.height + 20
        
        //-------------------------  Table view -----------------------------
        
        tableView = UITableView(frame: CGRect(x: 0, y: yPosition, width: width, height: height - yPosition))
        tableView.isScrollEnabled = true
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        
        scrollView.addSubview(tableView)
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}



