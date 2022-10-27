//
//  TableViewController.swift
//  MVVM-2
//
//  Created by Doolot on 25/10/22.
//

import UIKit

// TableViewController - наш основной класс который ответственнен за то что мы отображаем в нашей таблице
// Всю информацию мы храним уже не во вьюКонтроллере а храним во вьюМодельке   чтобы мы могли его достать у нас должна быть ссылка (вот она     var viewModel: TableViewViewModelType?)
class TableViewController: UITableViewController {
    
    // потому что мы не собираемся его никода передовать
    private var viewModel: TableViewViewModelType?
    
    //    // Когда у нас опциональное значение мы используем var
    //    var profiles: [Profile]?
    //
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // создаем viewModel
        viewModel = ViewModel()
        
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfRows() ?? 0
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell
        
        guard let tableViewCell = cell,
              let viewModel = viewModel else
        { return UITableViewCell() }
        
        // теперь у нас получилось viewModel для нашей ячейки
        let cellViewModel = viewModel.cellViewModel(forIndexPath: indexPath)
        
        tableViewCell.viewModel = cellViewModel
        
        return tableViewCell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let viewModel = viewModel else { return }
        viewModel.selectedRow(atIndexPath: indexPath)
        
        // осуществила переход по Segue
        performSegue(withIdentifier: "detailSegue", sender: nil)

    }
    
    // Подготавливаем наш переход и также сгенерируем нашу viewModel и передадим его на новый экран
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier, let viewModel = viewModel else { return }
        if identifier == "detailSegue" {
            if let dvc = segue.destination as? DetailViewController {
                dvc.viewModel = viewModel.viewModelForSelectedRow()
            }
        }
    }
    
}
