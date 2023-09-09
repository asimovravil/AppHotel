//
//  NumberViewController.swift
//  AppHotel
//
//  Created by Ravil on 08.09.2023.
//

import UIKit
import SnapKit

final class NumberViewController: UIViewController {
    
    // MARK: - UI
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        let screenHeight = UIScreen.main.bounds.height
        tableView.register(StandardTableViewCell.self, forCellReuseIdentifier: StandardTableViewCell.reuseID)
        tableView.register(LuxeTableViewCell.self, forCellReuseIdentifier: LuxeTableViewCell.reuseID)
        tableView.layer.cornerRadius = 12
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = screenHeight
        tableView.separatorStyle = .none 
        tableView.showsVerticalScrollIndicator = false
        return tableView
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
        view.backgroundColor = AppColor.white.uiColor
    }
    
    // MARK: - setupConstaints
    
    private func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(-24)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview().offset(-34)
        }
    }
    
    // MARK: - Actions
    
    private func setupNavigationBar() {
        self.navigationItem.title = "Steigenberger Makadi"
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
}

extension NumberViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else if section == 1 {
            return 1
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: StandardTableViewCell.reuseID, for: indexPath) as? StandardTableViewCell else {
                fatalError("Could not cast to StandardTableViewCell")
            }
            cell.standartNumberButtonTappedHandler = {
                let bookingViewController = BookingViewController()
                self.navigationController?.pushViewController(bookingViewController, animated: true)
            }
            cell.selectionStyle = .none
            cell.backgroundColor = AppColor.gray.uiColor
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: LuxeTableViewCell.reuseID, for: indexPath) as? LuxeTableViewCell else {
                fatalError("Could not cast to LuxeTableViewCell")
            }
            cell.luxeNumberButtonTappedHandler = {
                let bookingViewController = BookingViewController()
                self.navigationController?.pushViewController(bookingViewController, animated: true)
            }
            cell.selectionStyle = .none
            cell.backgroundColor = AppColor.gray.uiColor
            return cell
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 539.0
        } else if indexPath.section == 1 {
            return 539.0
        }
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 1 {
            let headerView = UIView()
            headerView.backgroundColor = .clear
            let separatorView = UIView()
            separatorView.backgroundColor = AppColor.gray.uiColor
            headerView.addSubview(separatorView)
            
            separatorView.snp.makeConstraints { make in
                make.top.equalToSuperview()
                make.leading.equalToSuperview()
                make.trailing.equalToSuperview()
                make.height.equalTo(8)
            }
            
            return headerView
        }
        
        return nil
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 1 {
            return 8
        }
        
        return 0
    }
}
