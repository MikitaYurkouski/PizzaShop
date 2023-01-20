//
//  MainTabBarViewModel.swift
//  PizzaShop
//
//  Created by Никита Юрковский on 13.01.23.
//

import Foundation
import FirebaseAuth

class MainTabBarViewModel: ObservableObject {
    @Published var user: User
    
    init(user: User) {
        self.user = user
    }
}
