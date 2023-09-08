//
//  StandardTableViewCell.swift
//  AppHotel
//
//  Created by Ravil on 08.09.2023.
//

import UIKit
import SnapKit

final class StandardTableViewCell: UITableViewCell {
    static let reuseID = String(describing: StandardTableViewCell.self)

    // MARK: - UI
    
    private lazy var cardStandartView: UIView = {
        let view = UIView()
        view.backgroundColor = AppColor.white.uiColor
        view.layer.cornerRadius = 12
        return view
    }()
    
    private lazy var imageCarousel: ImageCarouselCell = {
        let carousel = ImageCarouselCell(images: [UIImage(named: "hotel")!, UIImage(named: "hotel1")!, UIImage(named: "hotel2")!])
        return carousel
    }()
    
    private lazy var descriptionNumberLabel: UILabel = {
        let label = UILabel()
        label.text = "Стандартный с видом на бассейн или сад"
        label.textColor = AppColor.black.uiColor
        label.font = UIFont(name: "SFProDisplay-Medium", size: 22)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var cardAllInclusiveView: UIView = {
        let view = UIView()
        view.backgroundColor = AppColor.grayCard.uiColor
        view.layer.cornerRadius = 5
        return view
    }()
    
    private lazy var cardAllInclusiveLabel: UILabel = {
        let label = UILabel()
        label.text = "Все включено"
        label.textColor = AppColor.grayDark.uiColor
        label.font = UIFont(name: "SFProDisplay-Medium", size: 16)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var cardAirConditionerView: UIView = {
        let view = UIView()
        view.backgroundColor = AppColor.grayCard.uiColor
        view.layer.cornerRadius = 5
        return view
    }()
    
    private lazy var cardAirConditionerLabel: UILabel = {
        let label = UILabel()
        label.text = "Кондиционер"
        label.textColor = AppColor.grayDark.uiColor
        label.font = UIFont(name: "SFProDisplay-Medium", size: 16)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var cardDetailView: UIView = {
        let view = UIView()
        let alpha: CGFloat = 0.2
        view.backgroundColor = UIColor(red: 13/255, green: 114/255, blue: 255/255, alpha: alpha)
        view.layer.cornerRadius = 5
        return view
    }()
    
    private lazy var cardDetailLabel: UILabel = {
        let label = UILabel()
        label.text = "Подробнее о номере"
        label.textColor = AppColor.blue.uiColor
        label.font = UIFont(name: "SFProDisplay-Medium", size: 16)
        return label
    }()
    
    private lazy var arrowImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = AppImage.vectorBlue.uiImage
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.text = "186 600 ₽"
        label.textColor = AppColor.black.uiColor
        label.font = UIFont(name: "SFProDisplay-Semibold", size: 30)
        return label
    }()
    
    private lazy var descriptionPriceLabel: UILabel = {
        let label = UILabel()
        label.text = "за 7 ночей с перелётом"
        label.textColor = AppColor.grayDark.uiColor
        label.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        return label
    }()
    
    private lazy var choiceNumberButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Выбрать номер", for: .normal)
        button.setTitleColor(AppColor.white.uiColor, for: .normal)
        button.backgroundColor = AppColor.blue.uiColor
        button.layer.cornerRadius = 15
        button.titleLabel?.font = UIFont(name: "SFProDisplay-Medium", size: 16)
        return button
    }()
    
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
        [cardStandartView, imageCarousel, descriptionNumberLabel, cardAllInclusiveView, cardAllInclusiveLabel, cardAirConditionerView, cardAirConditionerLabel, cardDetailView, cardDetailLabel, arrowImageView, priceLabel, descriptionPriceLabel, choiceNumberButton].forEach {
            contentView.addSubview($0)
        }
        
        let swipeLeftGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipeLeft))
        swipeLeftGesture.direction = .left
        imageCarousel.addGestureRecognizer(swipeLeftGesture)

        let swipeRightGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipeRight))
        swipeRightGesture.direction = .right
        imageCarousel.addGestureRecognizer(swipeRightGesture)
        
        contentView.backgroundColor = AppColor.gray.uiColor
    }

    // MARK: - setupConstraints

    private func setupConstraints() {
        cardStandartView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        imageCarousel.snp.makeConstraints { make in
            make.top.equalTo(cardStandartView.snp.top).offset(16)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }
        
        descriptionNumberLabel.snp.makeConstraints { make in
            make.top.equalTo(imageCarousel.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }
        cardAllInclusiveView.snp.makeConstraints { make in
            make.top.equalTo(descriptionNumberLabel.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(16)
            make.width.equalTo(123)
            make.height.equalTo(29)
        }
        cardAllInclusiveLabel.snp.makeConstraints { make in
            make.top.equalTo(cardAllInclusiveView.snp.top).offset(5)
            make.leading.equalTo(cardAllInclusiveView.snp.leading).offset(10)
            make.trailing.equalTo(cardAllInclusiveView.snp.trailing).offset(-10)
            make.bottom.equalTo(cardAllInclusiveView.snp.bottom).offset(-5)
        }
        cardAirConditionerView.snp.makeConstraints { make in
            make.top.equalTo(descriptionNumberLabel.snp.bottom).offset(8)
            make.leading.equalTo(cardAllInclusiveView.snp.trailing).offset(8)
            make.width.equalTo(121)
            make.height.equalTo(29)
        }
        cardAirConditionerLabel.snp.makeConstraints { make in
            make.top.equalTo(cardAirConditionerView.snp.top).offset(5)
            make.leading.equalTo(cardAirConditionerView.snp.leading).offset(10)
            make.trailing.equalTo(cardAirConditionerView.snp.trailing).offset(-10)
            make.bottom.equalTo(cardAirConditionerView.snp.bottom).offset(-5)
        }
        cardDetailView.snp.makeConstraints { make in
            make.top.equalTo(cardAirConditionerView.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(16)
            make.width.equalTo(192)
            make.height.equalTo(29)
        }
        cardDetailLabel.snp.makeConstraints { make in
            make.top.equalTo(cardDetailView.snp.top).offset(5)
            make.leading.equalTo(cardDetailView.snp.leading).offset(10)
            make.bottom.equalTo(cardDetailView.snp.bottom).offset(-5)
        }
        arrowImageView.snp.makeConstraints { make in
            make.trailing.equalTo(cardDetailView.snp.trailing).offset(-10)
            make.centerY.equalTo(cardDetailView.snp.centerY)
            make.size.equalTo(12)
        }
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(cardDetailView.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(16)
        }
        descriptionPriceLabel.snp.makeConstraints { make in
            make.top.equalTo(cardDetailView.snp.bottom).offset(30)
            make.leading.equalTo(priceLabel.snp.trailing).offset(8)
        }
        choiceNumberButton.snp.makeConstraints { make in
            make.top.equalTo(priceLabel.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(48)
        }
    }
    
    // MARK: - setupScroll
    
    @objc private func handleSwipeLeft() {
        imageCarousel.scrollToNext()
    }

    @objc private func handleSwipeRight() {
    }
}
