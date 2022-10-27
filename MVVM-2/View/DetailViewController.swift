//
//  DetailViewController.swift
//  MVVM-2
//
//  Created by Doolot on 25/10/22.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    
    var viewModel: DetailViewViewModelType?
    
    
    // Почему мы используем viewWillAppear - потому что viewDidLoad он один раз загрузиться и больше не меняется
    // viewWillAppear - это метод который отрабатывает до того как в view появится на экране
    // И этот метод будет отрабатывать каждый раз когда у нас появляется экран
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let viewModel = viewModel else { return }

        self.textLabel.text = viewModel.description
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //[unowned self] Предотвращаем цикл сильных ссылок
        viewModel?.age.bind { [unowned self] in
            guard let string = $0 else { return } // $0 - первый параметр который передается в блок bind
            self.textLabel.text = string
        }
        
        delay(delay: 5) { [unowned self] in
            self.viewModel?.age.value = "Some new value"
        }
    }
    
    // Наш клоужер может сбежать из нашей области видимости метода поэтому обозначем его @escaping
    private func delay(delay: Double, clouser: @escaping () -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            clouser()
        }
    }
}
