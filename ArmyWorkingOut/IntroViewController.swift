//
//  IntroViewController.swift
//  ArmyWorkingOut
//
//  Created by Susumu Goto on 2022/04/02.
//

import UIKit

class IntroViewController: UIViewController {
        
       lazy var logoImage: UIImageView = {
            
            let image = UIImage(named: "soldier")!
            
            let imageView = UIImageView(image: image)
            
            imageView.layer.masksToBounds = true
            
            return imageView
        
        }()
        
        @IBOutlet weak var loginButton: UIButton!
    
        @IBOutlet weak var workoutLabel: UILabel!
    
        @IBOutlet weak var loginView: UIView!
        
        var moveLogoAnimator: UIViewPropertyAnimator!
        
       
        override func viewDidLoad() {
            super.viewDidLoad()
            
            logoImage.translatesAutoresizingMaskIntoConstraints = false
            
            loginView.addSubview(logoImage)
            
            NSLayoutConstraint.activate([
            
                logoImage.centerXAnchor.constraint(equalTo: loginView.centerXAnchor),
                logoImage.centerYAnchor.constraint(equalTo: loginView.centerYAnchor),
                logoImage.heightAnchor.constraint(equalToConstant: CGFloat(100.0)),
                logoImage.widthAnchor.constraint(equalToConstant: CGFloat(100.0))
                
            ])
            
            loginView.transform = CGAffineTransform(scaleX: 0, y: 0)
            
            loginButton.alpha = CGFloat(0)
            
            workoutLabel.alpha = CGFloat(0)
            
            loginView.backgroundColor = UIColor(red: 5, green: 5, blue: 5, alpha: 1)
            
        }
        
        override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
            
            loginView.layer.cornerRadius = CGFloat(7.0)
            
            loginButton.layer.cornerRadius = CGFloat(5.0)
            
            logoImage.layer.cornerRadius = CGFloat(50.0)
            
        }
        
        override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
            
            UIView.animate(withDuration: 0.8, delay: 1, usingSpringWithDamping: 0.5, initialSpringVelocity: 2, options: .curveEaseOut, animations: {
                
                self.loginView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                
            }) { (success) in
                
                self.setupMoveLogoAnimation()
                
                self.moveLogoAnimator.startAnimation()
                
            }
            
        }

        func setupMoveLogoAnimation() {
            
            moveLogoAnimator = UIViewPropertyAnimator(duration: 2.0, curve: .easeIn, animations: nil)
            
            moveLogoAnimator.addAnimations({
                
                self.logoImage.frame.origin.y = CGFloat(70.0)
                
                self.loginView.backgroundColor = UIColor.white
                
            }, delayFactor: 0.2)
            
            moveLogoAnimator.addAnimations({
                
                self.loginButton.alpha = 1.0
                
            }, delayFactor: 0.6)
            
            moveLogoAnimator.addAnimations({
                
                self.workoutLabel.alpha = 1.0
                
            }, delayFactor: 0.5)
            
        }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
