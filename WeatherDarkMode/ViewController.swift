//
//  ViewController.swift
//  WeatherDarkMode
//
//  Created by admin on 2020-05-01.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let networkManager = WeatherNetworkManager()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "Friday, May 02, 2020"
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let locationLabel: UILabel = {
        let label = UILabel()
        label.text = "Seattle, US"
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 40)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let tempLabel: UILabel = {
        let label = UILabel()
        label.text = "10.7C"
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 60)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let conditionImageView: UIImageView = {
        let imageview = UIImageView()
        imageview.backgroundColor = .green
        imageview.translatesAutoresizingMaskIntoConstraints = false
        return imageview
    }()
    
    let conditionLabel: UILabel = {
        let label = UILabel()
        label.text = "Moderate Rain"
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let highLabel: UILabel = {
        let label = UILabel()
        label.text = "High: 12.3C"
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let lowLabel: UILabel = {
        let label = UILabel()
        label.text = "Low: 9.1C"
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var addButton: UIButton = {
        let button = UIButton()
        button.setTitle("+", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        button.contentVerticalAlignment = .center
        button.contentHorizontalAlignment = .center
        button.titleLabel?.baselineAdjustment = .alignCenters
        button.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        roundButtonCorners()
    }
    
    fileprivate func setupViews() {
        setupBackgroundView()
        setupDateLabel()
        setupLocationLabel()
        setupTempLabel()
        setupConditionImageView()
        setupConditionaLabel()
        setupHighLowLabel()
        setupAddButton()
    }
    
    fileprivate func setupBackgroundView() {
        view.backgroundColor = .black
    }

    fileprivate func setupDateLabel() {
        view.addSubview(dateLabel)
        NSLayoutConstraint.activate([
            dateLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            dateLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            dateLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100)
        
        ])
    }
    
    fileprivate func setupLocationLabel() {
        view.addSubview(locationLabel)
        NSLayoutConstraint.activate([
            locationLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            locationLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            locationLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 10)
        
        ])
    }
    
    fileprivate func setupTempLabel() {
        view.addSubview(tempLabel)
        NSLayoutConstraint.activate([
            tempLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            tempLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tempLabel.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 50)
        
        ])
    }
    
    fileprivate func setupConditionImageView() {
        view.addSubview(conditionImageView)
        NSLayoutConstraint.activate([
            conditionImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.12),
            conditionImageView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.12),
            conditionImageView.leftAnchor.constraint(equalTo: tempLabel.leftAnchor),
            conditionImageView.topAnchor.constraint(equalTo: tempLabel.bottomAnchor, constant: 10)
        ])
    }
    
    fileprivate func setupConditionaLabel() {
        view.addSubview(conditionLabel)
        NSLayoutConstraint.activate([
            conditionLabel.centerYAnchor.constraint(equalTo: conditionImageView.centerYAnchor),
            conditionLabel.leftAnchor.constraint(equalTo: conditionImageView.rightAnchor, constant: 10)
        ])
    }
    
    fileprivate func setupHighLowLabel() {
        view.addSubview(highLabel)
        view.addSubview(lowLabel)
        NSLayoutConstraint.activate([
            highLabel.leftAnchor.constraint(equalTo: conditionImageView.leftAnchor),
            highLabel.topAnchor.constraint(equalTo: conditionImageView.bottomAnchor, constant: 50),
            lowLabel.leftAnchor.constraint(equalTo: conditionImageView.leftAnchor),
            lowLabel.topAnchor.constraint(equalTo: highLabel.bottomAnchor)
        ])
    }
    
    fileprivate func setupAddButton() {
        view.addSubview(addButton)
        NSLayoutConstraint.activate([
            addButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.1),
            addButton.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.1),
            addButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            addButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20)
        ])
    }
    
    fileprivate func roundButtonCorners() {
        addButton.layer.cornerRadius = addButton.frame.width/2
        addButton.layer.borderColor = UIColor.white.cgColor
        addButton.layer.borderWidth = 1.0
    }
    
    func loadData() {
        if let city = locationLabel.text {
            networkManager.fetchCurrentWeather(city: city) { (weather) in
                DispatchQueue.main.async {
                    self.tempLabel.text = String(weather.main.temp) + "°C"
                    self.locationLabel.text = "\(weather.name) , \(weather.sys.country)"
                    self.conditionLabel.text = weather.weather[0].weatherDescription
                    self.lowLabel.text = "Min: " + String(weather.main.tempMin) + "°C"
                    self.highLabel.text = "Max: " + String(weather.main.tempMax) + "°C"
                    self.conditionImageView.loadImageFromURL(url: "http://openweathermap.org/img/wn/\(weather.weather[0].icon)@2x.png")

                    UserDefaults.standard.set("\(weather.name)", forKey: "SelectedCity")
                }
            }
        }
    }
    
    @objc func addButtonTapped() {
        
    }
}

let imageCache = NSCache<AnyObject, AnyObject>()
extension UIImageView {
    func loadImageFromURL(url: String) {
        self.image = nil
        guard let URL = URL(string: url) else {
            print("No Image For this url", url)
            return
        }

        if let cachedImage = imageCache.object(forKey: url as AnyObject) as? UIImage {
            self.image = cachedImage
            return
        }

        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: URL) {
                if let image = UIImage(data: data) {
                    let imageTocache = image
                    imageCache.setObject(imageTocache, forKey: url as AnyObject)

                    DispatchQueue.main.async {
                        self?.image = imageTocache
                    }
                }
            }
        }

    }
