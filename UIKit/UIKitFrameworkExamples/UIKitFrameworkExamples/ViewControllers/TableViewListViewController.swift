//
//  TableViewListViewController.swift
//  UIKitFrameworkExamples
//
//  Created by Harish Kumar on 19/02/21.
//

import UIKit

class TableViewListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var listTableView: UITableView!
    let titles = ["Title 1", "Title 2", "Title 3", "Title 4"]
    let subTitles = ["Sub title 1", "Sub title 2", "Sub title 3", "Sub title 4"]
    var screenTitle = ""
    var cellIdentifier = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        var nib = UINib()
        if screenTitle == "Simple Title List" {
            cellIdentifier = "SimpleTableViewCell"
        } else if screenTitle == "Title With Sub Title" {
            cellIdentifier = "CellWithSubTitleTableViewCell"
        }
        nib = UINib(nibName: cellIdentifier, bundle: nil)
        listTableView.register(nib, forCellReuseIdentifier: cellIdentifier)
        listTableView.delegate = self
        listTableView.dataSource = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if screenTitle == "Simple Title List" {
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! SimpleTableViewCell
            cell.textLabel?.text = titles[indexPath.row]
            cell.selectionStyle = .none
            return cell
        } else if screenTitle == "Title With Sub Title" {
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! CellWithSubTitleTableViewCell
            cell.cellTitle.text = titles[indexPath.row]
            cell.cellSubTitle.text = subTitles[indexPath.row]
            cell.selectionStyle = .none
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
