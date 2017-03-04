//
//  ViewController.swift
//  Timer
//
//  Created by Kimiko Motoyama on 2017/03/04.
//  Copyright © 2017 Kimiko Motoyama. All rights reserved.
//

import UIKit
import AudioToolbox

class ViewController: UIViewController {
    var timer: Timer?
    var currentSeconds = 0
    
    @IBOutlet weak var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tenSecButtonTapped(_ sender: UIButton) {
        start(seconds: 10)
    }

    @IBAction func threeMinButtonTapped(_ sender: UIButton) {
        start(seconds: 180)
    }
    
    @IBAction func fiveMinButtonTapped(_ sender: UIButton) {
        start(seconds: 300)
    }
    
    func start(seconds: Int){
        currentSeconds = seconds
        label.text = "残り\(currentSeconds)"
        timer = Timer.scheduledTimer(timeInterval: 1.0,
                                     target: self,
                                     selector: #selector(ViewController.update),
                                     userInfo: nil,
                                     repeats: true)
    }
    
    func update(){
        currentSeconds -= 1
        label.text = "残り\(currentSeconds)"
        if currentSeconds == 0 {
            timer?.invalidate()
            let soundID: SystemSoundID = 1005
            AudioServicesPlayAlertSound(soundID)
        }
    }
}

