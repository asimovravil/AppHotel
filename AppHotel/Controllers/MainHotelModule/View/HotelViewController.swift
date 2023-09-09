//
//  HotelViewController.swift
//  AppHotel
//
//  Created by Ravil on 06.09.2023.
//

import UIKit
import SnapKit

final class HotelViewController: UIViewController {

    let sections: [SectionType] = [.main, .detail]

    // MARK: - UI
    
    lazy var mainCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(MainCollectionViewCell.self, forCellWithReuseIdentifier: MainCollectionViewCell.reuseID)
        collectionView.register(DetailCollectionViewCell.self, forCellWithReuseIdentifier: DetailCollectionViewCell.reuseID)
        collectionView.backgroundColor = AppColor.gray.uiColor
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()
    
    private lazy var cardButtonView: UIView = {
        let view = UIView()
        view.backgroundColor = AppColor.white.uiColor
        return view
    }()
    
    private lazy var choiceButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("К выбору номера", for: .normal)
        button.setTitleColor(AppColor.white.uiColor, for: .normal)
        button.backgroundColor = AppColor.blue.uiColor
        button.layer.cornerRadius = 15
        button.titleLabel?.font = UIFont(name: "SFProDisplay-Medium", size: 16)
        button.addTarget(self, action: #selector(choiceButtonTapped), for: .touchUpInside)
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
        [mainCollectionView, cardButtonView, choiceButton].forEach {
            view.addSubview($0)
        }
        view.backgroundColor = AppColor.white.uiColor
    }
    
    // MARK: - setupConstaints
    
    private func setupConstraints() {
        mainCollectionView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalTo(choiceButton.snp.top).offset(-12)
        }
        cardButtonView.snp.makeConstraints { make in
            make.top.equalTo(choiceButton.snp.top).offset(-12)
            make.leading.trailing.bottom.equalToSuperview()
        }
        choiceButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview().offset(-28)
            make.height.equalTo(48)
        }
    }
    
    // MARK: - setupNavigationBar
    
    private func setupNavigationBar() {
        self.navigationItem.title = "Отель"
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    // MARK: - Actions
    
    @objc private func choiceButtonTapped() {
        let controller = NumberViewController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    // MARK: - createLayout
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { [weak self] sectionIndex, _ in
            let section = self?.sections[sectionIndex] ?? .main
            switch section {
            case .main:
                return self?.mainSectionLayout()
            case .detail:
                return self?.detailSectionLayout()
            }
        }
    }
    
    private func mainSectionLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(430))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(430))
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(
            top: 0,
            leading: 0,
            bottom: 8,
            trailing: 0
        )
        return section
    }

    private func detailSectionLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(428))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(428))
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(
            top: 0,
            leading: 0,
            bottom: 12,
            trailing: 0
        )
        return section
    }
}

extension HotelViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if sections[indexPath.section] == .main {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainCollectionViewCell.reuseID, for: indexPath) as! MainCollectionViewCell
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailCollectionViewCell.reuseID, for: indexPath) as! DetailCollectionViewCell
            return cell
        }
    }
}
