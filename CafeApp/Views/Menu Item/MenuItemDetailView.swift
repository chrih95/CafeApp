//
//  MenuItemDetailView.swift
//  CafeApp
//
//  Created by Han  on 9/17/21.
//

import UIKit

class MenuItemDetailView: UIView {
    
// MARK: - Class Properties
    
    private let menuItem: MenuItem
    weak var newMenuItemViewableDelegate: NewMenuItemViewable?

// MARK: - UI Component Declarations
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        stackView.spacing = 40
        return stackView
    }()
    
    private lazy var menuItemWithPriceView: UIView = {
        let menuItemWithPriceView = MenuItemWithPriceView(menuItem: menuItem)
        menuItemWithPriceView.translatesAutoresizingMaskIntoConstraints = false
        return menuItemWithPriceView
    }()
    
    private lazy var ingredientsView: IngredientsView = {
        let ingredientsView = IngredientsView()
        ingredientsView.descriptionLabel.text = menuItem.ingredients?.joined(separator: ", ")
        ingredientsView.translatesAutoresizingMaskIntoConstraints = false
        return ingredientsView
    }()
    
    private lazy var pairingsView: PairingsView = {
        let pairingsView = PairingsView(menuItem: menuItem, newMenuItemViewableDelegate: newMenuItemViewableDelegate)
        pairingsView.translatesAutoresizingMaskIntoConstraints = false
        return pairingsView
    }()
    
// MARK: - Initializers
    
    init(menuItem: MenuItem, newMenuItemViewable: NewMenuItemViewable? = nil) {
        self.menuItem = menuItem
        self.newMenuItemViewableDelegate = newMenuItemViewable
        
        super.init(frame: .zero)
        
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
// MARK: - UI Setup Functions
    
    private func setUpViews() {
        
        backgroundColor = .white
        
        stackView.addArrangedSubview(menuItemWithPriceView)
        stackView.addArrangedSubview(ingredientsView)
        
        addSubview(stackView)
        
        addSubview(pairingsView)
        
        NSLayoutConstraint.activate([
            menuItemWithPriceView.heightAnchor.constraint(equalToConstant: 300),
            menuItemWithPriceView.widthAnchor.constraint(equalToConstant: 300),
            
            stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            
            ingredientsView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 3/4, constant: 0),
            ingredientsView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1/10, constant: 0),
            
            pairingsView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 20),
            pairingsView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            pairingsView.bottomAnchor.constraint(greaterThanOrEqualTo: bottomAnchor, constant: -20),
            pairingsView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
        ])
    }
}
