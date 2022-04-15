//
//  CallsToActionContainerView.swift
//  
//
//  Created by waheedCodes on 15/04/2022.
//

import UIKit

class CallsToActionContainerView: UIView {

    // MARK: - Properties
    private let viewTintColor: UIColor

    private lazy var nextButton: UIButton = {
        let button = UIButton()
        button.setTitle(CallToAction.next.description, for: .normal)
        button.layer.borderColor = viewTintColor.cgColor
        button.layer.borderWidth = 2
        button.setTitleColor(viewTintColor, for: .normal)
        button.titleLabel?.font = UIFont(name: "Helvetica neue", size: 16)
        button.layer.cornerRadius = 12
        return button
    }()

    private lazy var getStarteButton: UIButton = {
        let button = UIButton()
        button.setTitle(CallToAction.getStarted.description, for: .normal)
        button.layer.borderColor = viewTintColor.cgColor
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Helvetica neue", size: 16)
        button.backgroundColor = viewTintColor
        button.layer.cornerRadius = 12
        button.layer.shadowColor = viewTintColor.cgColor
        button.layer.shadowOpacity = 0.5
        button.layer.shadowOffset = .init(width: 4, height: 4)
        button.layer.shadowRadius = 8
        return button
    }()

    // MARK: - Initializers
    init(tintColor: UIColor) {
        self.viewTintColor = tintColor
        super.init(frame: .zero)
        layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Object Behaviours
    private func layout() {
        backgroundColor = .systemPink
    }
}
