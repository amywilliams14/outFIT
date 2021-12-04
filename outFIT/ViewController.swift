//
//  ViewController.swift
//  outFIT
//
//  Created by Amy Williams on 11/20/21.
//

import UIKit


protocol topsImageDelegate: class {
    func changeTopsImage(newPic: String)
}

protocol bottomsImageDelegate: class {
    func changeBottomsImage(newPic: UIImage)
}

class ViewController: UIViewController {

    private var titleLabel = UILabel()
    private var topsLabel = UILabel()
    private var topsButton = UIButton()
    private var bottomsLabel = UILabel()
    private var bottomsButton = UIButton()
    private var newOutfitButton = UIButton()
    private var topsImageView = UIImageView()
    private var bottomsImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        titleLabel.text = "My Outfits"
        titleLabel.textColor = .black
        titleLabel.font = .systemFont(ofSize: 40, weight: .medium)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        
        topsLabel.text = "Tops"
        topsLabel.textColor = .black
        topsLabel.font = .systemFont(ofSize: 18, weight: .medium)
        topsLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(topsLabel)
        
        topsButton.translatesAutoresizingMaskIntoConstraints = false
        topsButton.backgroundColor = .orange
        topsButton.addTarget(self, action: #selector(topsButtonTapped), for: .touchUpInside)
        view.addSubview(topsButton)
        
        bottomsLabel.text = "Bottoms"
        bottomsLabel.textColor = .black
        bottomsLabel.font = .systemFont(ofSize: 18, weight: .medium)
        bottomsLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bottomsLabel)
        
        bottomsButton.translatesAutoresizingMaskIntoConstraints = false
        bottomsButton.backgroundColor = .orange
        bottomsButton.addTarget(self, action: #selector(bottomsButtonTapped), for: .touchUpInside)
        view.addSubview(bottomsButton)
        
        newOutfitButton.setTitle("New Outfit", for: .normal)
        newOutfitButton.setTitleColor(.black, for: .normal)
        newOutfitButton.translatesAutoresizingMaskIntoConstraints = false
        newOutfitButton.layer.borderWidth = 3
        newOutfitButton.layer.borderColor = UIColor.orange.cgColor
        newOutfitButton.layer.cornerRadius = 8
        newOutfitButton.addTarget(self, action: #selector(newOutfitButtonTapped), for: .touchUpInside)
        view.addSubview(newOutfitButton)
        
        topsImageView.image = UIImage(named: "logo")
        topsImageView.contentMode = .scaleAspectFill
        topsImageView.clipsToBounds = true
        topsImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(topsImageView)
        
        bottomsImageView.image = UIImage(named: "greyScreen")
        bottomsImageView.contentMode = .scaleAspectFill
        bottomsImageView.clipsToBounds = true
        bottomsImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bottomsImageView)
        
        setupConstraints()
    }
    
    func getTop(){
//       let image = NetworkManager.getTops()
//    topsImageView.image = image
//       viewController.realodView()
    }
    func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20)
        ])
        NSLayoutConstraint.activate([
            topsLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 40),
            topsLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30)
        ])
        NSLayoutConstraint.activate([
            topsButton.topAnchor.constraint(equalTo: topsLabel.bottomAnchor, constant: 10),
            topsButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            topsButton.widthAnchor.constraint(equalToConstant: 80)
        ])
        NSLayoutConstraint.activate([
            bottomsLabel.topAnchor.constraint(equalTo: topsButton.bottomAnchor, constant: 220),
            bottomsLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30)
        ])
        NSLayoutConstraint.activate([
            bottomsButton.topAnchor.constraint(equalTo: bottomsLabel.bottomAnchor, constant: 10),
            bottomsButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            bottomsButton.widthAnchor.constraint(equalToConstant: 80)
        ])
        NSLayoutConstraint.activate([
            newOutfitButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            newOutfitButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            newOutfitButton.widthAnchor.constraint(equalToConstant: 150)
        ])
        NSLayoutConstraint.activate([
            topsImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            topsImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            topsImageView.widthAnchor.constraint(equalToConstant: 240),
            topsImageView.heightAnchor.constraint(equalToConstant: 280)
        ])
        NSLayoutConstraint.activate([
            bottomsImageView.topAnchor.constraint(equalTo: topsImageView.bottomAnchor, constant: 0),
            bottomsImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            bottomsImageView.widthAnchor.constraint(equalToConstant: 240),
            bottomsImageView.heightAnchor.constraint(equalToConstant: 280)
        ])
    }
    
    @ objc func topsButtonTapped() {
        let vc = TopViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @ objc func bottomsButtonTapped() {
        let vc = BottomViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @ objc func newOutfitButtonTapped() {
        topsImageView.image = UIImage(named: "greyScreen")
        bottomsImageView.image = UIImage(named: "greyScreen")
    }
}

extension ViewController: topsImageDelegate {
    func changeTopsImage(newPic: String) {
        //print(newPic)
        topsImageView.image = UIImage(named: newPic)
        //topsImageView.image = newPic
     //   topsImageView.reloadInputViews()
       // self.reloadData()
        
    }
}

extension ViewController: bottomsImageDelegate {
    func changeBottomsImage(newPic: UIImage) {
        bottomsImageView.image = newPic
       // reloadData()
    }
}

