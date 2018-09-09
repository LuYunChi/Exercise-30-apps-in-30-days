//
//  ViewController.swift
//  7.ColorGradientExe
//
//  Created by Lu Yunchi on 2018/9/6.
//  Copyright © 2018年 Lu Yunchi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    
    var colorset=[[CGColor]]()
    var gradientlayer:CAGradientLayer!
    var now=0
    override func viewDidLoad() {
        super.viewDidLoad()
        setlabel()
        let gesturemonitor=UIPanGestureRecognizer(target: self, action: #selector(gesturereaction(sender:)))
        self.view.addGestureRecognizer(gesturemonitor)
        creategradient()
        self.view.bringSubview(toFront: label)
    }
    
    func setlabel(){
        label.font=UIFont.systemFont(ofSize: 30)
        label.text="0"
        label.textColor=UIColor.white
        label.center=self.view.center
    }
    func creategradient(){
        newcolorset()
        gradientlayer=CAGradientLayer()
        gradientlayer.frame=self.view.bounds
        gradientlayer.colors=colorset[now]
        print(colorset[now])
        self.view.layer.addSublayer(gradientlayer)
    }
    func newcolorset(){
        for i in 0...10{
            colorset.append(color(index: Double(i)))
        }
    }
    func color(index:Double)->[CGColor]{
        let r1=(233.0-7.0*index)/255.0,    r2=(217.0-14.0*index)/255.0
        let g1=(142.0+8.0*index)/255.0,   g2=(60.0+14.0*index)/255.0
        let b1=(52.0+4.0*index)/255.0,    b2=(51.0+23.0*index)/255.0
        let c=[UIColor(red: CGFloat(r1), green: CGFloat(g1), blue: CGFloat(b1), alpha: 1).cgColor,UIColor(red: CGFloat(r2), green: CGFloat(g2), blue: CGFloat(b2), alpha: 1).cgColor]
        return c
    }
    var totalindex=0, place:CGFloat=0, prevtrans:CGFloat=0
    @objc func gesturereaction(sender:UIPanGestureRecognizer){
        let dist=self.view.frame.height/9
        let currentrans=sender.translation(in: self.view).y
        let velocity=sender.velocity(in: self.view).y
        if prevtrans*currentrans<0 || (currentrans<prevtrans && velocity>0) || (currentrans>prevtrans && velocity<0){prevtrans=currentrans}
        place=place+currentrans-prevtrans
        prevtrans=currentrans
        totalindex=Int(place/dist)
        if totalindex>9 {
            totalindex=9
            place=9*dist
        }else if totalindex<0 {
            totalindex=0
            place=0
        }
        print(prevtrans)
        change()
        
        
        
    }
    func change(){
        label.text="\(totalindex)"
        gradientlayer.colors=colorset[totalindex]
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

