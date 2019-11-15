//
//  CollectionViewDataSource.swift
//  Homework10-Threads
//
//  Created by Кирилл Афонин on 08/11/2019.
//  Copyright © 2019 Кирилл Афонин. All rights reserved.
//

import UIKit

class CollectionViewDataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    
    // MARK: - DataSource
    private var data = [1, 2, 3, 4]
    private let concurrentQueue = DispatchQueue(label: "com.concurrentQueue",
                                                qos: .unspecified,
                                                attributes: [.concurrent])
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.row == collectionView.numberOfItems(inSection: 0)-1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AddingCell", for: indexPath) as! ISSAddingCell
            
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! ISSMyCellCollectionViewCell
            cell.titleLabel.text = data[indexPath.row].description
            
            return cell
        }
    }
    

    // MARK: - Delegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == (collectionView.numberOfItems(inSection: 0) - 1) {
            // Пока задача не выполнится, этот поток заблокирован
            concurrentQueue.async(flags: .barrier) {
                self.addCell()
                DispatchQueue.main.async { // Обновляем после добавления элементов
                    collectionView.reloadData()
                }
            }
        } else {
            // Синхронное удаление
            concurrentQueue.sync {
                self.deleteCell(at: indexPath)
                DispatchQueue.main.async {
                    collectionView.reloadData()
                }
            }
        }
    }
    
    // Добавляет 5 ячеек к последней
    private func addCell() {
        for _ in 0..<5 {
            let lastNumber = self.data.last ?? 0
            self.data.append(lastNumber + 1)
            print(lastNumber + 1)
        }
    }
    
    // Удаление ячейки
    private func deleteCell(at indexPath: IndexPath) {
            self.data.remove(at: indexPath.row)
    }
    
    
    // MARK: - FlowLayoutDelegate
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var size = CGSize()
        size.width = collectionView.frame.width/5
        size.height = size.width
        return size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
}
