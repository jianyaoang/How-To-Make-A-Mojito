//
//  ViewController.swift
//  HowToMakeMojito
//
//  Created by VLT Labs on 9/11/15.
//  Copyright (c) 2015 JayAng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var stepsToMakeMojito = "1. Get your ingredients -Mint leaves -Limes -Rum -Ice -Soda -Sugar;     2.Add mint, 2 teaspoons sugar, and lime juice to the glass; 3. Press the round end of a muddler into the glass and gently twist several times; 4.Add 2 jiggers (3 oz or 88 ml) of rum.; 5. Add ice cubes and top with Soda"
    
    @IBOutlet var instructionLabel: UILabel! {
        didSet {
            
            instructionLabel.text = ""
            instructionLabel.font = UIFont(name: "Helvetica", size: 20)
            instructionLabel.numberOfLines = 0
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        configureGradientBackground()
        animateInstructionLabelText(stepsToMakeMojito)
        
    }

    func configureGradientBackground() {
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        gradient.colors = [UIColor(red: 0.11, green: 0.60, blue: 0.42, alpha: 1).CGColor,
                           UIColor(red: 0.57, green: 0.98, blue: 0.73, alpha: 1).CGColor]
        gradient.mask = instructionLabel.layer; //making instruction label non-transparent content to mask the gradient layer
        self.view.layer.addSublayer(gradient)
    }
    
    func animateInstructionLabelText(instructionText: String) {
        
        let characterCount = count(instructionText)
        
        if characterCount > 0 {
            instructionLabel.text = "\(instructionLabel.text!)\(instructionText.substringToIndex(instructionText.startIndex.successor()))"
            
            let delay = 0.05 * Double(NSEC_PER_SEC)
            let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
            dispatch_after(time, dispatch_get_main_queue()) {
                
                self.animateInstructionLabelText(instructionText.substringFromIndex(instructionText.startIndex.successor()))
                
            }
        }
    }
}

