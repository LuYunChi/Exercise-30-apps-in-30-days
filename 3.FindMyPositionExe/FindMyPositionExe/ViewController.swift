//
//  ViewController.swift
//  FindMyPositionExe
//
//  Created by Lu Yunchi on 2018/8/20.
//  Copyright © 2018年 Lu Yunchi. All rights reserved.
//

import UIKit
import CoreLocation
import SnapKit
class ViewController: UIViewController,CLLocationManagerDelegate {
    
    
    @IBOutlet weak var back: UIImageView!
    @IBOutlet weak var blur: UIVisualEffectView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    let manager = CLLocationManager()
    var text:String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.bringSubview(toFront: button)
        self.view.bringSubview(toFront: label)
        back.frame=self.view.bounds
        back.image=#imageLiteral(resourceName: "xp.jpeg")
        blur.frame=self.view.bounds
        label.snp.makeConstraints{(make) in
        make.center.equalTo(self.view.center)
            make.top.equalTo(100)
            make.width.equalTo(400)
        }
        button.layer.borderWidth=1
        button.layer.borderColor=UIColor.white.cgColor
        button.layer.cornerRadius=5
        button.snp.makeConstraints{(make) in
            make.centerX.equalTo(self.view.center.x)
            make.top.equalTo(600)
            make.width.equalTo(100)
        }
        manager.delegate=self
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func locate(_ sender: Any) {
        manager.requestAlwaysAuthorization()
        manager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let lgn:Double=(locations.last?.coordinate.longitude)!
        let lat:Double=(locations.last?.coordinate.latitude)!
        text="Longitude is \(lgn) \n Latitude is \(lat)"
        label.text=text
        manager.stopUpdatingLocation()
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

}

