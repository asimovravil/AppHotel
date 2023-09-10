//
//  BookingTableViewCell.swift
//  AppHotel
//
//  Created by Ravil on 09.09.2023.
//

import UIKit
import SnapKit
import InputMask

final class BookingTableViewCell: UITableViewCell {
    static let reuseID = String(describing: BookingTableViewCell.self)
    var addTouristButtonAction: (() -> Void)?
    
    // MARK: - MaskedTextField Listener
    
    private lazy var phoneListener: MaskedTextFieldDelegate = {
        let listener = MaskedTextFieldDelegate()
        listener.onMaskedTextChangedCallback = { textField, _, isFilled in
            let updatedText = textField.text ?? ""
            if isFilled {
                print("Text field is filled: \(updatedText)")
            }
        }
        listener.delegate = self
        listener.primaryMaskFormat = "+7 ([000]) [000] [00] [00]"
        return listener
    }()
    
    // MARK: - UI
    
    private lazy var cardInfoView: UIView = {
        let view = UIView()
        view.backgroundColor = AppColor.white.uiColor
        view.layer.cornerRadius = 15
        return view
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
    
    private lazy var cardDescriptionView: UIView = {
        let view = UIView()
        view.backgroundColor = AppColor.white.uiColor
        view.layer.cornerRadius = 12
        return view
    }()
    
    private lazy var departureTitle: UILabel = {
        let label = UILabel()
        label.text = "Вылет из"
        label.textColor = AppColor.grayDark.uiColor
        label.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        return label
    }()
    
    private lazy var departureSubTitle: UILabel = {
        let label = UILabel()
        label.text = "Санкт-Петербург"
        label.textColor = AppColor.black.uiColor
        label.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var cityTitle: UILabel = {
        let label = UILabel()
        label.text = "Страна, город"
        label.textColor = AppColor.grayDark.uiColor
        label.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        return label
    }()
    
    private lazy var citySubTitle: UILabel = {
        let label = UILabel()
        label.text = "Египет, Хургада"
        label.textColor = AppColor.black.uiColor
        label.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var dateTitle: UILabel = {
        let label = UILabel()
        label.text = "Даты"
        label.textColor = AppColor.grayDark.uiColor
        label.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        return label
    }()
    
    private lazy var dateSubTitle: UILabel = {
        let label = UILabel()
        label.text = "19.09.2023 – 27.09.2023"
        label.textColor = AppColor.black.uiColor
        label.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var dayTitle: UILabel = {
        let label = UILabel()
        label.text = "Кол-во ночей"
        label.textColor = AppColor.grayDark.uiColor
        label.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        return label
    }()
    
    private lazy var daySubTitle: UILabel = {
        let label = UILabel()
        label.text = "7 ночей"
        label.textColor = AppColor.black.uiColor
        label.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var hotelTitle: UILabel = {
        let label = UILabel()
        label.text = "Отель"
        label.textColor = AppColor.grayDark.uiColor
        label.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        return label
    }()
    
    private lazy var hotelSubTitle: UILabel = {
        let label = UILabel()
        label.text = "Steigenberger Makadi"
        label.textColor = AppColor.black.uiColor
        label.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var numberTitle: UILabel = {
        let label = UILabel()
        label.text = "Номер"
        label.textColor = AppColor.grayDark.uiColor
        label.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        return label
    }()
    
    private lazy var numberSubTitle: UILabel = {
        let label = UILabel()
        label.text = "Стандартный с видом на бассейн или сад"
        label.textColor = AppColor.black.uiColor
        label.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var nutritionTitle: UILabel = {
        let label = UILabel()
        label.text = "Питание"
        label.textColor = AppColor.grayDark.uiColor
        label.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        return label
    }()
    
    private lazy var nutritionSubTitle: UILabel = {
        let label = UILabel()
        label.text = "Все включено"
        label.textColor = AppColor.black.uiColor
        label.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var cardBuyerInformationView: UIView = {
        let view = UIView()
        view.backgroundColor = AppColor.white.uiColor
        view.layer.cornerRadius = 12
        return view
    }()
    
    private lazy var buyerTitle: UILabel = {
        let label = UILabel()
        label.text = "Информация о покупателе"
        label.textColor = AppColor.black.uiColor
        label.font = UIFont(name: "SFProDisplay-Medium", size: 22)
        return label
    }()
    
    private lazy var phoneBuyerTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Номер телефона"
        textField.backgroundColor = AppColor.gray.uiColor
        textField.borderStyle = .none
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.cornerRadius = 10
        textField.textColor = AppColor.textField.uiColor
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 0))
        textField.leftViewMode = .always
        textField.delegate = phoneListener
        textField.keyboardType = .numberPad
        return textField
    }()
    
    private lazy var emailBuyerTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Почта"
        textField.backgroundColor = AppColor.gray.uiColor
        textField.borderStyle = .none
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.cornerRadius = 10
        textField.textColor = AppColor.textField.uiColor
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 0))
        textField.leftViewMode = .always
        textField.keyboardType = .emailAddress
        return textField
    }()
    
    private lazy var buyerSubTitle: UILabel = {
        let label = UILabel()
        label.text = "Эти данные никому не передаются. После оплаты мы вышли чек на указанный вами номер и почту"
        label.textColor = AppColor.grayDark.uiColor
        label.font = UIFont(name: "SFProDisplay-Regular", size: 14)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var cardAddView: UIView = {
        let view = UIView()
        view.backgroundColor = AppColor.white.uiColor
        view.layer.cornerRadius = 12
        return view
    }()
    
    private lazy var touristAddTitle: UILabel = {
        let label = UILabel()
        label.text = "Добавить туриста"
        label.textColor = AppColor.black.uiColor
        label.font = UIFont(name: "SFProDisplay-Medium", size: 22)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var addButton: UIButton = {
        let addButton = UIButton(type: .system)
        addButton.setImage(AppImage.addbutton.uiImage, for: .normal)
        addButton.addTarget(self, action: #selector(addTouristButtonTapped), for: .touchUpInside)
        return addButton
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
        [cardInfoView, starImageView, cardGradeView, cardGradeLabel, nameHotelLabel, detailHotelLabel, cardDescriptionView, departureTitle, departureSubTitle, cityTitle, citySubTitle, dateTitle, dateSubTitle, dayTitle, daySubTitle, hotelTitle, hotelSubTitle, numberTitle, numberSubTitle, nutritionTitle, nutritionSubTitle, cardBuyerInformationView, buyerTitle, phoneBuyerTextField, emailBuyerTextField, buyerSubTitle, cardAddView, touristAddTitle, addButton].forEach {
            contentView.addSubview($0)
        }
    }
    
    // MARK: - setupConstraints
    
    private func setupConstraints() {
        cardInfoView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(120)
        }
        cardGradeView.snp.makeConstraints { make in
            make.top.equalTo(cardInfoView.snp.top).offset(16)
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
        cardDescriptionView.snp.makeConstraints { make in
            make.top.equalTo(cardInfoView.snp.bottom).offset(8)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(280)
        }
        departureTitle.snp.makeConstraints { make in
            make.top.equalTo(cardDescriptionView.snp.top).offset(16)
            make.leading.equalTo(cardDescriptionView.snp.leading).offset(16)
        }
        departureSubTitle.snp.makeConstraints { make in
            make.top.equalTo(cardDescriptionView.snp.top).offset(16)
            make.leading.equalTo(departureTitle.snp.trailing).offset(76)
        }
        cityTitle.snp.makeConstraints { make in
            make.top.equalTo(departureTitle.snp.bottom).offset(16)
            make.leading.equalTo(cardDescriptionView.snp.leading).offset(16)
        }
        citySubTitle.snp.makeConstraints { make in
            make.top.equalTo(departureSubTitle.snp.bottom).offset(16)
            make.leading.equalTo(cityTitle.snp.trailing).offset(39)
        }
        dateTitle.snp.makeConstraints { make in
            make.top.equalTo(cityTitle.snp.bottom).offset(16)
            make.leading.equalTo(cardDescriptionView.snp.leading).offset(16)
        }
        dateSubTitle.snp.makeConstraints { make in
            make.top.equalTo(citySubTitle.snp.bottom).offset(16)
            make.leading.equalTo(dateTitle.snp.trailing).offset(103)
        }
        dayTitle.snp.makeConstraints { make in
            make.top.equalTo(dateTitle.snp.bottom).offset(16)
            make.leading.equalTo(cardDescriptionView.snp.leading).offset(16)
        }
        daySubTitle.snp.makeConstraints { make in
            make.top.equalTo(dateSubTitle.snp.bottom).offset(16)
            make.leading.equalTo(dayTitle.snp.trailing).offset(44)
        }
        hotelTitle.snp.makeConstraints { make in
            make.top.equalTo(dayTitle.snp.bottom).offset(16)
            make.leading.equalTo(cardDescriptionView.snp.leading).offset(16)
        }
        hotelSubTitle.snp.makeConstraints { make in
            make.top.equalTo(daySubTitle.snp.bottom).offset(16)
            make.leading.equalTo(hotelTitle.snp.trailing).offset(97)
        }
        numberTitle.snp.makeConstraints { make in
            make.top.equalTo(hotelTitle.snp.bottom).offset(16)
            make.leading.equalTo(cardDescriptionView.snp.leading).offset(16)
            make.width.equalTo(49)
        }
        numberSubTitle.snp.makeConstraints { make in
            make.top.equalTo(hotelSubTitle.snp.bottom).offset(16)
            make.leading.equalTo(numberTitle.snp.trailing).offset(91)
            make.trailing.equalTo(cardDescriptionView.snp.trailing).offset(-16)
        }
        nutritionTitle.snp.makeConstraints { make in
            make.leading.equalTo(cardDescriptionView.snp.leading).offset(16)
            make.bottom.equalTo(cardDescriptionView.snp.bottom).offset(-16)
        }
        nutritionSubTitle.snp.makeConstraints { make in
            make.leading.equalTo(nutritionTitle.snp.trailing).offset(79)
            make.bottom.equalTo(cardDescriptionView.snp.bottom).offset(-16)
        }
        cardBuyerInformationView.snp.makeConstraints { make in
            make.top.equalTo(cardDescriptionView.snp.bottom).offset(8)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(232)
        }
        buyerTitle.snp.makeConstraints { make in
            make.top.equalTo(cardBuyerInformationView.snp.top).offset(16)
            make.leading.equalTo(cardBuyerInformationView.snp.leading).offset(16)
        }
        phoneBuyerTextField.snp.makeConstraints { make in
            make.top.equalTo(buyerTitle.snp.bottom).offset(20)
            make.leading.equalTo(cardBuyerInformationView.snp.leading).offset(16)
            make.trailing.equalTo(cardBuyerInformationView.snp.trailing).offset(-16)
            make.height.equalTo(52)
        }
        emailBuyerTextField.snp.makeConstraints { make in
            make.top.equalTo(phoneBuyerTextField.snp.bottom).offset(8)
            make.leading.equalTo(cardBuyerInformationView.snp.leading).offset(16)
            make.trailing.equalTo(cardBuyerInformationView.snp.trailing).offset(-16)
            make.height.equalTo(52)
        }
        buyerSubTitle.snp.makeConstraints { make in
            make.top.equalTo(emailBuyerTextField.snp.bottom).offset(8)
            make.leading.equalTo(cardBuyerInformationView.snp.leading).offset(16)
            make.trailing.equalTo(cardBuyerInformationView.snp.trailing).offset(-16)
        }
        cardAddView.snp.makeConstraints { make in
            make.top.equalTo(cardBuyerInformationView.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(58)
        }
        touristAddTitle.snp.makeConstraints { make in
            make.top.equalTo(cardAddView.snp.top).offset(16)
            make.leading.equalTo(cardAddView.snp.leading).offset(16)
        }
        addButton.snp.makeConstraints { make in
            make.top.equalTo(cardAddView.snp.top).offset(13)
            make.trailing.equalTo(cardAddView.snp.trailing).offset(-16)
            make.size.equalTo(32)
        }
    }
    
    // MARK: - Actions
    
    @objc private func addTouristButtonTapped() {
        addTouristButtonAction?()
    }
    
    func configure(with book: Book) {
        departureSubTitle.text = book.departure
        citySubTitle.text = book.arrival_country
        dateSubTitle.text = "\(book.tour_date_start) - \(book.tour_date_stop)"
        daySubTitle.text = "\(book.number_of_nights) ночей"
        numberSubTitle.text = book.room
        nutritionSubTitle.text = book.nutrition
    }
}
