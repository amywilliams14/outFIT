//
//  HomeViewController.swift
//  HalfWay
//
//  Created by Lara Kulkarni on 11/20/21.
//  Copyright © 2021 Lara Kulkarni. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    var outFIT = UILabel()
    var logo = UIImageView()
    var begin = UIButton()

    override func viewDidLoad() {
       super.viewDidLoad()
       view.backgroundColor = .white
        
        outFIT.text = "outFIT"
        outFIT.textAlignment = .center
        outFIT.font = .systemFont(ofSize: 70, weight: .bold)
        outFIT.textColor = .black
        outFIT.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(outFIT)
        
        logo.image = UIImage(named: "logo")
        logo.contentMode = .scaleAspectFill
        logo.clipsToBounds = true
        logo.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(logo)
    
        begin.setTitle("Get Started", for: .normal)
        begin.layer.cornerRadius = 5
        begin.backgroundColor = .orange
        begin.addTarget(self, action: #selector(beginButtonTapped), for: .touchUpInside)
        begin.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(begin)
    
        setUpConstraints()
    }
    
   func setUpConstraints(){
       NSLayoutConstraint.activate([
          outFIT.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 150),
          outFIT.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 35),
          outFIT.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -35 ),
          outFIT.heightAnchor.constraint(equalToConstant: 55)
       ])
       NSLayoutConstraint.activate([
          logo.topAnchor.constraint(equalTo: outFIT.bottomAnchor, constant: 30),
          logo.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 60),
          logo.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -60),
          logo.heightAnchor.constraint(equalToConstant: 300)
       ])
       NSLayoutConstraint.activate([
        begin.topAnchor.constraint(equalTo: outFIT.bottomAnchor, constant: 400),
        begin.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 90),
        begin.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -90),
        begin.heightAnchor.constraint(equalToConstant: 30)
    ])
   }
    
    @ objc func beginButtonTapped() {
        let vc = ViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
                                     
