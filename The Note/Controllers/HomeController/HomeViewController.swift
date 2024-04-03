//
//  ViewController.swift
//  Death Note
//
//  Created by Efekan Güvendik on 6.02.2024.


import UIKit
import SwiftUI
import CoreData

class HomeViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {
    
    var homeViewController = HomeView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeViewController = HomeView(frame: view.bounds)
        view.addSubview(homeViewController)
        setupController()
    }
    private func setupController() {
        title = "Home"
        navigationController?.navigationBar.tintColor = .systemRed
        homeViewController.addbutton.addTarget(self, action: #selector(addButtonDown), for: .touchDown)
        homeViewController.addbutton.addTarget(self, action: #selector(addButtonUp), for: [.touchUpInside , .touchUpOutside])
        homeViewController.tableView.delegate = self
        homeViewController.tableView.dataSource = self
        getData()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(getData), name: NSNotification.Name(rawValue:"NewText"), object: nil)
    }
    
   @objc func getData(){
        
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let context = appDelegate?.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Nots")
        fetchRequest.returnsObjectsAsFaults = false
        
        do {
            if let context = context{
                let results = try context.fetch(fetchRequest)
                for result in results as! [NSManagedObject]{
                    if let nots = result.value(forKey: "nots") as? String{
                        homeViewController.nots.append(nots)
                    }
                }
            }else{
                print("Error")
            }
            homeViewController.tableView.reloadData()
        }catch{
            print("Error")
        }
      
    }
    
    
    // MARK: Animasyon ve çağırma, gitme gibi işlemler.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeViewController.nots.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = homeViewController.nots[indexPath.row]
        return cell
    }
    @objc func addButtonDown(){
        UIView.animate(withDuration: 0.2 ){
            self.homeViewController.addbutton.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        }
        homeViewController.addbutton.alpha = 0.5
        homeViewController.addbutton.backgroundColor = UIColor.black
    }
    @objc func addButtonUp() {
        UIView.animate(withDuration: 0.2) {
            self.homeViewController.addbutton.transform = CGAffineTransform.identity
        }
        homeViewController.addbutton.alpha = 1.0
        homeViewController.addbutton.backgroundColor = UIColor.red
        let VC = NotesViewController()
        navigationController?.pushViewController(VC, animated: true)
    }
    
    
}



