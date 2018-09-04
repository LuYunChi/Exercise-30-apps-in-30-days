//
//  ViewController.swift
//  7.SimplePhotoBrowser
//
//  Created by Lu Yunchi on 2018/9/4.
//  Copyright © 2018年 Lu Yunchi. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate {
    var image:UIImageView!
    var scroll:UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        image=UIImageView(frame: self.view.bounds)
        image.image=#imageLiteral(resourceName: "xp.jpeg")
        image.isUserInteractionEnabled=true
        
        scroll=UIScrollView(frame:self.view.bounds)
        scroll.backgroundColor=UIColor.black
        scroll.maximumZoomScale=2
        scroll.minimumZoomScale=1
        scroll.contentSize=image.bounds.size
        scroll.delegate=self
        scroll.addSubview(image)
        self.view.addSubview(scroll)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return image
    }
}

