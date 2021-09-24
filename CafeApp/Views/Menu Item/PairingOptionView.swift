//
//  PairingOptionView.swift
//  CafeApp
//
//  Created by Han  on 9/17/21.
//

import UIKit

class PairingOptionView: UIView {
    
// MARK: - Class Properties
    
    var price: Double = 0 {
        didSet {
            priceLabel.text = String(format: "$%.02f", price)
        }
    }
    
    var image: UIImage? {
        didSet {
            imageView.image = image
        }
    }
    
    var title: String? {
        didSet {
            titleLabel.text = title
        }
    }
    
    var menuItem: MenuItem?
    weak var newMenuItemViewableDelegate: NewMenuItemViewable?
    
// MARK: - UI Component Declarations
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "drinks_coffee")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "Pie slice"
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "$4.00"
        return label
    }()
    
// MARK: - Initializers
    
    init(newMenuItemViewableDelegate: NewMenuItemViewable?) {
        
        self.newMenuItemViewableDelegate = newMenuItemViewableDelegate
        
        super.init(frame: .zero)
        
        backgroundColor = UIColor(named: "Cream")
        setUpViews()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
// MARK: - UI Setup Functions
    
    private func setUpViews() {
        
        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(priceLabel)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 30),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: priceLabel.topAnchor, constant: -4),
            
            priceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            priceLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            priceLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            priceLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(pairingOptionViewTappedOn))
        addGestureRecognizer(tapGesture)
    }
    
// MARK: - Actions
    
    @objc func pairingOptionViewTappedOn() {
                
        print("Pairing Option Tapped On: \(String(describing: title))")
        
        if let menuItem = menuItem {
            newMenuItemViewableDelegate?.displayNewMenuItemDetails(menuItem)
        }
    }
}
