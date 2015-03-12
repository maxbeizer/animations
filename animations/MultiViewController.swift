//
//  MultiViewController.swift
//  animations
//
//  Created by Max Beizer on 3/11/15.
//  Copyright (c) 2015 Max Beizer. All rights reserved.
//

import UIKit

class MultiViewController: UIViewController {

  @IBOutlet weak var passwordTextField: UITextField!
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      
      let barButtonItem = UIBarButtonItem(title: "Start", style: UIBarButtonItemStyle.Bordered, target: self, action: "startAnimation")
      
      navigationItem.rightBarButtonItem = barButtonItem
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

  func startAnimation() {
    let animation = CAKeyframeAnimation()
    animation.keyPath = "position.x"
    animation.values = [0, 10, -10, 10, 0]
    animation.keyTimes = [0, 0.25, 0.5, 0.75, 1]
    animation.duration = 0.4
    animation.additive = true
    
    passwordTextField.layer.addAnimation(animation, forKey: "shake")
  }
}
