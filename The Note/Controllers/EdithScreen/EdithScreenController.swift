//
//  EdithScreen.swift
//  The Note 
//
//  Created by Efekan Güvendik on 12.04.2024.
//

import UIKit
import CoreData

class EdithScreenController : UIViewController{
    
    private var edithScreen = EdithScreenView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        edithScreenSetupController()
    }
    func edithScreenSetupController(){
        edithScreen = EdithScreenView(frame: view.bounds)
        self.view.addSubview(edithScreen)
    }
}
