//
//  EdithScreen.swift
//  The Note 
//
//  Created by Efekan Güvendik on 12.04.2024.
//

import UIKit
import CoreData
import SwiftUI

class EdithViewController : UIViewController{
    
    var noteTitle : String?
    var noteText : String?
    
    private var edithScreen = EdithView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupController()
        
    }
    
    
    func setupController(){
        edithScreen = EdithView(frame: view.bounds)
        self.view.addSubview(edithScreen)
        
        
    }
    
    
}
