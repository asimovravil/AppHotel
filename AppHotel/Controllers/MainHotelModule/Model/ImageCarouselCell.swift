//
//  ImageCarouselCell.swift
//  AppHotel
//
//  Created by Ravil on 08.09.2023.
//

import Foundation
import UIKit

class ImageCarouselCell: UIView {
    private var imageViews: [UIImageView] = []
    private var currentIndex: Int = 0

    init(images: [UIImage]) {
        super.init(frame: .zero)
        setupCarousel(images)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    private func setupCarousel(_ images: [UIImage]) {
        for (index, image) in images.enumerated() {
            let imageView = UIImageView(image: image)
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
            imageView.isHidden = index != 0
            imageViews.append(imageView)
            addSubview(imageView)
        }

        for (index, imageView) in imageViews.enumerated() {
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
            imageView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true

            if index == 0 {
                imageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
            } else {
                imageView.leadingAnchor.constraint(equalTo: imageViews[index - 1].trailingAnchor).isActive = true
            }

            if index == imageViews.count - 1 {
                imageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
            }
        }
    }

    func scrollToNext() {
        currentIndex = (currentIndex + 1) % imageViews.count
        UIView.transition(with: self, duration: 0.3, options: .transitionCrossDissolve, animations: {
            self.imageViews.forEach { $0.isHidden = true }
            self.imageViews[self.currentIndex].isHidden = false
        }, completion: nil)
        imageViews[currentIndex].isHidden = true
        currentIndex = (currentIndex + 1) % imageViews.count
        imageViews[currentIndex].isHidden = false

        for i in 0..<currentIndex {
            imageViews[i].isHidden = true
        }
    }
}
