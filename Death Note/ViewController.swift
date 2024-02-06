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
        
        
        /// VARS------------------
        let baslikLabel = UILabel()
        let addButton = UIButton(type: .system)
        
        /// LABEL SETTİNGS---------
        baslikLabel.text = "DEATH NOTE"
        baslikLabel.textAlignment = .center
        baslikLabel.font = UIFont.systemFont(ofSize: 35)
        baslikLabel.frame = CGRect(x: 100 , y:100, width: 300, height: 300)
        baslikLabel.center = CGPoint(x: view.frame.size.width / 2, y: 100)
        baslikLabel.textColor = .black
        
        
        /// OTHERS SETTİNGS--------
        let setImage = UIImage.SymbolConfiguration(pointSize: 40,weight: .medium)
        let addImage = UIImage(systemName: "plus.app", withConfiguration: setImage)
        addButton.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        addButton.center = CGPoint(x: 385, y: 800)
        addButton.setImage(addImage, for: .normal)
        addButton.tintColor = .black
        
        
        /// ADD TO VİEW-------------
        self.view.addSubview(baslikLabel)
        self.view.addSubview(addButton)
        
    }


}

