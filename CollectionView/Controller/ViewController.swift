//
//  ViewController.swift
//  CollectionView
//
//  Created by Matiny L on 5/29/20.
//  Copyright © 2020 Matiny L. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let thousand = Array(1...1000)
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(CustomCell.nib(), forCellWithReuseIdentifier: "CustomCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let layout = UICollectionViewFlowLayout()
        
        layout.minimumLineSpacing = 2
        layout.minimumInteritemSpacing = 2
        collectionView.collectionViewLayout = layout
    }
    
    override func viewWillLayoutSubviews() {
      super.viewWillLayoutSubviews()

      guard let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else {
        return
      }

//        if UIApplication.shared.statusBarOrientation.isLandscape {
//         print("Landscape")
//      } else {
//        print("Portrait")
//      }

      flowLayout.invalidateLayout()
    }
    
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return thousand.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as! CustomCell
        
        func randomColor() -> UIColor {
            return UIColor(hue: CGFloat(Float.random(in: 0.5...1)), saturation: CGFloat(Float.random(in: 0.25...1)), brightness: 1, alpha: 1)
        }
        
        cell.configure(number: indexPath.row, color: randomColor())
        
        return cell
    }
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.size.width / 4.15, height: collectionView.frame.size.height / 4.15)
    }
}
