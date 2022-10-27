//
//  TableViewCellViewModelType.swift
//  MVVM-2
//
//  Created by Doolot on 25/10/22.
//

import Foundation

// Описали что должен содержать кто подпишется под наш протокол
protocol TableViewCellViewModelType: AnyObject {
    var fullName: String { get }
    var age: String { get }
}
