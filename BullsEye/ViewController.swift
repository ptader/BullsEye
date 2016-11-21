//
//  ViewController.swift
//  BullsEye
//
//  Created by Paul Tader on 11/16/16.
//  Copyright © 2016 CircleTee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  var currentValue = 0
  var targetValue = 0
  var score = 0
  var round = 0
  
  @IBOutlet weak var slider: UISlider!
  @IBOutlet weak var targetLabel: UILabel!
  @IBOutlet weak var scoreLabel: UILabel!
  @IBOutlet weak var roundLabel: UILabel!
  @IBOutlet weak var startOverButton: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    startNewRound()
    updateLabels()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  func startNewRound(){
    targetValue = 1 + Int(arc4random_uniform(100))
    currentValue = 50
    round += 1
    slider.value = Float(currentValue) // UISlider is type float.
  }
  
  
  
  func updateLabels(){
    targetLabel.text = String(targetValue)
    scoreLabel.text = String(score)
    roundLabel.text = String(round)
  }
  
  @IBAction func showAlert(){
    let difference = abs(targetValue - currentValue)
    var points = 100 - difference
    score += points
    
    let title: String
    if difference == 0 {
      title = "Perfect! \n 100 bonus points!"
      points += 100
    } else if difference == 1 {
      title = "Missed it by 1! \n 50 bonus points!"
      points += 50
    } else if difference < 5 {
      title = "You almost did it!"
    } else if difference < 10 {
      title = "Pretty good"
    } else {
      title = "Not even close..."
    }
    
    let message = "You scored \(points) points"
    
    let alert = UIAlertController(title: title,
                                  message: message,
                                  preferredStyle: .alert)
    
    let action = UIAlertAction(title: "Ok", style: .default,
                               handler: { action in
                                          self.startNewRound()
                                          self.updateLabels() })
    
    alert.addAction(action)
    present(alert, animated: true, completion: nil)
  }
  
  @IBAction func sliderMoved(_ slider: UISlider) {
    currentValue = lroundf(slider.value)
  }

}

