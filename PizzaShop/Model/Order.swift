//
//  Order.swift
//  PizzaShop
//
//  Created by Никита Юрковский on 19.01.23.
//

import Foundation
import FirebaseFirestore



struct Order {
    var id: String = UUID().uuidString
    var userID: String
    var positions = [Position]()
    var date: Date
    var status: String
    var cost: Int {
        
        var sum = 0
        
        for position in positions {
            sum += position.cost
        }
        return sum
    }
    
    var representation: [String: Any] {
        
        var repres = [String: Any]()
        repres["id"] = id
        repres["userID"] = userID
        repres["date"] = Timestamp(date: date)
        repres["ststus"] = status
        return repres
    }
}
