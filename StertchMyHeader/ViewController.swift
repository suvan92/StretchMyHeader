//
//  ViewController.swift
//  StertchMyHeader
//
//  Created by Suvan Ramani on 2016-12-06.
//  Copyright © 2016 suvanr. All rights reserved.
//

import UIKit

let customCellReuseIdentifier = "customCell"

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setTableViewRowDimensions()
    }
    
    // MARK: TableView
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: customCellReuseIdentifier, for: indexPath) as! CustomTableViewCell
        cell.configureCell()
        return cell
    }
    
    func setTableViewRowDimensions()
    {
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 75
    }
}

