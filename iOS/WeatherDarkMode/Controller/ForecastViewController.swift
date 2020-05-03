//
//  ForecastViewController.swift
//  WeatherDarkMode
//
//  Created by admin on 2020-05-02.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class ForecastViewController: UIViewController {
    let networkManager = WeatherNetworkManager()
    let cellID = "forecastCell"
    var list = [List]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    fileprivate func setupCollectionView() {
        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createCompositionalLayout())
        collectionView.register(ForecastCell.self, forCellWithReuseIdentifier: cellID)
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        view.addSubview(collectionView)
    }
    
    func createCompositionalLayout() -> UICollectionViewLayout {
            let layout = UICollectionViewCompositionalLayout { sectionIndex, layoutEnvironment in
                self.createForecastSection()
            }

            let config = UICollectionViewCompositionalLayoutConfiguration()
            layout.configuration = config
            return layout
        }

    func createForecastSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))

       let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
       layoutItem.contentInsets = NSDirectionalEdgeInsets(top:5, leading: 5, bottom: 0, trailing: 5)

       let layoutGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(110))
       let layoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: layoutGroupSize, subitems: [layoutItem])

       let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
      // layoutSection.orthogonalScrollingBehavior = .groupPagingCentered
       return layoutSection
    }
    
    func loadData(city: String) {
        networkManager.fetchNextFiveWeatherForecast(city: city) { (forecast) in
            DispatchQueue.main.async {
                self.list = forecast.list
            }
        }
    }
}

extension ForecastViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! ForecastCell
       
       return cell
    }
    
    
}
