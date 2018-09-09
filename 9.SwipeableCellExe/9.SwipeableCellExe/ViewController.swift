//
//  ViewController.swift
//  9.SwipeableCellExe
//
//  Created by Lu Yunchi on 2018/9/9.
//  Copyright © 2018年 Lu Yunchi. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    var table:UITableView!
    let alert=UIAlertController(title: "", message: "", preferredStyle: .alert)
    var tabledatasource=[String]()
    let paragraph="when i was young i'd listen to the radio,waiting for my favorite songs,when they played i'd sing along,it make me smile,those were such happy times and not so long ago,how i wondered where they'd gone,but they're back again just like a long lost friend,all the songs i love so well,every shalala every wo'wo,still shines,every shing-a-ling-a-ling"
    override func viewDidLoad() {
        //About Table
        table=UITableView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height-40))
        table.delegate=self
        table.dataSource=self
        table.separatorStyle = .none
        self.view.addSubview(table)
        tabledatasource=paragraph.split(separator: ",").map(String.init)
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        table.reloadData()
        let cells=table.visibleCells
        print(cells)
        for (index,cell) in cells.enumerated(){
            cell.frame.origin.y=self.view.frame.height
            UIView.animate(withDuration: 0.8, delay: 0.1*Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: [], animations:{cell.frame.origin.y=0}, completion: nil)
            print(cell.frame)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func showalert(){
        self.present(alert, animated: true, completion: nil)
        let disstime=Timer.scheduledTimer(withTimeInterval: 1, repeats: false){(Timer) in
            self.dismiss(animated: true, completion: nil)
        }
        RunLoop.main.add(disstime, forMode: .commonModes)
    }


}
extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tabledatasource.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=UITableViewCell()
        cell.textLabel?.text=tabledatasource[indexPath.row]
        cell.textLabel?.textColor=UIColor.white
        let ucolor=UIColor(red: CGFloat(0.5+0.03*Double(indexPath.row)), green: 0.8, blue: 1, alpha: 1).cgColor
        let dcolor=UIColor(red: 0.5, green: 0.5, blue: 0.9, alpha: 0.4).cgColor
        let cellview=UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 60))
        let grad=CAGradientLayer()
        grad.colors=[dcolor,ucolor]
        grad.frame=cellview.frame
        cellview.layer.addSublayer(grad)
        cell.addSubview(cellview)
        cell.sendSubview(toBack: cellview)
        cell.isUserInteractionEnabled=true
        return cell
    }
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let like=UITableViewRowAction(style: .normal, title: "👍"){(action,index) in
            self.alert.message="Thanks for you appreciation."
            self.showalert()
        }
        like.backgroundColor=UIColor.white
        let dislike=UITableViewRowAction(style: .normal, title: "👎"){(action,index) in
            self.alert.message="We will make improvement soon."
            self.showalert()
        }
        dislike.backgroundColor=UIColor.white
        return [dislike,like]
    }
   
}
