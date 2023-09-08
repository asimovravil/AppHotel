//
//  MainCollectionViewCell.swift
//  AppHotel
//
//  Created by Ravil on 08.09.2023.
//

import UIKit
import SnapKit

final class MainCollectionViewCell: UICollectionViewCell {
    static let reuseID = String(describing: MainCollectionViewCell.self)
    
    // MARK: - UI
    
    private lazy var cardMainView: UIView = {
        let view = UIView()
        view.backgroundColor = AppColor.white.uiColor
        view.layer.cornerRadius = 12
        view.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        return view
    }()
    
    private lazy var hotelImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = AppImage.hotel.uiImage
        return imageView
    }()
    
    private lazy var starImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = AppImage.star.uiImage
        return imageView
    }()
    
    private lazy var cardGradeView: UIView = {
        let view = UIView()
        let alpha: CGFloat = 0.2
        view.backgroundColor = UIColor(red: 1.0, green: 0.658, blue: 0.0, alpha: alpha)
        view.layer.cornerRadius = 5
        return view
    }()
    
    private lazy var cardGradeLabel: UILabel = {
        let label = UILabel()
        label.text = "5 Превосходно"
        label.textColor = AppColor.orange.uiColor
        label.font = UIFont(name: "SFProDisplay-Medium", size: 16)
        return label
    }()
    
    private lazy var nameHotelLabel: UILabel = {
        let label = UILabel()
        label.text = "Steigenberger Makadi"
        label.textColor = AppColor.black.uiColor
        label.font = UIFont(name: "SFProDisplay-Medium", size: 22)
        return label
    }()
    
    private lazy var detailHotelLabel: UILabel = {
        let label = UILabel()
        label.text = "Madinat Makadi, Safaga Road, Makadi Bay, Египет"
        label.textColor = AppColor.blue.uiColor
        label.font = UIFont(name: "SFProDisplay-Medium", size: 14)
        return label
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.text = "от 134 673 ₽"
        label.textColor = AppColor.black.uiColor
        label.font = UIFont(name: "SFProDisplay-Semibold", size: 30)
        return label
    }()
    
    private lazy var descriptionPriceLabel: UILabel = {
        let label = UILabel()
        label.text = "за тур с перелётом"
        label.textColor = AppColor.black.uiColor
        label.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        return label
    }()
    
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
        [cardMainView, hotelImageView, starImageView, cardGradeView, cardGradeLabel, nameHotelLabel, detailHotelLabel, priceLabel, descriptionPriceLabel].forEach {
            contentView.addSubview($0)
        }
    }
    
    // MARK: - setupConstraints
    
    private func setupConstraints() {
        cardMainView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        hotelImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }
        cardGradeView.snp.makeConstraints { make in
            make.top.equalTo(hotelImageView.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(16)
            make.width.equalTo(149)
            make.height.equalTo(29)
        }
        starImageView.snp.makeConstraints { make in
            make.top.equalTo(cardGradeView.snp.top).offset(5)
            make.leading.equalTo(cardGradeView.snp.leading).offset(10)
            make.bottom.equalTo(cardGradeView.snp.bottom).offset(-5)
            make.size.equalTo(15)
        }
        cardGradeLabel.snp.makeConstraints { make in
            make.top.equalTo(cardGradeView.snp.top).offset(5)
            make.leading.equalTo(starImageView.snp.trailing).offset(2)
            make.bottom.equalTo(cardGradeView.snp.bottom).offset(-5)
        }
        nameHotelLabel.snp.makeConstraints { make in
            make.top.equalTo(cardGradeView.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(16)
        }
        detailHotelLabel.snp.makeConstraints { make in
            make.top.equalTo(nameHotelLabel.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(16)
        }
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(detailHotelLabel.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(16)
        }
        descriptionPriceLabel.snp.makeConstraints { make in
            make.top.equalTo(detailHotelLabel.snp.bottom).offset(30)
            make.leading.equalTo(priceLabel.snp.trailing).offset(8)
        }
    }
}
