//
//  DetailViewController.swift
//  Weather
//
//  Created by Prajwal Maharjan on 12/15/17.
//  Copyright © 2017 Prajwal Maharjan. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let save = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveClicked(sender:)))
        navigationItem.rightBarButtonItems = [save]
        
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    @objc private func saveClicked(sender: UIBarButtonItem){
        let indexPath = IndexPath(row: 0, section: 0)
        let cell = tableView.cellForRow(at: indexPath) as! DetailTableViewCell
        print("Xais \(cell.textField.text ?? "Xais")")
    }
}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource, DetailTableViewCellDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailCell", for: indexPath) as! DetailTableViewCell
        cell.delegate = self
        cell.indexPath = indexPath
        return cell
    }
    
    //on tableViewCell Save button clicked
    func btnClicked(atIndex: IndexPath, textField: String?) {
        print(textField ?? "XaisMilena")
    }
}
