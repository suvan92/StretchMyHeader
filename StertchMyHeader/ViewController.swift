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
    
    // MARK: Properties
    @IBOutlet weak var tableView: UITableView!
    let items = [
        NewsItem(category: .World, summary: "Climate change protests, divestments meet fossil fuels realities"),
        NewsItem(category: .Europe, summary: "Scotland's 'Yes' leader says independence vote is 'once in a lifetime"),
        NewsItem(category: .MiddleEast, summary: "Airstrikes boost Islamic State, FBI director warns more hostages possible"),
        NewsItem(category: .Africa, summary: "Nigeria says 70 dead in building collapse; questions S. Africa victim claim"),
        NewsItem(category: .AsiaPacific, summary: "Despite UN ruling, Japan seeks backing for whale hunting"),
        NewsItem(category: .Americas, summary: "Officials: FBI is tracking 100 Americans who fought alongside IS in Syria"),
        NewsItem(category: .World, summary: "South Africa in $40 billion deal for Russian nuclear reactors"),
        NewsItem(category: .Europe, summary: "One million babies' created by EU student exchanges")
        ]
    
    // MARK: General Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setTableViewRowDimensions()
    }
    
    // MARK: TableView
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: customCellReuseIdentifier, for: indexPath) as! CustomTableViewCell
        cell.newsItem = items[indexPath.row]
        return cell
    }
    
    func setTableViewRowDimensions()
    {
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 75
    }
    
    override var prefersStatusBarHidden: Bool
    {
        return true
    }
}
