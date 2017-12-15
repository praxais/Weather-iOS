//
//  DetailTableViewCellDelegate.swift
//  Weather
//
//  Created by Prajwal Maharjan on 12/15/17.
//  Copyright © 2017 Prajwal Maharjan. All rights reserved.
//

import UIKit

protocol DetailTableViewCellDelegate {
    func btnClicked(atIndex: IndexPath, textField: String?)
}
