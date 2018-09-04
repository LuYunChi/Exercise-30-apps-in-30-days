//
//  ViewController.swift
//  4.LimitInputText
//
//  Created by Lu Yunchi on 2018/8/20.
//  Copyright © 2018年 Lu Yunchi. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextViewDelegate {
    
    var text:UITextView!
    var label:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initnavi()
        inittext()
        initlabel()
        self.view.backgroundColor=UIColor.white
        NotificationCenter.default.addObserver(self, selector: #selector(follow(note:)), name: NSNotification.Name.UIKeyboardWillChangeFrame, object: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func initnavi(){
        let close=UIBarButtonItem(title: "close", style: .plain, target: self, action: nil)
        let send=UIBarButtonItem(title: "send", style: .plain, target: self, action: nil)
        send.tintColor=UIColor.orange
        self.navigationItem.leftBarButtonItem=close
        self.navigationItem.rightBarButtonItem=send
    }
    func inittext(){
        let statusbar=UIApplication.shared.statusBarFrame
        let sbheight=statusbar.height
        let offset=(self.navigationController?.navigationBar.frame.height)! + sbheight
        let imgview=UIImageView(frame: CGRect(x: 10, y: 10+offset, width: 100, height: 100))
        imgview.image=#imageLiteral(resourceName: "xp.jpeg")
        self.view.addSubview(imgview)
        text=UITextView(frame: CGRect(x: 120, y: offset+10, width: self.view.frame.width-130, height: 300))
        text.font=UIFont.systemFont(ofSize: 24)
        text.delegate=self
        self.view.addSubview(text)
    }
    func initlabel(){
        label=UILabel(frame: CGRect(x: self.view.frame.width-110, y: self.view.frame.height-40, width: 100, height: 40))
        label.text="100"
        label.textColor=UIColor.gray
        label.textAlignment = .right
        self.view.addSubview(label)
    }
    func textViewDidChange(_ textView: UITextView) {
        let count=text.text.characters.count
        label.text="\(100-count)"
        if count==100{
            text.resignFirstResponder()
        }
    }
    @objc func follow(note:Notification){
        
        let dur=note.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as! TimeInterval
        let kbpos=(note.userInfo?[UIKeyboardFrameBeginUserInfoKey]as! NSValue).cgRectValue.origin.y
        UIView.animate(withDuration: dur){
            if kbpos == 465{
                self.label.frame.origin.y=self.view.frame.height - 40
            }
                else{
                self.label.frame.origin.y=425
                }
            }
        }
    }



