//
//  ViewController.swift
//  Turing
//
//  Created by Eduardo Hoyos on 30/09/24.
//

import UIKit

class ViewController: UIViewController {

    var colors: [UIColor] = [.blue, .black, .green, .gray, .lightGray, .yellow, .brown, .cyan, .magenta, .orange, .red]
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
 
    func setupCollectionView(){
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        collectionView.frame = self.view.frame
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        view.addSubview(collectionView)
    }

    private func createLayout() -> UICollectionViewLayout {
        let item7 = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                                              heightDimension: .fractionalHeight(1/4)))
        let item4 = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                                              heightDimension: .fractionalHeight(1/2)))
        
        let item5 = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                                              heightDimension: .fractionalHeight(1/4)))
        
        let item6 = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                                              heightDimension: .fractionalHeight(3/4)))
        
        let item3 = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(2/6),
                                                                              heightDimension: .fractionalHeight(1)))
        
        let item2 = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(4/6),
                                                                              heightDimension: .fractionalHeight(1)))

        let group9 = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/2),
                                                                                         heightDimension: .fractionalHeight(1)),
                                                      subitems: [item7, item6])
        
        let group8 = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/2),
                                                                                         heightDimension: .fractionalHeight(1)),
                                                      subitems: [item6, item7])
        
        let group7 = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                                                           heightDimension: .fractionalHeight(3/4)),
                                                        subitems: [group8, group9])
        
        let group5 = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/2),
                                                                                         heightDimension: .fractionalHeight(1)),
                                                      subitems: [item4])
        let group6 = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/2),
                                                                                         heightDimension: .fractionalHeight(1)),
                                                        subitems: [item5, group7])
        let group4 = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                                                           heightDimension: .fractionalHeight(5/6)),
                                                        subitems: [group5, group6])
        let group3 = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                                                           heightDimension: .fractionalHeight(1/6)),
                                                        subitems: [item2, item3])

        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                                             heightDimension: .fractionalHeight(1/6)))
        let group2 = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                                                         heightDimension: .fractionalHeight(5/6)),
                                                      subitems: [group4, group3])

        let group = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                                                        heightDimension: .fractionalHeight(1)),
                                                     subitems: [group2, item])
        let section = NSCollectionLayoutSection(group: group)
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = colors.randomElement()
        return cell
    }
}
