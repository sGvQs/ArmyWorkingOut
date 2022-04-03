//
//  InfoViewController.swift
//  ArmyWorkingOut
//
//  Created by Susumu Goto on 2022/04/03.
//

import UIKit
import Lottie

class InfoViewController: UIViewController {

    var animationView: AnimationView = AnimationView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let animation = Animation.named("push")
        animationView.frame = CGRect(x: 0, y: -220, width: view.frame.size.width, height: view.frame.size.height)
        animationView.animation = animation
        animationView.contentMode = .scaleAspectFit
        animationView.backgroundColor = .clear
        animationView.loopMode = .loop
        animationView.backgroundBehavior = .pauseAndRestore
        view.addSubview(animationView)
        animationView.play()
        
        
        
        
        
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
