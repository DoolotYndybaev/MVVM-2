//
//  DetailViewViewModelType.swift
//  MVVM-2
//
//  Created by Doolot on 25/10/22.
//

import Foundation

protocol DetailViewViewModelType {
    var description: String { get }
    var age: Box<String?> { get }
}
