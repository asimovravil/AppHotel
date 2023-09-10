//
//  TouristTableViewCell.swift
//  AppHotel
//
//  Created by Ravil on 09.09.2023.
//

import UIKit
import SnapKit

final class TouristTableViewCell: UITableViewCell {
    static let reuseID = String(describing: TouristTableViewCell.self)
    private var isCardViewVisible = true
    private var cardViewHeightConstraint: Constraint?
    private var nameTouristTextFieldHeightConstraint: Constraint?
    private var lastNameTouristTextFieldHeightConstraint: Constraint?
    private var dateTouristTextFieldHeightConstraint: Constraint?
    private var citizenshipTouristTextFieldHeightConstraint: Constraint?
    private var passportTouristTextFieldHeightConstraint: Constraint?
    private var datePassportTouristTextFieldHeightConstraint: Constraint?


    // MARK: - UI
    
    private lazy var cardArrowView: UIView = {
        let view = UIView()
        let alpha: CGFloat = 0.2
        view.backgroundColor = UIColor(red: 13/255, green: 114/255, blue: 255/255, alpha: alpha)
        view.layer.cornerRadius = 5
        return view
    }()
    
    private lazy var toggleCardButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(AppColor.blue.uiColor, for: .normal)
        button.addTarget(self, action: #selector(toggleCardView), for: .touchUpInside)
        button.imageView?.contentMode = .scaleAspectFit
        button.contentHorizontalAlignment = .fill
        button.contentVerticalAlignment = .fill
        return button
    }()

    
    private lazy var cardTouristView: UIView = {
        let view = UIView()
        view.backgroundColor = AppColor.white.uiColor
        view.layer.cornerRadius = 12
        return view
    }()
    
    public lazy var touristTitle: UILabel = {
        let label = UILabel()
        label.text = "Первый турист"
        label.textColor = AppColor.black.uiColor
        label.font = UIFont(name: "SFProDisplay-Medium", size: 22)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var nameTouristTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Имя"
        textField.backgroundColor = AppColor.gray.uiColor
        textField.borderStyle = .none
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.cornerRadius = 10
        textField.textColor = AppColor.textField.uiColor
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 0))
        textField.leftViewMode = .always
        return textField
    }()
    
    private lazy var lastNameTouristTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Фамилия"
        textField.backgroundColor = AppColor.gray.uiColor
        textField.borderStyle = .none
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.cornerRadius = 10
        textField.textColor = AppColor.textField.uiColor
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 0))
        textField.leftViewMode = .always
        return textField
    }()
    
    private lazy var dateTouristTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Дата рождения"
        textField.backgroundColor = AppColor.gray.uiColor
        textField.borderStyle = .none
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.cornerRadius = 10
        textField.textColor = AppColor.textField.uiColor
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 0))
        textField.leftViewMode = .always
        return textField
    }()
    
    private lazy var citizenshipTouristTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Гражданство"
        textField.backgroundColor = AppColor.gray.uiColor
        textField.borderStyle = .none
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.cornerRadius = 10
        textField.textColor = AppColor.textField.uiColor
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 0))
        textField.leftViewMode = .always
        return textField
    }()
    
    private lazy var passportTouristTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Номер загранпаспорта"
        textField.backgroundColor = AppColor.gray.uiColor
        textField.borderStyle = .none
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.cornerRadius = 10
        textField.textColor = AppColor.textField.uiColor
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 0))
        textField.leftViewMode = .always
        return textField
    }()
    
    private lazy var datePassportTouristTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Срок действия загранпаспорта"
        textField.backgroundColor = AppColor.gray.uiColor
        textField.borderStyle = .none
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.cornerRadius = 10
        textField.textColor = AppColor.textField.uiColor
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 0))
        textField.leftViewMode = .always
        return textField
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
        [cardTouristView, touristTitle, nameTouristTextField, lastNameTouristTextField, dateTouristTextField, citizenshipTouristTextField, passportTouristTextField, datePassportTouristTextField].forEach {
            contentView.addSubview($0)
        }
        cardTouristView.addSubview(cardArrowView)
        cardTouristView.addSubview(toggleCardButton)
        
        let arrowImage = isCardViewVisible ? UIImage(named: "vectorup") : UIImage(named: "vectordown")
        toggleCardButton.setImage(arrowImage, for: .normal)
    }

    // MARK: - setupConstraints

    private func setupConstraints() {
        cardArrowView.snp.makeConstraints { make in
            make.top.equalTo(cardTouristView.snp.top).offset(13)
            make.trailing.equalTo(cardTouristView.snp.trailing).offset(-16)
            make.size.equalTo(32)
        }
        toggleCardButton.snp.makeConstraints { make in
            make.top.equalTo(cardArrowView.snp.top).offset(8)
            make.leading.equalTo(cardArrowView.snp.leading).offset(9)
            make.trailing.equalTo(cardArrowView.snp.trailing).offset(-9)
            make.bottom.equalTo(cardArrowView.snp.bottom).offset(-8)
        }
        cardTouristView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            cardViewHeightConstraint = make.height.equalTo(430).constraint
            make.bottom.equalToSuperview().offset(-8)
        }
        touristTitle.snp.makeConstraints { make in
            make.top.equalTo(cardTouristView.snp.top).offset(16)
            make.leading.equalTo(cardTouristView.snp.leading).offset(16)
        }
        nameTouristTextField.snp.makeConstraints { make in
            make.top.equalTo(touristTitle.snp.bottom).offset(20)
            make.leading.equalTo(cardTouristView.snp.leading).offset(16)
            make.trailing.equalTo(cardTouristView.snp.trailing).offset(-16)
            nameTouristTextFieldHeightConstraint = make.height.equalTo(52).constraint
        }

        lastNameTouristTextField.snp.makeConstraints { make in
            make.top.equalTo(nameTouristTextField.snp.bottom).offset(8)
            make.leading.equalTo(cardTouristView.snp.leading).offset(16)
            make.trailing.equalTo(cardTouristView.snp.trailing).offset(-16)
            lastNameTouristTextFieldHeightConstraint = make.height.equalTo(52).constraint
        }

        dateTouristTextField.snp.makeConstraints { make in
            make.top.equalTo(lastNameTouristTextField.snp.bottom).offset(8)
            make.leading.equalTo(cardTouristView.snp.leading).offset(16)
            make.trailing.equalTo(cardTouristView.snp.trailing).offset(-16)
            dateTouristTextFieldHeightConstraint = make.height.equalTo(52).constraint
        }

        citizenshipTouristTextField.snp.makeConstraints { make in
            make.top.equalTo(dateTouristTextField.snp.bottom).offset(8)
            make.leading.equalTo(cardTouristView.snp.leading).offset(16)
            make.trailing.equalTo(cardTouristView.snp.trailing).offset(-16)
            citizenshipTouristTextFieldHeightConstraint = make.height.equalTo(52).constraint
        }

        passportTouristTextField.snp.makeConstraints { make in
            make.top.equalTo(citizenshipTouristTextField.snp.bottom).offset(8)
            make.leading.equalTo(cardTouristView.snp.leading).offset(16)
            make.trailing.equalTo(cardTouristView.snp.trailing).offset(-16)
            passportTouristTextFieldHeightConstraint = make.height.equalTo(52).constraint
        }

        datePassportTouristTextField.snp.makeConstraints { make in
            make.top.equalTo(passportTouristTextField.snp.bottom).offset(8)
            make.leading.equalTo(cardTouristView.snp.leading).offset(16)
            make.trailing.equalTo(cardTouristView.snp.trailing).offset(-16)
            datePassportTouristTextFieldHeightConstraint = make.height.equalTo(52).constraint
        }

    }
    
    // MARK: - Actions
    
    @objc private func toggleCardView() {
        let hasTextInFields = !nameTouristTextField.text!.isEmpty ||
        !lastNameTouristTextField.text!.isEmpty ||
        !dateTouristTextField.text!.isEmpty ||
        !citizenshipTouristTextField.text!.isEmpty ||
        !passportTouristTextField.text!.isEmpty ||
        !datePassportTouristTextField.text!.isEmpty

        guard !hasTextInFields else { return }
        
        toggleCardViewVisibility()
    }
    
    private func toggleCardViewVisibility() {
        isCardViewVisible.toggle()
        
        let textFieldHeight: CGFloat = isCardViewVisible ? 52 : 0
        
        nameTouristTextFieldHeightConstraint?.update(offset: textFieldHeight)
        lastNameTouristTextFieldHeightConstraint?.update(offset: textFieldHeight)
        dateTouristTextFieldHeightConstraint?.update(offset: textFieldHeight)
        citizenshipTouristTextFieldHeightConstraint?.update(offset: textFieldHeight)
        passportTouristTextFieldHeightConstraint?.update(offset: textFieldHeight)
        datePassportTouristTextFieldHeightConstraint?.update(offset: textFieldHeight)
        
        cardViewHeightConstraint?.update(offset: isCardViewVisible ? 430 : 62)
        
        let arrowImage = isCardViewVisible ? UIImage(named: "vectorup") : UIImage(named: "vectordown")
        toggleCardButton.setImage(arrowImage, for: .normal)
        
        UIView.animate(withDuration: 0.3) { [weak self] in
            guard let self = self else { return }
            self.contentView.layoutIfNeeded()
        }
    }
    func configure(with tourist: Tourist) {
          // Set the text fields' values based on the tourist data
          nameTouristTextField.text = tourist.name
          lastNameTouristTextField.text = tourist.lastName
          dateTouristTextField.text = tourist.dateOfBirth
          citizenshipTouristTextField.text = tourist.citizenship
          passportTouristTextField.text = tourist.passportNumber
          datePassportTouristTextField.text = tourist.passportExpirationDate
      }
}
