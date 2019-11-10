//
//  ISSAddingCell.swift
//  Homework10-Threads
//
//  Created by Кирилл Афонин on 08/11/2019.
//  Copyright © 2019 Кирилл Афонин. All rights reserved.
//

import UIKit

class ISSAddingCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        setupCellView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCellView() {
        let label = UILabel(frame: contentView.frame)
        label.textAlignment = .center
        label.textColor = .blue
        label.text = "Add new cell"
        label.adjustsFontSizeToFitWidth = true
        
        contentView.addSubview(label)
    }
}
