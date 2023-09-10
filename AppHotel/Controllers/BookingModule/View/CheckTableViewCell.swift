//
//  BookingTableViewCell.swift
//  AppHotel
//
//  Created by Ravil on 09.09.2023.
//

import UIKit
import SnapKit

final class CheckTableViewCell: UITableViewCell {
    static let reuseID = String(describing: CheckTableViewCell.self)
    
    // MARK: - UI
    
    private lazy var cardCheckView: UIView = {
        let view = UIView()
        view.backgroundColor = AppColor.white.uiColor
        view.layer.cornerRadius = 12
        return view
    }()
    
    private lazy var tourTitle: UILabel = {
        let label = UILabel()
        label.text = "Тур"
        label.textColor = AppColor.grayDark.uiColor
        label.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        return label
    }()
    
    private lazy var tourSubTitle: UILabel = {
        let label = UILabel()
        label.text = "186 600 ₽"
        label.textColor = AppColor.black.uiColor
        label.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var surchargeTitle: UILabel = {
        let label = UILabel()
        label.text = "Топливный сбор"
        label.textColor = AppColor.grayDark.uiColor
        label.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        return label
    }()
    
    private lazy var surchargeSubTitle: UILabel = {
        let label = UILabel()
        label.text = "9 300 ₽"
        label.textColor = AppColor.black.uiColor
        label.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var serviceTitle: UILabel = {
        let label = UILabel()
        label.text = "Сервисный сбор"
        label.textColor = AppColor.grayDark.uiColor
        label.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        return label
    }()
    
    private lazy var serviceSubTitle: UILabel = {
        let label = UILabel()
        label.text = "2 136 ₽"
        label.textColor = AppColor.black.uiColor
        label.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var payTitle: UILabel = {
        let label = UILabel()
        label.text = "К оплате"
        label.textColor = AppColor.grayDark.uiColor
        label.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        return label
    }()
    
    private lazy var paySubTitle: UILabel = {
        let label = UILabel()
        label.text = "198 036 ₽"
        label.textColor = AppColor.blue.uiColor
        label.font = UIFont(name: "SFProDisplay-SemiBold", size: 16)
        label.numberOfLines = 0
        return label
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
        [cardCheckView, tourTitle, tourSubTitle, surchargeTitle, surchargeSubTitle, serviceTitle, serviceSubTitle, payTitle, paySubTitle].forEach {
            contentView.addSubview($0)
        }
    }
    
    // MARK: - setupConstraints
    
    private func setupConstraints() {
        cardCheckView.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-8)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(156)
        }
        tourTitle.snp.makeConstraints { make in
            make.top.equalTo(cardCheckView.snp.top).offset(16)
            make.leading.equalTo(cardCheckView.snp.leading).offset(16)
        }
        tourSubTitle.snp.makeConstraints { make in
            make.top.equalTo(cardCheckView.snp.top).offset(16)
            make.trailing.equalTo(cardCheckView.snp.trailing).offset(-16)
        }
        surchargeTitle.snp.makeConstraints { make in
            make.top.equalTo(tourTitle.snp.bottom).offset(16)
            make.leading.equalTo(cardCheckView.snp.leading).offset(16)
        }
        surchargeSubTitle.snp.makeConstraints { make in
            make.top.equalTo(tourSubTitle.snp.bottom).offset(16)
            make.trailing.equalTo(cardCheckView.snp.trailing).offset(-16)
        }
        serviceTitle.snp.makeConstraints { make in
            make.top.equalTo(surchargeTitle.snp.bottom).offset(16)
            make.leading.equalTo(cardCheckView.snp.leading).offset(16)
        }
        serviceSubTitle.snp.makeConstraints { make in
            make.top.equalTo(surchargeSubTitle.snp.bottom).offset(16)
            make.trailing.equalTo(cardCheckView.snp.trailing).offset(-16)
        }
        payTitle.snp.makeConstraints { make in
            make.top.equalTo(serviceTitle.snp.bottom).offset(16)
            make.leading.equalTo(cardCheckView.snp.leading).offset(16)
        }
        paySubTitle.snp.makeConstraints { make in
            make.top.equalTo(serviceSubTitle.snp.bottom).offset(16)
            make.trailing.equalTo(cardCheckView.snp.trailing).offset(-16)
        }
    }
    
    func configure(with book: Book) {
        tourSubTitle.text = "\(book.tour_price) ₽"
        surchargeSubTitle.text = "\(book.fuel_charge) ₽"
        serviceSubTitle.text = "\(book.service_charge) ₽"
    }
}

