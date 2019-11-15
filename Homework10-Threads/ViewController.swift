//
//  ViewController.swift
//  Homework10-Threads
//
//  Created by Кирилл Афонин on 08/11/2019.
//  Copyright © 2019 Кирилл Афонин. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let cvHelper = CollectionViewDataSource()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        collectionView.backgroundColor = .lightGray
        collectionView.register(ISSMyCellCollectionViewCell.self, forCellWithReuseIdentifier: "MyCell")
        collectionView.register(ISSAddingCell.self, forCellWithReuseIdentifier: "AddingCell")
        
        collectionView.delegate = cvHelper
        collectionView.dataSource = cvHelper

        view.addSubview(collectionView)
    }

}
