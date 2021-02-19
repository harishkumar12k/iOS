//
//  ViewController.swift
//  UIKitFrameworkExamples
//
//  Created by Harish Kumar on 18/02/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var frameworkListTableView: UITableView!
    
    let frameworkList = ["UITableView"]
    let tableViewList = ["Simple Title List", "Title With Sub Title", "Brief Detail", "Parallax List"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "List Of Frameworks"
        frameworkListTableView.delegate = self
        frameworkListTableView.dataSource = self
        let nib = UINib(nibName: "FrameworkListTableViewCell", bundle: nil)
        frameworkListTableView.register(nib, forCellReuseIdentifier: "FrameworkListTableViewCell")
        frameworkListTableView.clipsToBounds = false
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return frameworkList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FrameworkListTableViewCell") as! FrameworkListTableViewCell
        cell.frameworkName.text = frameworkList[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! FrameworkListTableViewCell
        if cell.frameworkName.text == frameworkList[0] {
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let secondaryVC = storyBoard.instantiateViewController(withIdentifier: "SecondaryListViewController") as! SecondaryListViewController
            secondaryVC.dataList = tableViewList
            self.navigationController?.pushViewController(secondaryVC, animated: true)
        }
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

