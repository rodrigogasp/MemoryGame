//
//  TabBarController.swift
//  MemoryGame
//
//  Created by Rodrigo Gaspar on 07/03/21.
//

import UIKit

class TabBarController : UITabBarController {
    
    /* ***********************************************************************
    **
    **  MARK: Variables Declaration
    **
    *************************************************************************/
     
    /* ***********************************************************************
     **
     **  MARK: View
     **
     *************************************************************************/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        //--------------------- Tab Bar Tint Color --------------------------------
        
        tabBar.barTintColor = UIColor.black
        self.tabBar.isTranslucent = false
        tabBar.unselectedItemTintColor = .gray
        tabBar.tintColor = .white
        self.navigationController?.navigationBar.isHidden = true
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
        setupTabBar()
        
    }
    
    /* ***********************************************************************
     **
     **  MARK: Setup Tab Bar
     **
     *************************************************************************/
    
    
    func setupTabBar(){
        
        let gameController = UINavigationController(rootViewController: GameVC())
        gameController.isNavigationBarHidden = true
        gameController.tabBarItem.image = UIImage(named:"controle")
        gameController.tabBarItem.title = "Play".localized
        
        let leaderboardController = UINavigationController(rootViewController: LeaderboardVC())
        leaderboardController.isNavigationBarHidden = true
        leaderboardController.tabBarItem.image = UIImage(named:"leaderboard")
        leaderboardController.tabBarItem.title = "Leaderboard".localized
        
        viewControllers = [gameController, leaderboardController]
        
    }
    
}


