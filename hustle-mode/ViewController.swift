//
//  ViewController.swift
//  hustle-mode
//
//  Created by KHH on 28/7/2019.
//  Copyright © 2019 Kwan Hiu Hong. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var darkBlueBG: UIImageView!
    @IBOutlet weak var powerBtn: UIButton!
    @IBOutlet weak var cloudHolder: UIView!
    @IBOutlet weak var rocket: UIImageView!
    @IBOutlet weak var HustleOnStack: UIStackView!
    @IBOutlet weak var playAgainBtn: UIButton!
    var player: AVAudioPlayer!
    var initialYAxis:CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialYAxis = self.rocket.frame.minY
        let path = Bundle.main.path(forResource: "hustle-on", ofType: "wav")!
        let url = URL(fileURLWithPath: path)
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player.prepareToPlay()
        } catch let error as NSError {
            print(error.description)
        }
    }

    @IBAction func powerBtnPressed(_ sender: Any) {
        cloudHolder.isHidden = false
        darkBlueBG.isHidden = true
        powerBtn.isHidden = true
        
        player.play()
        
        UIView.animate(withDuration: 2.3, animations: {
                self.rocket.frame = CGRect(x: 0, y: 200, width: self.rocket.frame.width, height: 328)
            }) { (finished) in
                self.HustleOnStack.isHidden = false
            }
    }
    @IBAction func palyAgainBtnPressed(_ sender: Any) {
        self.HustleOnStack.isHidden = true
        self.cloudHolder.isHidden = true
        self.darkBlueBG.isHidden = false
        self.powerBtn.isHidden = false
        print ("The initial value is : \(self.initialYAxis)")
        self.rocket.frame = CGRect(x: 0, y: self.initialYAxis, width: self.rocket.frame.width, height: 328)
    }
    
}

