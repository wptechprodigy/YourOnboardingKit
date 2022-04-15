import UIKit

public class OnboardingKit {

    // MARK: - Properties
    private let slides: [Slide]
    private let tintColor: UIColor

    private lazy var onboardingViewController: OnboardingViewController = {
        let controller = OnboardingViewController(
            slides: slides,
            tintColor: tintColor)
        controller.modalTransitionStyle = .crossDissolve
        controller.modalPresentationStyle = .fullScreen
        return controller
    }()

    // MARK: - Initializer
    public init(slides: [Slide],
                tintColor: UIColor) {
        self.slides = slides
        self.tintColor = tintColor
    }
 
    // MARK: - Public APIs
    public func launchOnboarding(
        with rootViewController: UIViewController) {
            rootViewController.present(
                onboardingViewController,
                animated: true,
                 completion: nil)
    }

    public func dismissOnboarding() {

    }
}
