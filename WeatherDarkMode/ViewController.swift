//
//  ViewController.swift
//  WeatherDarkMode
//
//  Created by admin on 2020-05-01.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "Friday, May 02, 2020"
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackgroundView()
        setupViews()
    }
    
    fileprivate func setupBackgroundView() {
        view.backgroundColor = .black
    }
    
    fileprivate func setupViews() {
        setupDateLabel()
    }

    fileprivate func setupDateLabel() {
        view.addSubview(dateLabel)
        NSLayoutConstraint.activate([
            dateLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            dateLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            dateLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100)
        
        ])
    }
    

}

