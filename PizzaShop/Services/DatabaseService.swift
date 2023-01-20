//
//  DatabaseService.swift
//  PizzaShop
//
//  Created by Никита Юрковский on 15.01.23.
//

import Foundation
import FirebaseFirestore

class DatabaseService {
    
    static let shared = DatabaseService()
    private let db = Firestore.firestore()
    
    private var usersRef: CollectionReference {
        return db.collection("users")
    }
    
    private var ordersRef: CollectionReference {
        return db.collection("orders")
    }
    
    
    private init() { }
    
    func setOrder(order: Order, completion: @escaping (Result<Order, Error>) -> ()) {
        ordersRef.document(order.id).setData(order.representation) { error in
            if let error = error {
                completion(.failure(error))
            } else {
                
                self.setPositions(to: order.id, positions: order.positions) { result in
                    switch result {
                        
                    case .success(let positions):
                        print(positions.count)
                        completion(.success(order))
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
            }
        }
        
    }
    
    func setPositions(to orderId: String, positions: [Position], completion: @escaping (Result<[Position], Error>) -> ()) {
        let positionRef = ordersRef.document(orderId).collection("positions")
        
        for position in positions {
            positionRef.document(position.id).setData(position.representation)
        }
        completion(.success(positions))
    }
    
    
    func setProfile(user: MWUser, completion: @escaping (Result<MWUser, Error>) -> ()) {
        
        usersRef.document(user.id).setData(user.representation) { error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(user))
            }
        }
    }
    
    func getProfile(completion: @escaping (Result<MWUser, Error>) -> ()) {
                                                                                                    //   !!!!!!!!!!NWNWNNWNWNNWWNB
        usersRef.document(AuthService.shared.currentUser!.uid).getDocument { docSnapshot, error in
            
            guard let snap = docSnapshot else { return }
            guard let data = snap.data() else { return }
            
            guard let userName = data["name"] as? String else { return }
            guard let id = data["id"] as? String else { return }
            guard let phone = data["phone"] as? Int else { return }
            guard let addres = data["addres"] as? String else { return }
            
            let user = MWUser(id: id, name: userName, phone: phone, addres: addres)
            
            completion(.success(user))
            
        }
    }
}
        ////            "id": user.id,
        ////            "name": user.name,
        ////            "phone": user.phone,
        ////            "addres": user.addres])
