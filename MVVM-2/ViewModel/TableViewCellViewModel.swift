//
//  TableViewCellViewModel.swift
//  MVVM-2
//
//  Created by Doolot on 25/10/22.
//

import Foundation

// От этой ViewModel мы ждем данные с которыми мы можем заполнить нашу ячейку
// age & fullName
class TableViewCellViewModel: TableViewCellViewModelType {

    private var profile: Profile
    
    var fullName: String {
        return profile.name + " " + profile.secondName
    }
    
    var age: String {
        return String(profile.age)
    }
    
    init(profile: Profile) {
        self.profile = profile
    }
    
}
