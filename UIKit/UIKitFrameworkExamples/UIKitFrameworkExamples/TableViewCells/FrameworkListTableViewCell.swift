//
//  FrameworkListTableViewCell.swift
//  UIKitFrameworkExamples
//
//  Created by Harish Kumar on 18/02/21.
//

import UIKit

class FrameworkListTableViewCell: UITableViewCell {

    @IBOutlet weak var cellPrimaryBGView: UIView!
    @IBOutlet weak var frameworkName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cellPrimaryBGView.backgroundColor = UIColor(red: 250/255, green: 250/255, blue: 250/255, alpha: 1)
        cellPrimaryBGView.layer.cornerRadius = 10
        cellPrimaryBGView.layer.shadowColor = UIColor.black.cgColor
        cellPrimaryBGView.layer.shadowOpacity = 0.5
        cellPrimaryBGView.layer.shadowOffset = CGSize(width: 1, height: 1)
        cellPrimaryBGView.layer.shadowRadius = 3
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }


}
