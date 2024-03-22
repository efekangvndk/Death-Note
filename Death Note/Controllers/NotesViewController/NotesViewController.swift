//
//  NotesViewController.swift
//  Death Note
//
//  Created by Efekan Güvendik on 22.03.2024.
//

import UIKit
import CoreData
import SwiftUI

class NotesViewController : UICollectionViewController{
    
    var notesView = NotesView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setupController() {
        notesView = NotesView(frame: view.bounds)       //    Ekranın tanımladık ve tam ölçeklendirdik. 
        self.view.addSubview(notesView)
    }
}
