//
//  BaseVC.swift
//  StatesAnimation
//
//  Created by ReasonAmu on 6/7/17.
//  Copyright © 2017 ReasonAmu. All rights reserved.
//

import UIKit

class BaseVC: UIViewController {
    
    
    @IBOutlet weak var animationView : StateAnimation!

    override func viewDidLoad() {
        super.viewDidLoad()

      
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        animationView.createCADisplayLink()
          NotificationCenter.default.addObserver(self, selector: #selector(reload), name: NSNotification.Name.UIApplicationDidBecomeActive, object: nil)
    }
    
    
    
    func reload() {
        
        animationView.createCADisplayLink()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
}
