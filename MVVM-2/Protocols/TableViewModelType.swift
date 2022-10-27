//
//  TableViewModelType.swift
//  MVVM-2
//
//  Created by Doolot on 25/10/22.
//

import Foundation
// SOLID - D: Dependency Inversion Principle (Принцип инверсии зависимостей).
// Что означает Мы должны строить нашу зависимость так чтобы она основывалась на абстракциях а не на конкретных типах

protocol TableViewViewModelType {
    func numberOfRows() -> Int    
    // описали метод который должен быть в нашей ViewModel для создания еще одной ViewModel для нашей ячейки
    func cellViewModel(forIndexPath indexPath: IndexPath) -> TableViewCellViewModelType
    
    func viewModelForSelectedRow() -> DetailViewViewModelType?
    // вспомогательный метод selectedRow по которому мы должны вернуть viewModelForSelectedRow
    func selectedRow(atIndexPath indexPath: IndexPath)
}
