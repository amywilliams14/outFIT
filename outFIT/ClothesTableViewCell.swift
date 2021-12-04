//
//  ClothesTableViewCell.swift
//  outFIT
//
//  Created by Amy Williams on 12/2/21.
//

import UIKit

class ClothesTableViewCell: UITableViewCell {
    
    var clothesImageView = UIImageView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        clothesImageView = UIImageView()
        clothesImageView.translatesAutoresizingMaskIntoConstraints = false
        clothesImageView.contentMode = .scaleAspectFit
        contentView.addSubview(clothesImageView)

        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            clothesImageView.heightAnchor.constraint(equalToConstant: 300),
            clothesImageView.widthAnchor.constraint(equalToConstant: 300),
            clothesImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            clothesImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10)
        ])
    }
    
    func configure(for cloth: Clothes) {
//        let imageUrlString = cloth.url
//        let imageUrl = URL(string: imageUrlString)!
//        let imageData = try! Data(contentsOf: imageUrl)
        clothesImageView.image = UIImage(named: cloth.url)
    }
}
