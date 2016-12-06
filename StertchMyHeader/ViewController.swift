//
//  ViewController.swift
//  StertchMyHeader
//
//  Created by Suvan Ramani on 2016-12-06.
//  Copyright © 2016 suvanr. All rights reserved.
//

import UIKit

private let kCustomCellReuseIdentifier = "customCell"
private let kTableHeaderHeight: CGFloat = 250.0

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate
{
    
    // MARK: Properties
    @IBOutlet weak var tableView: UITableView!
    var headerView: UIView!
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
        
        // Set our tableView property to the tableView's header
        headerView = tableView.tableHeaderView
        
        // Remove the tableView's control of it's header
        tableView.tableHeaderView = nil
        
        // Re-add the subview that we have control over
        tableView.addSubview(headerView)
        
        // Push contents of the tableView down by the height of the header (i.e. kTableViewHeaderHeight)
        tableView.contentInset = UIEdgeInsetsMake(kTableHeaderHeight, 0, 0, 0)
        
        // Start with Header Completely Visible
        tableView.contentOffset = CGPoint(x: 0, y: -kTableHeaderHeight)
        
        updateHeaderView()
    }
    
    // MARK: TableView
    
    func updateHeaderView() {
        var headerRect = CGRect(x: 0, y: -kTableHeaderHeight, width: tableView.bounds.width, height: kTableHeaderHeight)
        if tableView.contentOffset.y < -kTableHeaderHeight {
            headerRect.origin.y = tableView.contentOffset.y
            headerRect.size.height = -tableView.contentOffset.y
        }
        headerView.frame = headerRect
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        updateHeaderView()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kCustomCellReuseIdentifier, for: indexPath) as! CustomTableViewCell
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
