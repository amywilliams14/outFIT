//
//  BottomViewController.swift
//  outFIT
//
//  Created by Amy Williams on 11/21/21.
//

import UIKit
import Alamofire

class BottomViewController: UIViewController {
    
    weak var delegate: bottomsImageDelegate?

    let bottomsTableView = UITableView()
    let bottomReuseIdentifier = "bottomReuseIdentifier"
    var bottomsData: [Clothes] = []
    

    override func viewDidLoad() {
        
        //getBottoms()
        
        bottomsData = [Clothes(id: 2, url: "pants1", top: false),
            Clothes(id: 3, url: "pants2", top: false),
            Clothes(id: 6, url: "pants3", top: false)]
        
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Select A Bottom"
        
        bottomsTableView.translatesAutoresizingMaskIntoConstraints = false
        bottomsTableView.delegate = self
        bottomsTableView.dataSource = self
        bottomsTableView.register(ClothesTableViewCell.self, forCellReuseIdentifier: bottomReuseIdentifier)
        view.addSubview(bottomsTableView)

        setUpConstraints()
    }
    func setUpConstraints(){
        NSLayoutConstraint.activate([
            bottomsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomsTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            bottomsTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    func getBottoms(){
//        let bottoms = NetworkManager.getBottoms()
//        bottomsData = bottoms
//        reloadview
    }
}

extension BottomViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: 100, height: 20)}
}

extension BottomViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       let pic = bottomsData[indexPath.row].url
        delegate?.changeBottomsImage(newPic: UIImage(named: pic)!)
        //dismiss(animated: true, completion: nil)
        self.navigationController?.popViewController(animated: true)
    }

}
extension BottomViewController: UITableViewDataSource {
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: bottomReuseIdentifier, for: indexPath) as! ClothesTableViewCell
            let top = bottomsData[indexPath.row]
            cell.configure(for: top)
            return cell
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return bottomsData.count
        }
    
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 300
        }
    }
    
    

