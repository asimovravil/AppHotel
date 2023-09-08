//
//  AdvantagesTableViewCell.swift
//  AppHotel
//
//  Created by Ravil on 08.09.2023.
//

import UIKit
import SnapKit

final class AdvantagesTableViewCell: UITableViewCell {

    // MARK: - UI
    
    private lazy var advantagesImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SFProDisplay-Medium", size: 16)
        label.textColor = AppColor.blackLight.uiColor
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SFProDisplay-Medium", size: 14)
        label.textColor = AppColor.grayDark.uiColor
        return label
    }()
    
    private lazy var arrowImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = AppImage.vectorsquare.uiImage
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    
    // MARK: - Properties

    var imageName: UIImage? {
        didSet {
            advantagesImageView.image = imageName
        }
    }

    var labelName: String? {
        didSet {
            titleLabel.text = labelName
        }
    }
    
    var descriptionName: String? {
        didSet {
            subtitleLabel.text = descriptionName
        }
    }
    
    // MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    // MARK: - setupViews
    
    private func setupViews() {
        [advantagesImageView, titleLabel, subtitleLabel, arrowImageView].forEach {
            contentView.addSubview($0)
        }
    }
    
    // MARK: - setupConstraints

    private func setupConstraints() {
        advantagesImageView.snp.makeConstraints { make in
            make.size.equalTo(24)
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(15)
        }
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(11)
            make.leading.equalTo(advantagesImageView.snp.trailing).offset(12)
        }
        subtitleLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-11)
            make.leading.equalTo(advantagesImageView.snp.trailing).offset(12)
        }
        arrowImageView.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-16)
            make.centerY.equalToSuperview()
            make.size.equalTo(12)
        }
    }

    // MARK: - Configure Cell

    func configure(with imageName: String, labelName: String, descriptionName: String) {
        self.imageName = UIImage(named: imageName)
        self.labelName = labelName
        self.descriptionName = descriptionName
    }

}
