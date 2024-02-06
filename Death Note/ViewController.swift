//
//  ViewController.swift
//  Death Note
//
//  Created by Efekan Güvendik on 6.02.2024.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        
        /// LABELS----------------
        let baslikLabel = UILabel()
        
        /// TEXTS-----------------
        baslikLabel.text = "DEATH NOTE"
        baslikLabel.textAlignment = .center
        
        /// SİZE AND LOCATİONS----
        baslikLabel.frame = CGRect(x: 0 , y:0, width: 200, height: 200)
        baslikLabel.center = CGPoint(x: view.frame.size.width / 2, y: 100)
        
        baslikLabel.textColor = .black
        self.view.addSubview(baslikLabel)
        
        // Do any additional setup after loading the view.
    }


}

