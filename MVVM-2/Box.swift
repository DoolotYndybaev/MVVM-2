//
//  Box.swift
//  MVVM-2
//
//  Created by Doolot on 27/10/22.
//

import Foundation
// Метод Боксинг

// У нас есть класс Box который имеет тип <T> то есть дженерик
class Box<T> {
    
    typealias Listener = (T) -> ()
    
    // Наблюдатель Listener это безимянная функция (T) -> () которая принимает тип (T) и ничего не возвращает
    var listener: Listener?
    
    // У нас есть значение(value) за которым будет наблюдать Наблюдатель
    var value: T {
        // как только у нас меняется value мы в listener передедаем это значение
        didSet {
            listener?(value)
        }
    }
    
    // И самое главное мы должны связать свойство с наблюдателем
    // Когда передаем клоужер мы должны писать @escaping
    func bind(listener: @escaping Listener) {
        self.listener = listener
        // Почему мы дважды передаем в наш listener value так как только мы связываемся с нашим self.listener = listener то первое значение выподает(пропадает)
        listener(value)
    }
    
    init(value: T) {
        self.value = value
    }
}
