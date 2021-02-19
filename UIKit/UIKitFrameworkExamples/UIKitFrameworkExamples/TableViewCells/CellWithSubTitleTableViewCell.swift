//
//  CellWithSubTitleTableViewCell.swift
//  UIKitFrameworkExamples
//
//  Created by Harish Kumar on 19/02/21.
//

import UIKit

class CellWithSubTitleTableViewCell: UITableViewCell {

    @IBOutlet weak var cellTitle: UILabel!
    @IBOutlet weak var cellSubTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
