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
        label.text = "Date"
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let locationLabel: UILabel = {
        let label = UILabel()
        label.text = "Location"
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 40)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let tempLabel: UILabel = {
        let label = UILabel()
        label.text = "Temp"
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 60)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let conditionImageView: UIImageView = {
        let imageview = UIImageView()
        imageview.translatesAutoresizingMaskIntoConstraints = false
        return imageview
    }()
    
    let conditionLabel: UILabel = {
        let label = UILabel()
        label.text = "Condition"
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let highLabel: UILabel = {
        let label = UILabel()
        label.text = "High of?"
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let lowLabel: UILabel = {
        let label = UILabel()
        label.text = "Low of?"
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
        setupTap()
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
    
    fileprivate func setupTap() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(changeBackground))
        tap.numberOfTapsRequired = 1
        view.addGestureRecognizer(tap)
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
            addButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
            addButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30)
        ])
    }
    
    fileprivate func roundButtonCorners() {
        addButton.layer.cornerRadius = addButton.frame.width/2
        addButton.layer.borderColor = UIColor.white.cgColor
        addButton.layer.borderWidth = 1.0
    }
    
    func loadData(city: String) {
        networkManager.fetchCurrentWeather(city: city) { (weather) in
            DispatchQueue.main.async {
                let formatter = DateFormatter()
                formatter.dateFormat = "dd MMM yyyy" //yyyy
                let stringDate = formatter.string(from: Date(timeIntervalSince1970: TimeInterval(weather.dt)))
                self.dateLabel.text = stringDate
                
                self.tempLabel.text = "\(Int(weather.main.temp - 273.15)) °C"
                self.locationLabel.text = "\(weather.name) , \(weather.sys.country)"
                self.conditionLabel.text = weather.weather[0].weatherDescription
                self.lowLabel.text = "Min: \(Int(weather.main.tempMin - 273.15)) °C"
                self.highLabel.text = "Max: \(Int(weather.main.tempMax - 273.15)) °C"
                self.conditionImageView.loadImageFromURL(url: "https://openweathermap.org/img/wn/\(weather.weather[0].icon)@2x.png")

                UserDefaults.standard.set("\(weather.name)", forKey: "SelectedCity")
            }
        }
    }
    
    @objc func addButtonTapped() {
        let alertController = UIAlertController(title: "Add City", message: "", preferredStyle: .alert)
         alertController.addTextField { (textField : UITextField!) -> Void in
             textField.placeholder = "City Name"
         }
         let saveAction = UIAlertAction(title: "Add", style: .default, handler: { alert -> Void in
             let firstTextField = alertController.textFields![0] as UITextField
            print("City Name: \(String(describing: firstTextField.text))")
            guard let cityname = firstTextField.text else { return }
            self.loadData(city: cityname) // Calling the loadData function
         })
         let cancelAction = UIAlertAction(title: "Cancel", style: .destructive, handler: { (action : UIAlertAction!) -> Void in
            print("Cancel")
         })


         alertController.addAction(saveAction)
         alertController.addAction(cancelAction)

         self.present(alertController, animated: true, completion: nil)
    }
    
    @objc func changeBackground() {
        let randomRed = CGFloat.random(in: 0.1...0.7)
        let randomGreen = CGFloat.random(in: 0.1...0.7)
        let randomBlue = CGFloat.random(in: 0.1...0.7)
        let backgroundColor = UIColor.init(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1)
        UIView.animate(withDuration: 0.3) {
            self.view.backgroundColor = backgroundColor
        }
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
}

    var preferredStatusBarStyle: UIStatusBarStyle {
      return .lightContent
}
