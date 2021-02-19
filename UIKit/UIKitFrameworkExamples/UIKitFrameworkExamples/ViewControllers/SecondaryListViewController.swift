//
//  SecondaryListViewController.swift
//  UIKitFrameworkExamples
//
//  Created by Harish Kumar on 19/02/21.
//

import UIKit

class SecondaryListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var secondaryTableView: UITableView!
    
    var dataList: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        secondaryTableView.delegate = self
        secondaryTableView.dataSource = self
        let nib = UINib(nibName: "FrameworkListTableViewCell", bundle: nil)
        secondaryTableView.register(nib, forCellReuseIdentifier: "FrameworkListTableViewCell")
        secondaryTableView.clipsToBounds = false
        secondaryTableView.separatorStyle = .none
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FrameworkListTableViewCell") as! FrameworkListTableViewCell
        cell.frameworkName.text = dataList[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! FrameworkListTableViewCell
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let tableViewListVC = storyBoard.instantiateViewController(withIdentifier: "TableViewListViewController") as! TableViewListViewController
        tableViewListVC.screenTitle = cell.frameworkName.text ?? "No Title"
        self.navigationController?.pushViewController(tableViewListVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! FrameworkListTableViewCell
        cell.cellPrimaryBGView.backgroundColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1)
        shrinkAnimated(view: cell.cellPrimaryBGView)
    }
    
    func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! FrameworkListTableViewCell
        cell.cellPrimaryBGView.backgroundColor = UIColor(red: 250/255, green: 250/255, blue: 250/255, alpha: 1)
        resetAnimated(view: cell.cellPrimaryBGView)
    }
    
    private func shrinkAnimated(view: UIView) {
        let transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        UIView.animate(withDuration: 0.3, animations: {
            view.transform = transform
        })
    }
    
    private func resetAnimated(view: UIView) {
        let transform = CGAffineTransform.identity
        UIView.animate(withDuration: 0.3, animations: {
            view.transform = transform
        })
    }
    
}
