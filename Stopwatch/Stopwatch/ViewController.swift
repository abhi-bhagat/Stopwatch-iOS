//
//  ViewController.swift
//  Stopwatch
//
//  Created by Abhi on 2019-04-08.
//  Copyright © 2019 abhi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var playbutton: UIButton!
    
    @IBOutlet weak var resetbutton: UIButton!
    @IBOutlet weak var pausebutton: UIButton!
    @IBOutlet weak var titlelabel: UILabel!
    
    var timer = Timer()
    
    var counter = 0.0
    var reset = 0.0
    
    var isRunning = false
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        titlelabel.text = "\(counter)"
        playbutton.isEnabled = true
        
        pausebutton.isEnabled = false
        
        resetbutton.isEnabled = false
        
        
    }

    @IBAction func btnreset(_ sender: UIButton) {
        playbutton.isEnabled = true
        
        pausebutton.isEnabled = false
        resetbutton.isEnabled = false
        
        timer.invalidate()
        
        titlelabel.text = "\(reset)"
        
        counter = 0.0
        
        isRunning = false
    }
    
    @IBAction func btnplay(_ sender: UIButton) {
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(UpdateTimer), userInfo: nil, repeats: true)
        
        
        playbutton.isEnabled = false
        
        pausebutton.isEnabled = true
        
        resetbutton.isEnabled = true
        
        isRunning = true
    }
    
    
    @objc func UpdateTimer(){
        counter += 0.1
        titlelabel.text = String(format: "%.1f", counter)
    }
    @IBAction func btnpause(_ sender: UIButton) {
        playbutton.isEnabled = true
        pausebutton.isEnabled = false
        resetbutton.isEnabled = true
        
        timer.invalidate()
        
        isRunning = false
    }
}

