//
//  ViewController.swift
//  Magic 8 Ball
//
//  Created by Hrithvik  Alex on 2018-02-09.
//  Copyright © 2018 Hrithvik  Alex. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let ballArray = ["ball1", "ball2", "ball3", "ball4", "ball5"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newBallImage()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var imageView: UIImageView!
    
    
    
    @IBAction func askButtonPressed(_ sender: UIButton) {
        newBallImage()
    }
    
    func newBallImage() {
        let randomBallNumber = Int(arc4random_uniform(5))
        imageView.image = UIImage(named: ballArray[randomBallNumber])
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        newBallImage()
    }
}

