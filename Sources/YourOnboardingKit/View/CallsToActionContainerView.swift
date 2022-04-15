//
//  CallsToActionContainerView.swift
//  
//
//  Created by waheedCodes on 15/04/2022.
//

import UIKit

class CallsToActionContainerView: UIView {

    // MARK: - Notifiers
    var nextButtonTapped: (() -> Void)?
    var getStartedButtonTapped: (() -> Void)?

    // MARK: - Properties
    private let viewTintColor: UIColor

    private lazy var nextButton: UIButton = {
        let button = UIButton()
        button.setTitle(CallToAction.next.description, for: .normal)
        button.layer.borderColor = viewTintColor.cgColor
        button.layer.borderWidth = 2
        button.setTitleColor(viewTintColor, for: .normal)
        button.titleLabel?.font = UIFont(name: "Helvetica neue", size: 18)
        button.layer.cornerRadius = 10
        button.addTarget(self,
                         action: #selector(didTapNextButton),
                         for: .touchUpInside)
        return button
    }()

    private lazy var getStarteButton: UIButton = {
        let button = UIButton()
        button.setTitle(CallToAction.getStarted.description, for: .normal)
        button.layer.borderColor = viewTintColor.cgColor
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Helvetica neue", size: 18)
        button.backgroundColor = viewTintColor
        button.layer.cornerRadius = 10
        button.layer.shadowColor = viewTintColor.cgColor
        button.layer.shadowOpacity = 0.5
        button.layer.shadowOffset = .init(width: 4, height: 4)
        button.layer.shadowRadius = 8
        button.addTarget(self,
                         action: #selector(didTapGetStartedButton),
                         for: .touchUpInside)
        return button
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(
            arrangedSubviews: [
                nextButton,
                getStarteButton
            ])
        stackView.axis = .horizontal
        stackView.spacing = 24
        return stackView
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
        backgroundColor = .white
        addSubview(stackView)

        stackView.snp.makeConstraints { make in
            make.edges
                .equalTo(self)
                .inset(
                    UIEdgeInsets(
                    top: 20,
                    left: 20,
                    bottom: 20,
                    right: 20))
        }

        nextButton.snp.makeConstraints { make in
            make.width
                .equalTo(getStarteButton.snp.width)
                .multipliedBy(0.5)
        }
    }

    @objc private func didTapNextButton(_ sender: UIButton) {
        nextButtonTapped?()
    }

    @objc private func didTapGetStartedButton(_ sender: UIButton) {
        getStartedButtonTapped?()
    }
}
