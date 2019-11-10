//
//  ISSMyCellCollectionViewCell.swift
//  Homework10-Threads
//
//  Created by Кирилл Афонин on 08/11/2019.
//  Copyright © 2019 Кирилл Афонин. All rights reserved.
//

import UIKit

class ISSMyCellCollectionViewCell: UICollectionViewCell {
    
    let titleLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        setupCellView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCellView() {
        self.backgroundColor = .white
        
        titleLabel.frame = contentView.frame
        titleLabel.textAlignment = .center
        titleLabel.textColor = .blue
        titleLabel.adjustsFontSizeToFitWidth = true
        
        contentView.addSubview(titleLabel)
    }
    
    override func prepareForReuse() {
        titleLabel.text = ""
    }
    
}
