//
//  OnboardingViewController.swift
//  
//
//  Created by waheedCodes on 15/04/2022.
//

import UIKit
import SnapKit

class OnboardingViewController: UIViewController {

    // MARK: - Properties
    private let slides: [Slide]
    private let tintColor: UIColor

    private lazy var transitionView: TransitionView = {
        let view = TransitionView(slides: slides, tintColor: tintColor)
        return view
    }()

    private lazy var callsToActionContainerView: CallsToActionContainerView = {
        let view = CallsToActionContainerView(tintColor: tintColor)
        view.nextButtonTapped = {
            print(">> Next button tapped...")
        }
        view.getStartedButtonTapped = {
            print(">> Get Started button tapped...")
        }
        return view
    }()

    private lazy var stackView: UIStackView = {
        let view = UIStackView(
            arrangedSubviews: [
                transitionView,
                callsToActionContainerView
            ])
        view.axis = .vertical
        return view
    }()

    // MARK: - Initializers
    init(slides: [Slide], tintColor: UIColor) {
        self.slides = slides
        self.tintColor = tintColor
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Object Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }

    // MARK: - Configure View Elements
    private func setupViews() {
        self.view.addSubview(stackView)

        stackView.snp.makeConstraints { make in
            make.edges.equalTo(self.view)
        }

        callsToActionContainerView.snp.makeConstraints { make in
            make.height.equalTo(120)
        }
    }
}
