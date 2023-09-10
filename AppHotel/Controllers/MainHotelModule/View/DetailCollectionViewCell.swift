//
//  DetailCollectionViewCell.swift
//  AppHotel
//
//  Created by Ravil on 08.09.2023.
//

import UIKit
import SnapKit

final class DetailCollectionViewCell: UICollectionViewCell {
    static let reuseID = String(describing: DetailCollectionViewCell.self)

    // MARK: - UI
    
    private lazy var cardDetailView: UIView = {
        let view = UIView()
        view.backgroundColor = AppColor.white.uiColor
        view.layer.cornerRadius = 12
        return view
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.rowHeight = 60
        tableView.backgroundColor = AppColor.grayCard.uiColor
        tableView.register(AdvantagesTableViewCell.self, forCellReuseIdentifier: "customCellID")
        tableView.layer.cornerRadius = 15
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    private lazy var infoHotelLabel: UILabel = {
        let label = UILabel()
        label.text = "Об отеле"
        label.textColor = AppColor.black.uiColor
        label.font = UIFont(name: "SFProDisplay-Medium", size: 22)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var cardLineView: UIView = {
        let view = UIView()
        view.backgroundColor = AppColor.grayCard.uiColor
        view.layer.cornerRadius = 5
        return view
    }()
    
    private lazy var cardLineLabel: UILabel = {
        let label = UILabel()
        label.text = "3-я линия"
        label.textColor = AppColor.grayDark.uiColor
        label.font = UIFont(name: "SFProDisplay-Medium", size: 16)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var cardPaidWifiView: UIView = {
        let view = UIView()
        view.backgroundColor = AppColor.grayCard.uiColor
        view.layer.cornerRadius = 5
        return view
    }()
    
    private lazy var cardPaidWifiLabel: UILabel = {
        let label = UILabel()
        label.text = "Платный Wi-Fi в фойе"
        label.textColor = AppColor.grayDark.uiColor
        label.font = UIFont(name: "SFProDisplay-Medium", size: 16)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var cardAirportView: UIView = {
        let view = UIView()
        view.backgroundColor = AppColor.grayCard.uiColor
        view.layer.cornerRadius = 5
        return view
    }()
    
    private lazy var cardAirportLabel: UILabel = {
        let label = UILabel()
        label.text = "30 км до аэропорта"
        label.textColor = AppColor.grayDark.uiColor
        label.font = UIFont(name: "SFProDisplay-Medium", size: 16)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var cardBeachView: UIView = {
        let view = UIView()
        view.backgroundColor = AppColor.grayCard.uiColor
        view.layer.cornerRadius = 5
        return view
    }()
    
    private lazy var cardBeachLabel: UILabel = {
        let label = UILabel()
        label.text = "1 км до пляжа"
        label.textColor = AppColor.grayDark.uiColor
        label.font = UIFont(name: "SFProDisplay-Medium", size: 16)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Отель VIP-класса с собственными гольф полями. Высокий уровнь сервиса. Рекомендуем для респектабельного отдыха. Отель принимает гостей от 18 лет!"
        label.textColor = AppColor.black.uiColor
        label.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        label.numberOfLines = 0
        label.textAlignment = .left
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
        [cardDetailView, tableView, infoHotelLabel, cardLineView, cardLineLabel, cardPaidWifiView, cardPaidWifiLabel, cardAirportView, cardAirportLabel, cardBeachView, cardBeachLabel, descriptionLabel].forEach {
            contentView.addSubview($0)
        }
        contentView.backgroundColor = AppColor.gray.uiColor
    }
    
    // MARK: - setupConstraints
    
    private func setupConstraints() {
        cardDetailView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        tableView.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(184)
        }
        infoHotelLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.equalToSuperview().offset(16)
        }
        cardLineView.snp.makeConstraints { make in
            make.top.equalTo(infoHotelLabel.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(16)
            make.width.equalTo(92)
            make.height.equalTo(29)
        }
        cardLineLabel.snp.makeConstraints { make in
            make.top.equalTo(cardLineView.snp.top).offset(5)
            make.leading.equalTo(cardLineView.snp.leading).offset(10)
            make.trailing.equalTo(cardLineView.snp.trailing).offset(-10)
            make.bottom.equalTo(cardLineView.snp.bottom).offset(-5)
        }
        cardPaidWifiView.snp.makeConstraints { make in
            make.top.equalTo(infoHotelLabel.snp.bottom).offset(16)
            make.leading.equalTo(cardLineView.snp.trailing).offset(8)
            make.width.equalTo(178)
            make.height.equalTo(29)
        }
        cardPaidWifiLabel.snp.makeConstraints { make in
            make.top.equalTo(cardPaidWifiView.snp.top).offset(5)
            make.leading.equalTo(cardPaidWifiView.snp.leading).offset(10)
            make.trailing.equalTo(cardPaidWifiView.snp.trailing).offset(-10)
            make.bottom.equalTo(cardPaidWifiView.snp.bottom).offset(-5)
        }
        cardAirportView.snp.makeConstraints { make in
            make.top.equalTo(cardLineView.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(16)
            make.width.equalTo(165)
            make.height.equalTo(29)
        }
        cardAirportLabel.snp.makeConstraints { make in
            make.top.equalTo(cardAirportView.snp.top).offset(5)
            make.leading.equalTo(cardAirportView.snp.leading).offset(10)
            make.trailing.equalTo(cardAirportView.snp.trailing).offset(-10)
            make.bottom.equalTo(cardAirportView.snp.bottom).offset(-5)
        }
        cardBeachView.snp.makeConstraints { make in
            make.top.equalTo(cardPaidWifiView.snp.bottom).offset(8)
            make.leading.equalTo(cardAirportView.snp.trailing).offset(8)
            make.width.equalTo(122)
            make.height.equalTo(29)
        }
        cardBeachLabel.snp.makeConstraints { make in
            make.top.equalTo(cardBeachView.snp.top).offset(5)
            make.leading.equalTo(cardBeachView.snp.leading).offset(10)
            make.trailing.equalTo(cardBeachView.snp.trailing).offset(-10)
            make.bottom.equalTo(cardBeachView.snp.bottom).offset(-5)
        }
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(cardAirportView.snp.bottom).offset(12)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }
    }
}

extension DetailCollectionViewCell: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCellID", for: indexPath) as! AdvantagesTableViewCell
        cell.selectionStyle = .none
        cell.isUserInteractionEnabled = false
        cell.backgroundColor = AppColor.grayCard.uiColor
        switch indexPath.row {
        case 0:
            cell.configure(with: AppImage.emojihappy.rawValue, labelName: "Удобства", descriptionName: "Самое необходимое")
        case 1:
            cell.configure(with: AppImage.ticksquare.rawValue, labelName: "Что включено", descriptionName: "Самое необходимое")
        case 2:
            cell.configure(with: AppImage.closesquare.rawValue, labelName: "Что не включено", descriptionName: "Самое необходимое")
        default:
            cell.labelName = nil
            cell.descriptionName = nil
        }
        return cell
    }
    
    // MARK: - Actions
    
    func configure(with hotel: Hotel) {
        descriptionLabel.text = hotel.about_the_hotel.description
    }
}

