//
//  HotelViewController.swift
//  AppHotel
//
//  Created by Ravil on 06.09.2023.
//

import UIKit
import SnapKit

final class HotelViewController: UIViewController {

    // MARK: - UI
    
    private lazy var choiceButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("К выбору номера", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = AppColor.blue.uiColor
        button.layer.cornerRadius = 15
        button.titleLabel?.font = UIFont(name: "Montserrat-Medium", size: 16)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        view.addSubview(choiceButton)
        view.backgroundColor = .white
    }
    
    private func setupConstraints() {
        choiceButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview().offset(-28)
            make.height.equalTo(48)
        }
    }
}
