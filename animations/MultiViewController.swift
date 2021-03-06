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
  
  let shakeAnimation:CAKeyframeAnimation = {
    let animation = CAKeyframeAnimation()
    animation.keyPath = "position.x"
    animation.values = [0, 10, -10, 10, 0]
    animation.keyTimes = [0, 0.25, 0.5, 0.75, 1]
    animation.duration = 0.4
    animation.additive = true
    return animation
  }()
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      
      let barButtonItem = UIBarButtonItem(title: "Validate", style: UIBarButtonItemStyle.Bordered, target: self, action: "validatePassword")
      
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
    let slowAnimation = shakeAnimation.copy() as CAKeyframeAnimation
    slowAnimation.duration = 2 // override the value of our abstracted motion
    passwordTextField.layer.addAnimation(slowAnimation, forKey: "shake")
  }
  
  func validatePassword() {
    if passwordTextField.text.lengthOfBytesUsingEncoding(NSUTF8StringEncoding) < 6 {
      startAnimation()
    }
    else {
      let alertController = UIAlertController(title: "Awesome!", message: "so valid", preferredStyle: UIAlertControllerStyle.Alert)
      
      let alertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: {(action) -> Void in
        println("alertAction")
      })
    
      alertController.addAction(alertAction)
      
      self.presentViewController(alertController, animated: true, completion: nil)
    }
  }
}
