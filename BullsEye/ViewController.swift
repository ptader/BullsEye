//
//  ViewController.swift
//  BullsEye
//
//  Created by Paul Tader on 11/16/16.
//  Copyright © 2016 CircleTee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  var currentValue: Int = 0

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBAction func showAlert(){
    let alert = UIAlertController(title: "Hello, World",
                                  message: "This is the area",
                                  preferredStyle: .alert)
    
    
    let action = UIAlertAction(title: "Awesome", style: .default, handler: nil)
    
    alert.addAction(action)
    present(alert, animated: true, completion: nil)
  }
  
  @IBAction func sliderMoved(_ slider: UISlider) {
    currentValue = lroundf(slider.value)
  }

}

