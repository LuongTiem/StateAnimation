//
//  StateAnimation.swift
//  StatesAnimation
//
//  Created by ReasonAmu on 6/7/17.
//  Copyright © 2017 ReasonAmu. All rights reserved.
//

import UIKit

class StateAnimation: UIView,CAAnimationDelegate {
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
    
    
    let left : UIImageView = UIImageView(image: #imageLiteral(resourceName: "Left_Foot.png"))
    let right: UIImageView = UIImageView(image: #imageLiteral(resourceName: "Right_Foot.png"))
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupUI()
    }
    
    
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        
    }
    
    
    
    //MARK: SetupUI
    
    func setupUI () {
        
        self.addSubview(left)
        left.translatesAutoresizingMaskIntoConstraints = false
        left.contentMode = .scaleAspectFit
        left.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        left.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        left.heightAnchor.constraint(equalToConstant: self.bounds.height/3).isActive = true
        left.widthAnchor.constraint(equalTo: self.left.heightAnchor, multiplier: 2/3).isActive = true
        
        
        self.addSubview(right)
        right.translatesAutoresizingMaskIntoConstraints = false
        right.contentMode = .scaleAspectFit
        right.leftAnchor.constraint(equalTo: self.left.rightAnchor, constant: 0).isActive = true
        right.topAnchor.constraint(equalTo: self.left.centerYAnchor, constant: 0).isActive = true
        right.widthAnchor.constraint(equalTo: self.left.widthAnchor).isActive = true
        right.heightAnchor.constraint(equalTo: self.left.heightAnchor).isActive = true
        
        
        startAnimation()
    }
    
    
    
    func startAnimation() {
        
        self.right.layer.add(self.animationRight(), forKey: "Right")
        
        self.left.layer.add(self.animationLeft(), forKey: "Left")
        
        
    }
    
    func stopAnimation() {
        
        self.left.layer.removeAllAnimations()
        self.right.layer.removeAllAnimations()
    }
    
    
    
    // setup animation
    func animationLeft () -> CAAnimationGroup {
        
        let position = CABasicAnimation(keyPath: "position.y")
        position.duration = 1.5
        position.fromValue = 0
        position.toValue = self.bounds.height
        
        
        let opacity = CABasicAnimation(keyPath: "opacity")
        opacity.duration = 1.5
        opacity.fromValue = 0.0
        opacity.toValue = 1
        
        
        let group = CAAnimationGroup()
        group.duration = 1.5
        group.repeatCount = HUGE
        group.animations = [opacity,position]
        group.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
        group.beginTime = 0.3
        group.timeOffset = 0.5
        
        
        return group
    }
    
    
    func animationRight () -> CAAnimationGroup {
        
        
        let position = CABasicAnimation(keyPath: "position.y")
        position.fromValue = 0
        position.toValue = self.bounds.height
        position.duration = 1.5
        
        
        
        let opacity = CABasicAnimation(keyPath: "opacity")
        opacity.fromValue = 0.0
        opacity.toValue = 1.0
        opacity.duration = 1.5
        
        
        let group = CAAnimationGroup()
        group.duration = 1.5
        group.animations = [position, opacity]
        group.repeatCount = HUGE
        group.speed = 1
        group.beginTime = animationLeft().timeOffset
        //            animationLeft().timeOffset
        
        
        return group
    }
    
    
    
    
    func createCADisplayLink () {
        
        let displaylink = CADisplayLink(target: self, selector: #selector(startAnimation))
        displaylink.add(to: RunLoop.current, forMode: .defaultRunLoopMode)
    }
}
