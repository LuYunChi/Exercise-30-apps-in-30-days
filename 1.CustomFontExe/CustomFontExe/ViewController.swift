//
//  ViewController.swift
//  CustomFontExe
//
//  Created by Lu Yunchi on 2018/8/17.
//  Copyright © 2018年 Lu Yunchi. All rights reserved.
//

import UIKit
import SnapKit
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        button.layer.borderWidth=1
        button.layer.cornerRadius=5
        button.layer.borderColor=UIColor.red.cgColor
        label.font=UIFont(name: "Courier", size: 24)
        button.snp.makeConstraints{(make) in
            make.top.equalTo(500)
            make.centerX.equalTo(self.view)
            make.width.equalTo(150)
        }
        label.snp.makeConstraints{(make) in
            make.top.equalTo(200)
            make.centerX.equalTo(self.view)
        }
    }

    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var label: UILabel!
    
    func change(){
        label.font=UIFont(name: "Didot", size: 24)
    }
    
    @IBAction func btnPressed(_ sender: Any) {
        change()
    }
    
    
    
    
    
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

