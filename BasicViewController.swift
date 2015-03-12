//
//  BasicViewController.swift
//  animations
//
//  Created by Max Beizer on 3/11/15.
//  Copyright (c) 2015 Max Beizer. All rights reserved.
//

import UIKit

class BasicViewController: UIViewController {
  
  @IBOutlet weak var animationView: UIView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
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
  
  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)
    
    let barButtonItem = UIBarButtonItem(title: "Start", style: UIBarButtonItemStyle.Bordered, target: self, action: "startTimingAnimation")
    
    navigationItem.rightBarButtonItem = barButtonItem
  }
  
  func startFromToAnimation() {
    let animation = CABasicAnimation()
    animation.keyPath = "position.x"
    animation.fromValue = 0
    animation.toValue = 300
    animation.duration = 1
    
    animationView.layer.addAnimation(animation, forKey: "basic")
  }
  
  func startByValueAnimation() {
    let animation = CABasicAnimation()
    animation.keyPath = "position.x"
    let value = view.bounds.size.width - animationView.bounds.size.width
    animation.byValue = value
    animation.duration = 1
    
    animationView.layer.addAnimation(animation, forKey: "basic")
  }
  
  func startTimingAnimation() {
    let animation = CABasicAnimation()
    animation.keyPath = "position.x"
    let value = view.bounds.size.width - animationView.bounds.size.width
    animation.byValue = value
    animation.duration = 1
    animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
    
    animationView.layer.addAnimation(animation, forKey: "basic")
  }
}
