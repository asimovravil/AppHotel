//
//  BookingViewController.swift
//  AppHotel
//
//  Created by Ravil on 09.09.2023.
//

import UIKit
import SnapKit

final class BookingViewController: UIViewController {
    
    var tourists: [Tourist] = []
    
    // MARK: - UI
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        let screenHeight = UIScreen.main.bounds.height
        tableView.register(BookingTableViewCell.self, forCellReuseIdentifier: BookingTableViewCell.reuseID)
        tableView.register(TouristTableViewCell.self, forCellReuseIdentifier: TouristTableViewCell.reuseID)
        tableView.layer.cornerRadius = 12
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = screenHeight
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    
    private lazy var cardButtonView: UIView = {
        let view = UIView()
        view.backgroundColor = AppColor.white.uiColor
        return view
    }()
    
    private lazy var paymentButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Оплатить 198 036 ₽", for: .normal)
        button.setTitleColor(AppColor.white.uiColor, for: .normal)
        button.backgroundColor = AppColor.blue.uiColor
        button.layer.cornerRadius = 15
        button.titleLabel?.font = UIFont(name: "SFProDisplay-Medium", size: 16)
        button.addTarget(self, action: #selector(paymentButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var cardAddButton: UIView = {
        let view = UIView()
        view.backgroundColor = AppColor.white.uiColor
        view.layer.cornerRadius = 12
        return view
    }()
    
    private lazy var addTouristTitle: UILabel = {
        let label = UILabel()
        label.text = "Добавить туриста"
        label.textColor = AppColor.black.uiColor
        label.font = UIFont(name: "SFProDisplay-Medium", size: 22)
        label.numberOfLines = 0
        return label
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
        view.addSubview(tableView)
        [tableView, cardButtonView, paymentButton, cardAddButton, addTouristTitle].forEach {
            view.addSubview($0)
        }
        view.backgroundColor = AppColor.white.uiColor
    }
    
    // MARK: - setupConstraints
    
    private func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalTo(paymentButton.snp.top).offset(-12)
        }
        cardButtonView.snp.makeConstraints { make in
            make.top.equalTo(paymentButton.snp.top).offset(-12)
            make.leading.trailing.bottom.equalToSuperview()
        }
        paymentButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview().offset(-28)
            make.height.equalTo(48)
        }
    }
    
    // MARK: - setupNavigationBar
    
    private func setupNavigationBar() {
        self.navigationItem.title = "Бронирование"
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    // MARK: - Actions
    
    @objc private func paymentButtonTapped() {
        let controller = AcceptedViewController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
}

extension BookingViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else if section == 1 {
            return tourists.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 730.0
        } else if indexPath.section == 1 {
            return 900.0
        }
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: BookingTableViewCell.reuseID, for: indexPath) as? BookingTableViewCell else {
                fatalError("Could not cast to BookingTableViewCell")
            }
            cell.addTouristButtonAction = { [weak self] in
                let newTourist = Tourist()
                self?.tourists.append(newTourist)
                self?.tableView.reloadData()
            }
            cell.selectionStyle = .none
            cell.backgroundColor = AppColor.gray.uiColor
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TouristTableViewCell.reuseID, for: indexPath) as? TouristTableViewCell else {
                fatalError("Could not cast to TouristTableViewCell")
            }
            let tourist = tourists[indexPath.row]
            cell.configure(with: tourist)
            cell.selectionStyle = .none
            cell.backgroundColor = AppColor.gray.uiColor
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}


