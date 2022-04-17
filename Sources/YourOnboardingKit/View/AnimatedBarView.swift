//
//  AnimatedBarView.swift
//  
//
//  Created by waheedCodes on 15/04/2022.
//

import UIKit

class AnimatedBarView: UIView {

    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemOrange
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) is not initialized yet")
    }
}
