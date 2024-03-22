//
//  ViewController.swift
//  Death Note
//
//  Created by Efekan Güvendik on 6.02.2024.


import UIKit
import SwiftUI

class HomeViewController: UIViewController {
    
    private var homeView = HomeView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeView = HomeView(frame: view.bounds)
        view.addSubview(homeView)
       setupController()
    }
    private func setupController() {
        title = "Home"
        navigationController?.navigationBar.tintColor = .systemRed
        homeView.addbutton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
    }
    @objc func addButtonTapped(){
        let VC = NotesViewController()
        navigationController?.pushViewController(VC, animated: true)
    }
    
    
}



