//
//  DetailViewModel.swift
//  MVVM-2
//
//  Created by Doolot on 25/10/22.
//

import Foundation

class DetailViewModel: DetailViewViewModelType {
    private var profile: Profile
    var description: String {
        return "\(profile.name) \(profile.secondName) is\(profile.age) age old!"
    }
    var age: Box<String?> = Box(value: nil)
    
    init(profile: Profile) {
        self.profile = profile
    }
}
