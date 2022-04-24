//
//  TransitionView.swift
//  
//
//  Created by waheedCodes on 15/04/2022.
//

import UIKit

class TransitionView: UIView {

    // MARK: - Number of slides
    private let slides: [Slide]
    private let viewTintColor: UIColor
    private var slideIndex: Int = -1

    // MARK: - Timer
    private var timer: DispatchSourceTimer?

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()

    private lazy var barViews: [AnimatedBarView] = {
        var barViews: [AnimatedBarView] = []
        slides.forEach { _ in
            barViews.append(
                AnimatedBarView(
                    barColor: viewTintColor))
        }
        return barViews
    }()

    private lazy var barStackView: UIStackView = {
        let stackView = UIStackView()
        barViews.forEach { barView in
            stackView.addArrangedSubview(barView)
        }
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.distribution = .fillEqually
        return stackView
    }()

    private lazy var captionView: CaptionView = {
        let captionView = CaptionView()
        return captionView
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [imageView, captionView])
        stackView.axis = .vertical
        stackView.distribution = .fill
        return stackView
    }()

    // MARK: - Initializers
    init(slides: [Slide], tintColor: UIColor) {
        self.slides = slides
        self.viewTintColor = tintColor
        super.init(frame: .zero)
        layoutViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func layoutViews() {

        addSubview(stackView)
        addSubview(barStackView)

        stackView.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }

        barStackView.snp.makeConstraints { make in
            make.leading.equalTo(snp.leading).offset(20)
            make.trailing.equalTo(snp.trailing).offset(-20)
            make.top.equalTo(snp.topMargin)
            make.height.equalTo(4)
        }

        imageView.snp.makeConstraints { make in
            make.height.equalTo(stackView.snp.height).multipliedBy(0.8)
        }
    }

    // MARK: - Object methods
    func start() {
        buildTimerIfNeeded()
        timer?.resume()
    }

    func stop() {
        timer?.cancel()
        timer = nil
    }

    private func buildTimerIfNeeded() {
        guard timer == nil else { return }
        timer = DispatchSource.makeTimerSource()
        timer?.schedule(deadline: .now(), repeating: .seconds(3), leeway: .seconds(1))
        timer?.setEventHandler(handler: {
            self.showNext()
        })
    }

    private func showNext() {

        let nextImage: UIImage
        let nextCaption: String
        let nextBarView: AnimatedBarView

        if slides.indices.contains(slideIndex + 1) {
            nextImage = slides[slideIndex + 1].image
            nextCaption = slides[slideIndex + 1].caption
            nextBarView = barViews[slideIndex + 1]
            slideIndex += 1
        } else {
            nextImage = slides[0].image
            nextCaption = slides[0].caption
            nextBarView = barViews[0]
            slideIndex = 0
        }

        DispatchQueue.main.async {
            UIView.transition(
                with: self.imageView,
                duration: 0.5,
                options: .transitionCrossDissolve,
                animations: {
                    self.imageView.image = nextImage
                },
                completion: nil)

            self.captionView.setTitle(as: nextCaption)
            nextBarView.startAnimating()
        }
    }
}
