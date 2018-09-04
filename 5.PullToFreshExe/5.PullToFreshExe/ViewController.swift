//
//  ViewController.swift
//  5.PullToFreshExe
//
//  Created by Lu Yunchi on 2018/8/21.
//  Copyright © 2018年 Lu Yunchi. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    var table:UITableView!
    var refresher=UIRefreshControl()
    var dates=[Date]()
    var i=0
    override func viewDidLoad() {
        super.viewDidLoad()
        table=UITableView(frame: CGRect(x: 10, y: UIApplication.shared.statusBarFrame.height+10, width: self.view.frame.width, height:self.view.frame.height))
        self.view.addSubview(table)
        table.delegate=self
        table.dataSource=self
        
        refresher.attributedTitle=NSAttributedString(string:"Refreshing")
        refresher.addTarget(self, action: #selector(pullaction), for: UIControlEvents.valueChanged)
        table.addSubview(refresher)
        refreshdate()
        table.reloadData()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func refreshdate(){
        dates.insert(NSDate() as Date , at: 0)
    }
    @objc func pullaction(){
        refreshdate()
        table.reloadData()
        refresher.endRefreshing()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dates.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=UITableViewCell(style: .default, reuseIdentifier: "List")
        let form=DateFormatter()
        form.dateFormat="yyyy-MM-dd' T 'HH:mm:ss"
        let str=form.string(from: dates[indexPath.row])
        cell.textLabel?.text=str
        return cell
    }

}

