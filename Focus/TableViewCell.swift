//
//  TableViewCell.swift
//  Focus
//
//  Created by Nour Altunaib on 5/1/21.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var cellLable: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
