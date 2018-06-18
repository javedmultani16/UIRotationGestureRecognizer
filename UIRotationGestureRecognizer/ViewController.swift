//
//  ViewController.swift
//  UIRotationGestureRecognizer
//  Copyright © 2018 MyCompany. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var viewRotate: UIView!
    
    var rotateGesture = UIRotationGestureRecognizer()
    var lastRotation = CGFloat()
 
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        rotateGesture = UIRotationGestureRecognizer(target: self, action: #selector(self.rotatedView(_:)))
        viewRotate.addGestureRecognizer(rotateGesture)
        viewRotate.isUserInteractionEnabled = true
        viewRotate.isMultipleTouchEnabled = true
     
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc func rotatedView(_ sender: UIRotationGestureRecognizer){
        var lastRotation = CGFloat()
        self.view.bringSubview(toFront: viewRotate)
        if(sender.state == UIGestureRecognizerState.ended){
            lastRotation = 0.0;
        }
        let rotation = 0.0 - (lastRotation - sender.rotation)
        let currentTrans = sender.view?.transform
        let newTrans = currentTrans!.rotated(by: rotation)
        sender.view?.transform = newTrans
        lastRotation = sender.rotation
    }
}

