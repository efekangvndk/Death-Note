//
//  ViewController.swift
//  Death Note
//
//  Created by Efekan Güvendik on 6.02.2024.

///Buton işlevi diğer sayfa, coredata ya safe ve collections view .

import UIKit
import SwiftUI

class HomeViewController: UIViewController {
    
    private var homeView = HomeView()
    let addbutton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeView = HomeView(frame: view.bounds)
        view.addSubview(homeView)
        title = "Home"
        navigationController?.navigationBar.tintColor = .systemRed
    }
}



