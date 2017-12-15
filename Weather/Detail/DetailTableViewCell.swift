//
//  DetailTableViewCell.swift
//  Weather
//
//  Created by Prajwal Maharjan on 12/15/17.
//  Copyright © 2017 Prajwal Maharjan. All rights reserved.
//

import UIKit

class DetailTableViewCell: UITableViewCell {
    var delegate: DetailTableViewCellDelegate!
    var indexPath: IndexPath!
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var btnSave: UIButton!
    
    @IBAction func onButtonClicked(_ sender: UIButton) {
        self.delegate.btnClicked(atIndex: indexPath, textField: textField.text)
    }
}
