//
//  SecondViewController.swift
//  SlideshowApp
//
//  Created by yasuhito on 2016/07/14.
//  Copyright © 2016年 yasuhito.nagata. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var zoomView: UIImageView!
    var num = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if num == 0 {
            let image = UIImage(named: "image1.JPG")
            zoomView.transform = CGAffineTransformMakeScale(1.5, 1.5)
            zoomView.image = image
        } else if num == 1 {
            let image = UIImage(named: "image2.JPG")
            zoomView.transform = CGAffineTransformMakeScale(1.5, 1.5)
            zoomView.image = image
        } else if num == 2 {
            let image = UIImage(named: "image3.JPG")
            zoomView.transform = CGAffineTransformMakeScale(1.5, 1.5)
            zoomView.image = image
        }
    }
    
    func zoomRectForScale(scale:CGFloat, center: CGPoint) -> CGRect{
        var zoomRect: CGRect = CGRect()
         zoomRect.origin.x = center.x - zoomRect.size.width / 2.0
         zoomRect.origin.y = center.y - zoomRect.size.height / 2.0
        
        return zoomRect
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
