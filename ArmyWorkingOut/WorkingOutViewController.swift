//
//  WorkingOutViewController.swift
//  ArmyWorkingOut
//
//  Created by Susumu Goto on 2022/03/18.
//

import UIKit

class WorkingOutViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //start: true, stop: false, reset: false
        buttonEnabled(start: true, stop: false)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        startB.layer.cornerRadius = CGFloat(7.0)
        
        stopB.layer.cornerRadius = CGFloat(7.0)
        
        upDownView.layer.cornerRadius = CGFloat(7.0)
    }
    
    @IBOutlet weak var upDownLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var startB: UIButton!
    @IBOutlet weak var stopB: UIButton!
    @IBOutlet weak var upDownView: UIView!
    
    
    var upDown: Timer!
    var timey = Timer()
    var startTime: TimeInterval? = nil
    
    func buttonEnabled(start: Bool, stop: Bool) {
        self.startB.isEnabled = start
        self.stopB.isEnabled = stop
    }
    
    func animateView(_ viewToAnimate: UIView) {
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseIn, animations: {
                viewToAnimate.transform = CGAffineTransform(scaleX: 1.08, y: 1.08)
            }) { (_) in
                UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 10, options: .curveEaseOut, animations: {
                    viewToAnimate.transform = .identity

                }, completion: nil)
            }
        }
    
    //配列を作成し、そこからランダムに文字列を引っ張りだす
    @objc func intervalUpDown() {
        
        let upDownArray: [String] = ["⇧", "☟", "⇧", "☟", "☟", "☟", "⇧", "☟"]
        
        guard let value = upDownArray.randomElement() else { return }
           upDownLabel.text = value
        
        
            
    }
    
    
    @objc func update() {
        
        if let startTime = self.startTime {
            let t: Double = Date.timeIntervalSinceReferenceDate - startTime
            let min = Int(t / 60)
            let sec = Int(t) % 60
            let msec = Int((t - Double(min * 60) - Double(sec)) * 100.0)
            self.timeLabel.text = String(format: "%02d : %02d : %02d", min, sec, msec)
        }
    }
    
    @IBAction func startButton(_ sender: UIButton) {
        
        //start: false, stop: true, reset: false
        buttonEnabled(start: false, stop: true)
        
      animateView(sender)
        
        upDownLabel.text = "GO"
        
        self.startTime = Date.timeIntervalSinceReferenceDate
        
        self.upDown = Timer.scheduledTimer(timeInterval:2, target:self, selector:#selector(self.intervalUpDown), userInfo:nil, repeats:true)
        
        self.timey = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
    }
    
    @IBAction func stopButton(_ sender: UIButton) {
        
        //start: true, stop: false, reset: true
        buttonEnabled(start: true, stop: false)
        
        animateView(sender)
        
        self.upDown.invalidate()
        self.upDownLabel.text = "well done"
        self.timey.invalidate()
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
