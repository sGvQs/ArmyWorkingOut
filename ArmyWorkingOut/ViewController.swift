//
//  ViewController.swift
//  ArmyWorkingOut
//
//  Created by Susumu Goto on 2022/03/18.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
        }
        
    @IBAction func pushButton(_ sender: UIButton) {
        animateView(sender)
    }

        
    func animateView(_ viewToAnimate:UIView) {
            UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseIn, animations: {
                viewToAnimate.transform = CGAffineTransform(scaleX: 1.08, y: 1.08)
            }) { (_) in
                UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 10, options: .curveEaseOut, animations: {
                    viewToAnimate.transform = .identity
                    
                }, completion: nil)
            }
        }
}

