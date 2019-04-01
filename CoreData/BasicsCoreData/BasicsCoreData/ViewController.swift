//
//  ViewController.swift
//  BasicsCoreData
//
//  Created by Harish Kumar on 01/04/19.
//  Copyright © 2019 Harish Kumar. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var ListTableView: UITableView!
    var Data : [DataEntity] = [DataEntity]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        ListTableView.dataSource = self
        Data = PersistanceService.FetchData()
        self.ListTableView.reloadData()
        
    }

    @IBAction func AddData(_ sender: UIButton) {
        let alert = UIAlertController(title: "Insert Data", message: "", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "Data"
        }
        let action = UIAlertAction(title: "SAVE", style: .default) { (_) in
            let textData = alert.textFields?.first?.text
            let dataEntity = DataEntity(context: PersistanceService.context)
            dataEntity.dataAttribute = textData
            PersistanceService.saveContext()
            self.Data.append(dataEntity)
            self.ListTableView.reloadData()
        }
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        cell.textLabel?.text = Data[indexPath.row].dataAttribute
        return cell
    }
    
}

