//
//  ViewController.swift
//  SlideshowApp
//
//  Created by yasuhito on 2016/07/13.
//  Copyright © 2016年 yasuhito.nagata. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    
    var timer: NSTimer? = nil
    
    var dispImageNo = 0
    
    func displayImage() {
        let imageNameArray = [
            "image1.JPG",
            "image2.JPG",
            "image3.JPG"
        ]
        
        if dispImageNo < 0 {
            dispImageNo = 2
        }
        if dispImageNo > 2 {
            dispImageNo = 0
        }
        let name = imageNameArray[dispImageNo]
        let image = UIImage(named: name)
        imageView.image = image
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image = UIImage(named: "image1.JPG")
        imageView.image = image
       
        timer = NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: #selector(ViewController.onTimer), userInfo: nil, repeats: true)
        
    }
    
    func onTimer(timer: NSTimer) {
        if isPlay == false && y == 0 {
            dispImageNo += 1
            displayImage()
        }
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tapPlayButton(sender: AnyObject) {
        isPlay = !isPlay
        
        if isPlay == false {
            backButton.enabled = false
            nextButton.enabled = false
        } else {
            backButton.enabled = true
            nextButton.enabled = true
        }

    }
    
    @IBAction func touchNextButton(sender: AnyObject) {
        dispImageNo += 1
        displayImage()
    }
    @IBAction func touchBackButton(sender: AnyObject) {
        dispImageNo -= 1
        displayImage()
            }
    
    var y = 0
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let targetViewController = self.storyboard!.instantiateViewControllerWithIdentifier( "target" ) 
        self.presentViewController( targetViewController, animated: true, completion: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
        
        if segue.identifier == "SecondView" {
            let secondViewController:SecondViewController = segue.destinationViewController as! SecondViewController
            secondViewController.num = dispImageNo
        }
        
        
    /*let secondViewController:SecondViewController = segue.destinationViewController as! SecondViewController
        
            secondViewController.num = dispImageNo*/
        
          }
        @IBAction func touchButton(sender: AnyObject) {
            y = 1
        }
        @IBAction func unwind(segue: UIStoryboardSegue) {
            y = 0
        }
    var isPlay: Bool = true {
        didSet {
            if isPlay {
                playButton.setTitle("再生", forState: .Normal)
                            } else {
                playButton.setTitle("停止", forState: .Normal)
            }
        }
    }

        

}
    
    
