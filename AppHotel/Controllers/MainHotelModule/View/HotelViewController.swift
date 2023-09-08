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
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    private lazy var choiceButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("К выбору номера", for: .normal)
        button.setTitleColor(AppColor.white.uiColor, for: .normal)
        button.backgroundColor = AppColor.blue.uiColor
        button.layer.cornerRadius = 15
        button.titleLabel?.font = UIFont(name: "SFProDisplay-Medium", size: 16)
        return button
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setupConstraints()
    }
    
    // MARK: - setupViews
    
    private func setupViews() {
        [mainCollectionView, choiceButton].forEach {
            view.addSubview($0)
        }
        view.backgroundColor = AppColor.white.uiColor
    }
    
    // MARK: - setupConstaints
    
    private func setupConstraints() {
        mainCollectionView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalTo(choiceButton.snp.top).offset(-10)
        }
        choiceButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview().offset(-28)
            make.height.equalTo(48)
        }
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
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(530))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(530))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1)
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 10
        return section
    }

    private func detailSectionLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(428))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(428))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1)
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 10
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
