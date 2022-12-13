//
//  Helper.swift
//  Font Changer
//
//  Created by Y. Yılmaz Erdoğmuş on 07.12.2022.
//

import Foundation
import MessageUI
import StoreKit
import UIKit
import Lottie


final class Helpers {
    static func showCustomAlert(title: String, message: String, viewController: UIViewController) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
        viewController.present(alert, animated: true, completion: nil)
    }

    static func showCustomAlert(title: String,
                                message: String,
                                buttonTitle: String,
                                viewController: UIViewController,
                                completion: @escaping () -> Void)
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: buttonTitle, style: UIAlertAction.Style.default, handler: { _ in
            completion()
        }))
        viewController.present(alert, animated: true, completion: nil)
    }

    static func vibrate(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
    }

    static func showRatePopup() {
        if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            if #available(iOS 14.0, *) {
                SKStoreReviewController.requestReview(in: scene)
            } else {
                print("Rate us button else mode.")
            }
        }
    }

    static func openLinkFromBrowser(_ url: URL) {
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:])
        }
    }

    static func openMailView(viewController: UIViewController) {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = viewController.self as? any MFMailComposeViewControllerDelegate
            mail.setToRecipients(["hello@appmagic.co"])
            mail.setMessageBody("I need help", isHTML: true)
            viewController.present(mail, animated: true)
        } else {
            openLinkFromBrowser(Constant.shared.termOfUseLink!)
        }
    }

    static func createLoadingPurchaseView(view: UIView) -> UIView {
        let view_loading = UIView()
        view_loading.frame = view.bounds
        view_loading.backgroundColor = .black
        view_loading.layer.opacity = 0.5

        let anim_loading = LottieAnimationView(name: "loadingAnim")
        anim_loading.frame = CGRect(x: 0.25 * UIScreen.main.bounds.width, y: 0.4 * UIScreen.main.bounds.height, width: 0.25 * UIScreen.main.bounds.width, height: 0.25 * UIScreen.main.bounds.height)
        anim_loading.center = view.center
        anim_loading.backgroundColor = .clear
        anim_loading.loopMode = .loop
        anim_loading.animationSpeed = 1
        anim_loading.backgroundBehavior = .pauseAndRestore
        view_loading.addSubview(anim_loading)
        anim_loading.play()
        return view_loading
    }
}
