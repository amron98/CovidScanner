//
//  TableCell.swift
//  CovidScanner
//
//  Created by Amron Berhanu on 12/27/20.
//

import UIKit

class TableCell: UITableViewCell {
    
    @IBOutlet weak var country: UILabel!
    @IBOutlet weak var cases: UILabel!
    @IBOutlet weak var deaths: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        country.text = ""
        cases.text = ""
        deaths.text = ""
    }
    
}
