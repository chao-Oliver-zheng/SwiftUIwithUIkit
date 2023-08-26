//
//  CatListViewController.swift
//  Cats
//
//  Created by Oliver Zheng on 8/22/23.
//

import UIKit
import SwiftUI

class CatViewController: UIViewController {
    let infos: [Info]
    
    
    init(infos: [Info]) {
        self.infos = infos
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI(infos)
        
    }
    
    private func setupUI(_ infoArray: [Info]) {
        view.backgroundColor = .white
        for (idx, subInfo) in infoArray.enumerated() {
            let label = createLabel(subInfo)
            view.addSubview(label)
            NSLayoutConstraint.activate([
                label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
                label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
                label.topAnchor.constraint(equalTo: view.topAnchor, constant: CGFloat(idx * 40) + 10),
                
            ])
        }
    }
    private func createLabel(_ info: Info) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15)
        label.text = "Name: \(info.name), Breed: \(info.breed)"
        label.textAlignment = .left
        return label
    }
}

struct CatViewControllerWrapper: UIViewControllerRepresentable {
    let info: [Info]
    
    func makeUIViewController(context: Context) -> CatViewController {
        return CatViewController(infos: info)
    }
    
    func updateUIViewController(_ uiViewController: CatViewController, context: Context) {
        // Update the view controller if needed
    }
}
