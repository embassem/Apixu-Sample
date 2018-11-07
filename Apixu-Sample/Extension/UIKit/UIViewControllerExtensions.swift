//
//  UIViewControllerExtensions.swift
//  Apixu-Sample
//
//  Created Bassem Abbas on 11/7/18.
//  Copyright © 2018 Ibtikar Technologies, Co. Ltd. All rights reserved.
//

import Foundation
import SwiftMessages
import SafariServices

//swiftlint:disable all
extension UIViewController {

    func embedViewController(_ vc: UIViewController, to containerView: UIView) {

        if vc.parent == self {
            return
        }

        vc.willMove(toParent: self)

        // Add to containerview
        containerView.addSubview(vc.view)
        self.addChild(vc)

        vc.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            vc.view.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            vc.view.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            vc.view.topAnchor.constraint(equalTo: containerView.topAnchor),
            vc.view.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
            ])

        vc.didMove(toParent: self)
    }

    func erasViewController(_ vc: UIViewController) {

        if vc.parent != self {
            return
        }

        vc.willMove(toParent: nil)
        vc.view.removeFromSuperview()
        vc.removeFromParent()
    }

    func erasFirstViewController() {

        let vc = self.children.first

        vc?.willMove(toParent: nil)
        vc?.view.removeFromSuperview()
        vc?.removeFromParent()
    }

    func showOrPresent(_ vc: UIViewController) {

        if self is UINavigationController {
            (self as! UINavigationController).show(vc, sender: self)
            return
        }

        if self.navigationController != nil {
            self.navigationController?.show(vc, sender: self)
        } else {
            self.present(vc, animated: true, completion: nil)
        }
    }

    //    func fullScreenImage(urlStr:String?){
    //
    //        if let imgSrc = AlamofireSource (urlString: urlStr?.toURLString() ?? "") {
    //
    //            let slideShow = ImageSlideshow ()
    //            slideShow.setImageInputs([imgSrc])
    //            slideShow.presentFullScreenController(from: self)
    //        }
    //
    //    }

    func alertError(_ msg: String?) {

        guard msg != nil else { return }

        let view = MessageView.viewFromNib(layout: .messageView)

        view.configureTheme(.error, iconStyle: .default)
        view.configureDropShadow()

        view.configureContent(body: msg!)
        view.titleLabel?.isHidden = true
        view.button?.isHidden = true
        view.tapHandler = {
            _ in

            SwiftMessages.hide()
        }

        SwiftMessages.show(view: view)
    }

    func informMsg(_ msg: String?) {

        guard msg != nil else { return }

        let view = MessageView.viewFromNib(layout: .messageView)

        view.configureTheme(.success)
        view.configureDropShadow()

        view.configureContent(body: msg!)
        view.titleLabel?.isHidden = true
        view.button?.isHidden = true
        view.tapHandler = {
            _ in

            SwiftMessages.hide()
        }

        SwiftMessages.show(view: view)
    }

    //---------------------

    func showLoader() {
        self.view.showLoader()
    }

    func hideLoader() {
        self.view.hideLoader()
    }

    //---------------------

    /**
     ### It Open Website Url with GDP Web ViewController ###

     - Parameter urlStr : URL to be open
     - Returns:Void.
     */

    func openURLWithWebVC(urlString: String?) {

        if let urlString = urlString, let url = URL (string: urlString) {

            //            let webVC = MainStoryboard.instantiateViewController(withIdentifier: WebViewController.identifier()) as! WebViewController
            //
            //            webVC.theUrl = url
            //
            //            self.present(webVC, animated: true, completion: nil)
        }
    }

    /**
     ### It Open Website Url with GDP Web ViewController ###

     - Parameter htmlText : HTML Content to be loaded
     - Returns:Void.
     */

    func openHtmlWithWebVC(htmlText: String?) {

        if let text = htmlText {

            //            let webVC = MainStoryboard.instantiateViewController(withIdentifier: WebViewController.identifier()) as! WebViewController
            //
            //            webVC.theHTMLText = text
            //
            //            self.present(webVC, animated: true, completion: nil)
        }
    }

    /**
     ### It Open Youtube Video ###

     - Parameter videoID : youtube video ID to be open
     - Returns:Void.
     */

    func openYOUTUBE(videoID: String?) {

        //        let videoVC = VideoViewController ()
        //
        //        videoVC.videoID = videoID
        //
        //        self.present(videoVC, animated: true, completion: nil)
    }

    /**
     ### It Open Website Url with GDP Web ViewController ###

     - Parameter urlStr : URL to be open
     - Returns:Void.
     */

    func openURLWithSafariController(urlString: String?) {

        if let urlString = urlString, let url = URL (string: urlString) {

            let svc = SFSafariViewController(url: url)
            self.present(svc, animated: true, completion: nil)
        }
    }

    func startAppToHome() {

        //        let homeVC = HomeViewController ()
        //        let navController = BaseNavigationController (rootViewController: homeVC)
        //
        //        let window = ((UIApplication.shared.delegate?.window)!)!
        //
        //        UIView.transition(with: window, duration: 0.5, options: .transitionCrossDissolve, animations: {
        //            window.rootViewController = navController
        //        }, completion: nil)
    }

    func startAppToLogin() {

        //        let loginVC = LoginViewController ()
        //        let navController = BaseNavigationController (rootViewController: loginVC)
        //
        //        let window = ((UIApplication.shared.delegate?.window)!)!
        //
        //        UIView.transition(with: window, duration: 0.5, options: .transitionCrossDissolve, animations: {
        //            window.rootViewController = navController
        //        }, completion: nil)
    }

    class func xibName() -> String {
        return String(describing: self)
    }
}
