//
//  NotesView.swift
//  Death Note
//
//  Created by Efekan Güvendik on 21.03.2024.
//

import UIKit
import SwiftUI


class NotesView: UIView{

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        
        backgroundColor = .darkGray
    }
}
