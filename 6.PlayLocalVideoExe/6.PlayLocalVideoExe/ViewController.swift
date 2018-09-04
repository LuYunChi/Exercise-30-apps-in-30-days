//
//  ViewController.swift
//  6.PlayLocalVideoExe
//
//  Created by Lu Yunchi on 2018/9/3.
//  Copyright © 2018年 Lu Yunchi. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit


class ViewController: UIViewController {
    @IBOutlet weak var videobut: UIButton!
    @IBOutlet weak var musicbut1: UIButton!
    @IBOutlet weak var musicbut2: UIButton!
    var musicplayer:AVAudioPlayer!
    var videocontroller=AVPlayerViewController()
    var videoplayer:AVPlayer!
    
    var wid:CGFloat!
    var hei:CGFloat!
    override func viewDidLoad() {
        super.viewDidLoad()
        wid=self.view.frame.width
        hei=self.view.frame.height
        videobut.frame=CGRect(x: 0, y: 0.1*hei, width: 1/3*wid, height: 0.05*hei)
        musicbut1.frame=CGRect(x: 1/3*wid, y: 0.1*hei, width: 1/3*wid, height: 0.05*hei)
        musicbut2.frame=CGRect(x: 2/3*wid, y: 0.1*hei, width: 1/3*wid, height: 0.05*hei)
        initmp()

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func initmp(){
        do{
            let mpath=Bundle.main .path(forResource: "wukong", ofType: "mp3")
            let murl=URL(fileURLWithPath: mpath!)
            try self.musicplayer=AVAudioPlayer(contentsOf: murl)
        }catch{
            musicplayer=nil
        }
    }
    
    
    @IBAction func playv(_ sender: Any) {
        let vpath = Bundle.main.path(forResource: "emojizone", ofType: "mp4")
        let vurl = URL(fileURLWithPath: vpath!)
        //let vurl=URL(string:"https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")
        self.videoplayer=AVPlayer(url: vurl)
        videocontroller.player=videoplayer
        self.present(videocontroller, animated: true){}
    }
    @IBAction func playm(_ sender: Any) {
        musicplayer.play()
    }
    @IBAction func pausem(_ sender: Any) {
        musicplayer.pause()
    }
    

}

