//
//  ViewController.swift
//  WatchDemoExe
//
//  Created by Lu Yunchi on 2018/8/18.
//  Copyright © 2018年 Lu Yunchi. All rights reserved.
//

import UIKit
import SnapKit
class ViewController: UIViewController {
    @IBOutlet weak var area1: UIView!
    @IBOutlet weak var area2: UIView!
    @IBOutlet weak var area3: UIView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var start: UIButton!
    @IBOutlet weak var stop: UIButton!
    @IBOutlet weak var reset: UIButton!
    @IBOutlet weak var s: UILabel!
    var cal:Double=0
    var timer:Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//s
        s.snp.makeConstraints{(make) in
            make.centerY.equalTo(label)
            make.centerX.equalTo(label.center.x + 80)
        }
//area1
        area1.snp.makeConstraints{(make) in
            make.edges.equalTo(UIEdgeInsetsMake(0, 0, 0, 0))
        }
//lable
        area1.addSubview(label)
        label.layer.borderWidth=1
        label.layer.cornerRadius=5
        label.layer.borderColor=UIColor.white.cgColor
        label.snp.makeConstraints{(make) in
            make.centerX.equalTo(area1)
            make.centerY.equalTo(100)
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
//area2
        area2.snp.makeConstraints{(make) in
            make.height.equalTo(50)
            make.width.equalTo(self.view.frame.width / 2)
            make.left.equalTo(0)
            make.bottom.equalTo(-50)
        }
//start
        area2.addSubview(start)
        start.snp.makeConstraints{(make) in
            make.height.equalTo(50)
            make.width.equalTo(self.view.frame.width / 2)
            make.centerX.equalTo(area2)
            make.centerY.equalTo(area2)
        }
//area3
        area3.snp.makeConstraints{(make) in
            make.height.equalTo(50)
            make.width.equalTo(self.view.frame.width / 2)
            make.right.equalTo(0)
            make.bottom.equalTo(-50)
        }
//stop
        area3.addSubview(stop)
        stop.snp.makeConstraints{(make) in
            make.height.equalTo(50)
            make.width.equalTo(self.view.frame.width / 2)
            make.centerX.equalTo(area3)
            make.centerY.equalTo(area3)
        }
//reset
        area1.addSubview(reset)
        reset.snp.makeConstraints{(make) in
            make.top.equalTo(20)
            make.right.equalTo(-20)
        }
    }
  
//timer
    
    @IBAction func startt() {
        guard timer == nil else {return}
        timer=Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true){(Timer) in
            self.cal+=0.01
            self.label.text=String(format: "%.2f", self.cal)
        }
        self.timer.fire()
    }
    
    @IBAction func stopp() {
        guard timer != nil else {return}
        timer.invalidate()
        timer=nil
    }
    
    @IBAction func resett() {
        self.label.text="0.00"
        self.cal=0
    }
    
   
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

