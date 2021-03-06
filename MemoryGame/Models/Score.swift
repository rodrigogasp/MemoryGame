//
//  Score.swift
//  MemoryGame
//
//  Created by Rodrigo Gaspar on 06/03/21.
//


import Foundation
import Firebase

struct Score {
    
    let ref: DatabaseReference?
    let addedByUser: String
    let score : Int
    
    
    init(addedByUser: String, score : Int) {
        self.ref = nil
        self.addedByUser = addedByUser
        self.score = score
    }
    
    init?(snapshot: DataSnapshot) {
        guard
            let value = snapshot.value as? [String: AnyObject],
            let addedByUser = value["addedByUser"] as? String,
            let score = value["score"] as? Int else {
            return nil
        }
        
        self.ref = snapshot.ref
        self.addedByUser = addedByUser
        self.score = score
    }
    
    func toAnyObject() -> Any {
        return [
            "addedByUser": addedByUser,
            "score": score
        ]
    }
}

