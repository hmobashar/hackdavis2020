//
//  Symptoms.swift
//  Tend
//
//  Created by Hajra Mobashar on 1/18/20.
//  Copyright © 2020 hackdavis2020. All rights reserved.
//

import UIKit

class SymptomsVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    @IBOutlet weak var symptomCollection: UICollectionView!
    var symptomCollectionViewFlowLayout: UICollectionViewFlowLayout!
    
    struct Colors {
        static var lightBlue = #colorLiteral(red: 0.6117647059, green: 0.6941176471, blue: 0.7098039216, alpha: 1)
        static var lightPink = #colorLiteral(red: 0.9568627451, green: 0.7490196078, blue: 0.6666666667, alpha: 1)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.symptomCollection.dataSource = self
        self.symptomCollection.delegate = self
        self.setupCollectionViewItemSize()

        // Do any additional setup after loading the view.
    }
    
    private func setupCollectionViewItemSize() {
        if symptomCollectionViewFlowLayout == nil {
            let numberOfItemsPerRow: CGFloat = 3
            let lineSpacing: CGFloat = 10
            let interItemSpacing: CGFloat = 0
            
            let width = (self.symptomCollection.frame.width - (numberOfItemsPerRow - 1) * interItemSpacing) / numberOfItemsPerRow
            let height = width
            
            // cell display setting
            symptomCollectionViewFlowLayout = UICollectionViewFlowLayout()
            symptomCollectionViewFlowLayout.itemSize = CGSize(width: width, height: height)
            symptomCollectionViewFlowLayout.sectionInset = UIEdgeInsets.zero
            symptomCollectionViewFlowLayout.scrollDirection = .vertical
            symptomCollectionViewFlowLayout.minimumLineSpacing = lineSpacing
            symptomCollectionViewFlowLayout.minimumInteritemSpacing = interItemSpacing
            self.symptomCollection.setCollectionViewLayout(symptomCollectionViewFlowLayout, animated: true)
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = symptomCollection.dequeueReusableCell(withReuseIdentifier: "Symptom", for: indexPath as IndexPath) as! SymptomCell

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if self.symptomCollection.cellForItem(at: indexPath)?.contentView.backgroundColor == Colors.lightPink {
            self.symptomCollection.cellForItem(at: indexPath)?.contentView.backgroundColor = UIColor.white
        } else {
            self.symptomCollection.cellForItem(at: indexPath)?.contentView.backgroundColor = Colors.lightPink
        }

    }

}
