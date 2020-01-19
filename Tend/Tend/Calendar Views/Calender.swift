//
//  Calender.swift
//  myCalender2
//
//  Created by Muskan on 10/22/17.
//  Copyright © 2017 akhil. All rights reserved.
//
import UIKit

enum MyTheme {
    case light
    case dark
}

class Calender: UIViewController {
    
    var theme = MyTheme.dark
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Calendar"
        self.navigationController?.navigationBar.isTranslucent=false
        self.view.backgroundColor=Style.bgColor
        
        view.addSubview(calenderView)
        
        calenderView.translatesAutoresizingMaskIntoConstraints = false
        calenderView.topAnchor.constraint(equalTo: view.topAnchor, constant: 120).isActive = true
        calenderView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        calenderView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        calenderView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -350).isActive = true
        calenderView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -25).isActive=true
        calenderView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25).isActive=true
        calenderView.heightAnchor.constraint(equalToConstant: 365).isActive=true
        
        
//        let rightBarBtn = UIBarButtonItem(title: "Light", style: .plain, target: self, action: #selector(rightBarBtnAction))
//        self.navigationItem.rightBarButtonItem = rightBarBtn
        theme = .light
        Style.themeLight()
        self.view.backgroundColor=Style.bgColor
        calenderView.changeTheme()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        calenderView.myCollectionView.collectionViewLayout.invalidateLayout()
    }
    
//    @objc func rightBarBtnAction(sender: UIBarButtonItem) {
//        if theme == .dark {
//            sender.title = "Dark"
//            theme = .light
//            Style.themeLight()
//        } else {
//            sender.title = "Light"
//            theme = .dark
//            Style.themeDark()
//        }
//        self.view.backgroundColor=Style.bgColor
//        calenderView.changeTheme()
//    }
    @IBAction func viewStatistics(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let homeVC = storyboard.instantiateViewController(withIdentifier: "home") as! ViewController
        
        homeVC.modalPresentationStyle = .fullScreen
    }
    
    let calenderView: CalenderView = {
        let v=CalenderView(theme: MyTheme.dark)
        v.translatesAutoresizingMaskIntoConstraints=false
        return v
    }()
    
}
