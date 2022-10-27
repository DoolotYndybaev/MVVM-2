//
//  ViewModel.swift
//  MVVM-2
//
//  Created by Doolot on 25/10/22.
//

import Foundation

class ViewModel: TableViewViewModelType {
    
    // IndexPath? - опциональный индекспаз потому что не всегда будет выбран IndexPath
    private var selectedIndexPath: IndexPath?
    
    var profiles = [Profile(name: "John", secondName: "Smith", age: 33),
                Profile(name: "Stieve", secondName: "Dog", age: 23),
                Profile(name: "Eminen", secondName: "Kark", age: 43)
                ]
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> TableViewCellViewModelType {
        let profile = profiles[indexPath.row]
        // это моделька для заполнения нашей ячейки
        return TableViewCellViewModel(profile: profile)
    }
    
    func numberOfRows() -> Int {
        profiles.count
    }
    
    // MARK: - DetailView
    func viewModelForSelectedRow() -> DetailViewViewModelType? {
        guard let selectedIndexPath = selectedIndexPath else { return nil }

        return DetailViewModel(profile: profiles[selectedIndexPath.row])
    }
    func selectedRow(atIndexPath indexPath: IndexPath) {
        self.selectedIndexPath = indexPath
    }
}
