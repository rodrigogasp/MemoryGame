//
//  User.swift
//  MemoryGame
//
//  Created by Rodrigo Gaspar on 13/03/21.
//

import Foundation
import Firebase

struct User {
    
    let ref: DatabaseReference?
    let nickname: String
    
    
    init(nickname: String) {
        self.ref = nil
        self.nickname = nickname
    }
    
    init?(snapshot: DataSnapshot) {
        guard
            let value = snapshot.value as? [String: AnyObject],
            let nickname = value["nickname"] as? String else {
            return nil
        }
        
        self.ref = snapshot.ref
        self.nickname = nickname
    }
    
    func toAnyObject() -> Any {
        return [
            "nickname": nickname
        ]
    }
}


