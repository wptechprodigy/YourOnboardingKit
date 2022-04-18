//
//  CaptionView.swift
//  
//
//  Created by waheedCodes on 15/04/2022.
//

import UIKit

class CaptionView: UIView {

    // MARK: - Properties
    private let captionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Helvetica neue", size: 28)
        label.textColor = .label
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
    }()

    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) is not initialized yet")
    }

    // MARK: - Public Object methods
    func setTitle(as text: String) {
        captionLabel.text = text
    }

    // MARK: - Private Object methods
    private func layout() {
        backgroundColor = .systemBackground
        addSubview(captionLabel)
        setupConstraints()
    }

    private func setupConstraints() {
        captionLabel.snp.makeConstraints { make in
            make.top.equalTo(snp.top).offset(24)
            make.trailing.equalTo(snp.trailing).offset(-24)
            make.bottom.equalTo(snp.bottom).offset(-24)
            make.leading.equalTo(snp.leading).offset(24)
        }
    }
}
