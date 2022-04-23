//
//  AnimatedBarView.swift
//  
//
//  Created by waheedCodes on 15/04/2022.
//

import UIKit

class AnimatedBarView: UIView {

    // MARK: -
    private let barColor: UIColor

    // MARK: - Properties
    private lazy var backgroundBarView: UIView = {
        let view = UIView()
        view.backgroundColor = barColor.withAlphaComponent(0.3)
        view.clipsToBounds = true
        return view
    }()

    private lazy var foregroundBarView: UIView = {
        let view = UIView()
        view.backgroundColor = barColor
        view.alpha = 0.0
        return view
    }()

    // MARK: - Initializers
    init(barColor: UIColor) {
        self.barColor = barColor
        super.init(frame: .zero)
        layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) is not initialized yet")
    }

    // MARK: -
    private func layout() {
        addSubview(backgroundBarView)
        backgroundBarView.addSubview(foregroundBarView)

        backgroundBarView.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }

        foregroundBarView.snp.makeConstraints { make in
            make.edges.equalTo(backgroundBarView)
        }
    }
}
