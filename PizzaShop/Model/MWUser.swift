//
//  MWUser.swift
//  PizzaShop
//
//  Created by Никита Юрковский on 15.01.23.
//

import Foundation



struct MWUser: Identifiable {
    
    var id: String  //= UUID().uuidString
    var name: String
    var phone: Int
    var addres: String
    
    var representation: [String: Any] {
        
        var repres = [String: Any] ()
        repres["id"] = self.id
        repres["name"] = self.name
        repres["phone"] = self.phone
        repres["addres"] = self.addres
        
        return repres
        
    }
    
    
//    "id": user.id,
//    "name": user.name,
//    "phone": user.phone,
//    "addres": user.addres
    
}
