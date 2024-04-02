//
//  CoreDataSave.swift
//  The Note 
//
//  Created by Efekan Güvendik on 2.04.2024.
//

import Foundation
import UIKit
import CoreData

    
private var CoreDataSaved = HomeViewController()
private var AllFile = HomeView()
private var ALLFile = CoreDateSave()



func getData(){
    
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    let context = appDelegate?.persistentContainer.viewContext
    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Nots")
    fetchRequest.returnsObjectsAsFaults = false
    
    do {
        if let context = context{
            let results = try context.fetch(fetchRequest)
            
            for result in results as! [NSManagedObject]{
                if let nots = result.value(forKey: "nots") as? String{
                    AllFile.nots.append(nots)
                }
            }
        }else{
            print("Error")
        }
        
        AllFile.tableView.reloadData()
        
    }catch{
        print("Error")
    }
    
    NotificationCenter.default.post(name: NSNotification.Name("newText"), object: nil)
    
}
