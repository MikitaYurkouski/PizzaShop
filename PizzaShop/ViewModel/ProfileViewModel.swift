//
//  ProfileViewModel.swift
//  PizzaShop
//
//  Created by Никита Юрковский on 15.01.23.
//

import Foundation


class ProfileViewModel: ObservableObject {
    
    @Published var profile: MWUser
    
    init(profile: MWUser) {
        self.profile = profile
    }
    
    func setProfile() {
        DatabaseService.shared.setProfile(user: self.profile) { result in     ////.setUser????
            switch result {
                
            case .success(let user):
                print(user.name)
            case .failure(let error):
                print("Ошибка отправки данных \(error.localizedDescription)")
            }
        }
    }
    
    func getProfile() {
        DatabaseService.shared.getProfile { result in
            switch result {
                
            case .success(let user):
                self.profile = user
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}
