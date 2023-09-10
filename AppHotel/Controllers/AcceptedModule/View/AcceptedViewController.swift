//
//  AcceptedViewController.swift
//  AppHotel
//
//  Created by Ravil on 09.09.2023.
//

import UIKit
import SnapKit

final class AcceptedViewController: UIViewController {

    // MARK: - UI
    
    private lazy var acceptedImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = AppImage.accepted.uiImage
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var acceptedTitle: UILabel = {
        let label = UILabel()
        label.text = "Ваш заказ принят в работу"
        label.textColor = AppColor.black.uiColor
        label.font = UIFont(name: "SFProDisplay-Medium", size: 22)
        return label
    }()
    
    private lazy var acceptedSubTitle: UILabel = {
        let label = UILabel()
        label.text = "Подтверждение заказа №\(generateRandomOrderNumber()) может\nзанять некоторое время (от 1 часа до суток).\nКак только мы получим ответ от\nтуроператора, вам на почту придет уведомление."
        label.textColor = AppColor.grayDark.uiColor
        label.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var cardButtonView: UIView = {
        let view = UIView()
        view.backgroundColor = AppColor.white.uiColor
        view.layer.borderWidth = 1
        view.layer.borderColor = AppColor.gray.uiColor.cgColor
        return view
    }()
    
    private lazy var acceptedButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Супер!", for: .normal)
        button.setTitleColor(AppColor.white.uiColor, for: .normal)
        button.backgroundColor = AppColor.blue.uiColor
        button.layer.cornerRadius = 15
        button.titleLabel?.font = UIFont(name: "SFProDisplay-Medium", size: 16)
        button.addTarget(self, action: #selector(acceptedButtonTapped), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setupConstraints()
        setupNavigationBar()
    }
    
    // MARK: - setupViews
    
    private func setupViews() {
        [acceptedImageView, acceptedTitle, acceptedSubTitle, cardButtonView, acceptedButton].forEach {
            view.addSubview($0)
        }
        view.backgroundColor = AppColor.white.uiColor
    }
    
    // MARK: - setupConstraints
    
    private func setupConstraints() {
        acceptedImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(223)
            make.leading.equalToSuperview().offset(140)
            make.trailing.equalToSuperview().offset(-141)
        }
        acceptedTitle.snp.makeConstraints { make in
            make.top.equalTo(acceptedImageView.snp.bottom).offset(32)
            make.centerX.equalTo(acceptedImageView.snp.centerX)
        }
        acceptedSubTitle.snp.makeConstraints { make in
            make.top.equalTo(acceptedTitle.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(23)
            make.trailing.equalToSuperview().offset(-23)
        }
        cardButtonView.snp.makeConstraints { make in
            make.top.equalTo(acceptedButton.snp.top).offset(-12)
            make.leading.trailing.bottom.equalToSuperview()
        }
        acceptedButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview().offset(-28)
            make.height.equalTo(48)
        }
    }
    
    // MARK: - setupNavigationBar
    
    private func setupNavigationBar() {
        self.navigationItem.title = "Заказ оплачен"
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    // MARK: - Actions
    
    @objc private func acceptedButtonTapped() {
        let controller = HotelViewController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    // MARK: - Helper Methods
    
    private func generateRandomOrderNumber() -> Int {
        return Int.random(in: 100000...999999)
    }
}
