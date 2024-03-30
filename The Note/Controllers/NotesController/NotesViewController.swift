//
//  NotesViewController.swift
//  Death Note
//
//  Created by Efekan Güvendik on 22.03.2024.
//

import UIKit
import CoreData
import SwiftUI

class NotesViewController : UIViewController{
    
    private var notesView = NotesView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupController()
    }
    
    func setupController() {
        notesView = NotesView(frame: view.bounds)       //    Ekranın tanımladık ve tam ölçeklendirdik.
        notesView.saveButton.addTarget(self, action: #selector(didTapButtonForSave), for: .touchUpInside)
        self.view.addSubview(notesView)
    }
    @objc func didTapButtonForSave(){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return}
        let managedContext = appDelegate.persistentContainer.viewContext
        if let entity = NSEntityDescription.entity(forEntityName: "Nots", in: managedContext){
            let not = NSManagedObject(entity: entity, insertInto: managedContext)
            not.setValue(notesView.noteTextView.text, forKey: "nots")
            do{
                
                try managedContext.save() // Kodu Save işlemi yapmak için unwrap yapıda do try cath ile save işlemi yapılıyor.
                print("save successful")
            }catch let error as NSError{
                print("Save Failed \(error), \(error.userInfo)")
            }
        } else {
            print("Entity bulunamadı")
        }
    }
}
