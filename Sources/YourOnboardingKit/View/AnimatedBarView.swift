//
//  AnimatedBarView.swift
//  
//
//  Created by waheedCodes on 15/04/2022.
//

import UIKit
import Combine

class AnimatedBarView: UIView {

    // MARK: -
    enum State {
        case clear
        case animating
        case filled
    }

    // MARK: -
    private let barColor: UIColor
    @Published private var state: State = .clear
    private var subscribers = Set<AnyCancellable>()
    private var animator: UIViewPropertyAnimator!

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
        setUpAnimator()
        observe()
        layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) is not initialized yet")
    }

    // MARK: -
    private func setUpAnimator() {
        animator = UIViewPropertyAnimator(
            duration: 3.0,
            curve: .easeInOut,
            animations: {
                self.foregroundBarView.transform = .identity
            })
    }

    private func observe() {
        $state.sink { [unowned self] state in
            switch state {
                case .clear:
                    setUpAnimator()
                    foregroundBarView.alpha = 0.0
                    animator.stopAnimation(false)
                case .animating:
                    foregroundBarView.transform = .init(
                        scaleX: 0, y: 1.0)
                    foregroundBarView.transform = .init(
                        translationX: -frame.size.width, y: 0)
                    foregroundBarView.alpha = 1.0
                    animator.startAnimation()
                case .filled:
                    animator.stopAnimation(true)
                    foregroundBarView.transform = .identity
            }
        }.store(in: &subscribers)
    }

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

    // MARK: - Access Points
    func startAnimating() {
        state = .animating
    }

    func reset() {
        state = .clear
    }

    func complete() {
        state = .filled
    }
}
