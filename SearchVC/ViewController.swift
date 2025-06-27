//
//  ViewController.swift
//  SearchVC
//
//  Created by Sameer Bhati on 27/06/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var cityCollectionView: CollViewAdjustedHeight!
    @IBOutlet weak var cityNameCollectionView: UICollectionView!
    @IBOutlet weak var alphabetTableView: TableViewDynamicHeight!
    @IBOutlet weak var txtSearchField: UITextField!
    
    let alphabetArray:[String]=["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    
    let cityNames: [String] = [ "Abohar", "Abu Dhabi","Adilabad", "Adoni","Agarmalwa", "Agartala","Agra", "Ahmednagar","Aizawl", "Ajman","Ajmer", "Akola","Alappuzha", "Alibag","Aligarh", "Alipurduar","Alirajpur", "Agartala","Almora", "Abohar","Adilabad", "Ajman","Agarmalwa", "Ajman","Agra","Ahmednagar","Agartala","Almora", "Abohar","Adilabad", "Ajman","Agarmalwa", "Ajman","Agra", "Ahmednagar","Abohar", "Abu Dhabi","Adilabad"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        registerXib()
    }
    
    func registerXib() {
        cityNameCollectionView.delegate = self
        cityNameCollectionView.dataSource = self
        cityNameCollectionView.register(UINib(nibName: "CityNameCollectionCell", bundle: nil), forCellWithReuseIdentifier: "CityNameCollectionCell")
        
        cityCollectionView.delegate = self
        cityCollectionView.dataSource = self
        cityCollectionView.register(UINib(nibName: "CityCollectionCell", bundle: nil), forCellWithReuseIdentifier: "CityCollectionCell")
        
        alphabetTableView.delegate = self
        alphabetTableView.dataSource = self
        alphabetTableView.register(UINib(nibName: "AlphabetScrollTableCell", bundle: nil), forCellReuseIdentifier: "AlphabetScrollTableCell")
        }
    
    
    @IBAction func btnBackTap(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func btnLocationTap(_ sender: Any) {
    }

}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case cityCollectionView:
            return 6
        case cityNameCollectionView:
            return cityNames.count
        default:
            break
        }
        return 0
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView{
        case cityCollectionView:
            let cell = cityCollectionView.dequeueReusableCell(withReuseIdentifier: "CityCollectionCell", for: indexPath) as! CityCollectionCell
            return cell
        case cityNameCollectionView:
            let cell = cityNameCollectionView.dequeueReusableCell(withReuseIdentifier: "CityNameCollectionCell", for: indexPath) as! CityNameCollectionCell
            cell.lblCityName.text = cityNames[indexPath.row]
            return cell
        default:
            break
        }
        return   UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch collectionView {
        case cityCollectionView:
            let spacing: CGFloat = 5 // total spacing between cells
            let totalWidth = collectionView.bounds.width - spacing * 2
            let width = totalWidth / 3 - 7
            return CGSize(width: width, height: 75)
        
        case cityNameCollectionView:
            let spacing: CGFloat = 5 // total spacing between cells
            let totalWidth = collectionView.bounds.width - spacing*2
            let width = totalWidth / 2
            
            let cityName = cityNames[indexPath.row]
            let constraintRect = CGSize(width: width - 10, height: .greatestFiniteMagnitude)
            let boundingBox = cityName.boundingRect(with: constraintRect,
                                                        options: .usesLineFragmentOrigin,
                                                        context: nil)

            let height = ceil(boundingBox.height) + 18
            return CGSize(width: width, height: height)
        default:
            break
        }
        return CGSize(width: 0, height: 0)
    }
}

extension ViewController: UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alphabetArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AlphabetScrollTableCell", for: indexPath) as! AlphabetScrollTableCell
        
        cell.lblAphabet.text = alphabetArray[indexPath.row]
        
        return cell
    }
    
}
