//
//  MainCollectionViewCell.swift
//  AppHotel
//
//  Created by Ravil on 08.09.2023.
//

import UIKit

final class MainCollectionViewCell: UICollectionViewCell {
    static let reuseID = String(describing: MainCollectionViewCell.self)
    
    // MARK: - UI
    
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - setupViews
    
    private func setupViews() {
    }
    
    // MARK: - setupConstraints
    
    private func setupConstraints() {
    }
}
