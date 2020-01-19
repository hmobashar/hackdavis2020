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
        static var lightPink = #colorLiteral(red: 0.9168766141, green: 0.5313091874, blue: 0.7172885537, alpha: 1)
    }
    
    let data: [CellModel] = [CellModel(name: "Forgetfulness"), CellModel(name: "Confusion"), CellModel(name: "Depression"), CellModel(name: "Drowsiness"), CellModel(name: "Constipation"), CellModel(name: "Headache"), CellModel(name: "Bodyaches"), CellModel(name: "Stomach pain"), CellModel(name: "Backpain")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.symptomCollection.dataSource = self
        self.symptomCollection.delegate = self
        self.setupCollectionViewItemSize()
        
//        self.symptomCollection.register(UINib.init(nibName: "SymptomCell", bundle: nil), forCellWithReuseIdentifier: "Symptom")
        self.symptomCollection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellId")

        // Do any additional setup after loading the view.
    }
    
    private func setupCollectionViewItemSize() {
        if symptomCollectionViewFlowLayout == nil {
            let numberOfItemsPerRow: CGFloat = 3
            let lineSpacing: CGFloat = 10
            let interItemSpacing: CGFloat = 8
            
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
        
        switch(indexPath.row) {
        case 0: cell.image.image = UIImage(named: "alzheimer")!
        cell.name.text! = "forgetfulness"
        case 1: cell.image.image = UIImage(named: "brain_stroke")!
        case 2: cell.image.image = UIImage(named: "depression")!
        case 3: cell.image.image = UIImage(named: "ghost")!
        case 4: cell.image.image = UIImage(named: "hand")!
        case 5: cell.image.image = UIImage(named: "headache")!
        case 6: cell.image.image = UIImage(named: "leg")!
        case 7: cell.image.image = UIImage(named: "pills")!
        case 8: cell.image.image = UIImage(named: "pulse")!
        case 9: cell.image.image = UIImage(named: "stomach")!
        default: cell.image.image = UIImage(named: "headache")!
        }
        
        cell.configure(with: data[indexPath.row])
        
        
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
