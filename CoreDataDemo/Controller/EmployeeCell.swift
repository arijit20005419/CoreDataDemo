//
//  EmployeeCell.swift
//  CoreDataDemo
//
//  Created by SHRIDEVI SAWANT on 07/02/22.
//  Copyright © 2022 comviva. All rights reserved.
//

import UIKit

class EmployeeCell: UITableViewCell {

    @IBOutlet weak var salaryL: UILabel!
    @IBOutlet weak var cityL: UILabel!
    @IBOutlet weak var emp_idL: UILabel!
    @IBOutlet weak var nameL: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
