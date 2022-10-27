//
//  TableViewCell.swift
//  MVVM-2
//
//  Created by Doolot on 25/10/22.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var fullNamepOutlet: UILabel!
    @IBOutlet weak var ageLabel: UILabel!

//    func configure(profile: Profile) {
//        self.fullNamepOutlet.text = "\(profile.name) \(profile.secondName)"
//        self.ageLabel.text = "\(profile.age)"
//    }
    
    // В нашу TableViewCell должны добавить нашу модельку TableViewCellViewModel
    weak var viewModel: TableViewCellViewModelType? {
        willSet(viewModel) {
            guard let viewModel = viewModel else
            { return }
            fullNamepOutlet.text = viewModel.fullName
            ageLabel.text = viewModel.age
        }
    }

}
