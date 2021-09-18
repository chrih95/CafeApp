//
//  MenuItemWithPriceView.swift
//  CafeApp
//
//  Created by Han  on 9/17/21.
//

import UIKit

class MenuItemWithPriceView: UIView {
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "drinks_coffee")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "$3.50"
        label.backgroundColor = UIColor(named: "Cream")
        label.textAlignment = .center
        label.layer.cornerRadius = 20
        label.layer.masksToBounds = true
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor(named: "MochaBrown")
        
        // FIXME: A dynamic way to set corner radius
        layer.cornerRadius = 150
                
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpViews() {
        
        addSubview(imageView)
        addSubview(priceLabel)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 50),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
            
            priceLabel.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
            priceLabel.centerYAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            priceLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1/5),
            priceLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/3)
        ])
    }
}