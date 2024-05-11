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

    var chooesingNotes = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupController()
       
        if chooesingNotes != "" { // Eğer seçilen hücre boş ise veya değilse
         
            
        }
    }
    
    @objc func getData() {
        
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let managedContext = appDelegate?.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Nots")
        fetchRequest.predicate = NSPredicate(format: "name = %@ ", self.chooesingNotes)
        fetchRequest.returnsObjectsAsFaults = false

        do {
            let result =  try managedContext?.fetch(fetchRequest)
            
        }catch{
            
        }
    }
    
    func setupController() {
        notesView = NotesView(frame: view.bounds)       // Ekranın tanımladık ve tam ölçeklendirdik.
        notesView.saveButton.addTarget(self, action: #selector(didTapButtonForSave), for: .touchUpInside)
        self.view.addSubview(notesView)
    }
    @objc func didTapButtonForSave(){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        
        if let entity = NSEntityDescription.entity(forEntityName: "Nots", in: managedContext) {
            let note = NSManagedObject(entity: entity, insertInto: managedContext)
            note.setValue(notesView.noteTextField.text, forKey: "title")
            note.setValue(notesView.noteTextView.text, forKey: "nots")

            do {
                try managedContext.save()
                print("save successful")
            } catch let error as NSError {
                print("Save Failed \(error), \(error.userInfo)")
            }
        } else {
            print("Entity bulunamadı")
        }
        
        NotificationCenter.default.post(name: NSNotification.Name("NewDataSaved"), object: nil)
        self.navigationController?.popViewController(animated: true)
    }

   
}
