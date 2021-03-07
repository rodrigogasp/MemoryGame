//
//  LeaderboardVC.swift
//  MemoryGame
//
//  Created by Rodrigo Gaspar on 07/03/21.
//



import UIKit
import FirebaseDatabase

class LeaderboardVC: UIViewController {
    
    /* **************************************************************************************************
     **
     **  MARK: Variables Declaration
     **
     ****************************************************************************************************/
    
    var leaderboardView : LeaderBoardView!
    
    let ref = Database.database().reference(withPath: "scoreBoard")
    
    var scores : [Score] = []
    
    /* **************************************************************************************************
     **
     **  MARK: View
     **
     ****************************************************************************************************/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        leaderboardView = LeaderBoardView(view: view, parent: self)
        
        //------------------------- Delegate -----------------------------
        
        leaderboardView.tableView.delegate = self
        leaderboardView.tableView.dataSource = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        ref.observe(.value) { (snapshot) in
            
            var newScores : [Score] = []
            
            for child in snapshot.children {
                
                if let snapshot = child as? DataSnapshot, let score = Score(snapshot: snapshot) {
                    
                    newScores.append(score)
                    
                }
                
            }
            
            var orderArray = newScores.sorted(by: { $0.score > $1.score })
            
            self.scores = orderArray
            self.leaderboardView.tableView.reloadData()
            
        }
        
        
    }
    
    
}


/* **************************************************************************************************
 **
 **  MARK: Extension Table View Delegate
 **
 ****************************************************************************************************/

extension LeaderboardVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.scores.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = Leaderboardcell(view: view)
        
        cell.nameLabel.text = self.scores[indexPath.row].addedByUser
        
        cell.scoreLabel.text = String(self.scores[indexPath.row].score)
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 40
        
    }
    
    
    
    
    
}







