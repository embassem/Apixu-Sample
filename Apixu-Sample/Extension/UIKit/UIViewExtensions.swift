//
//  UIViewExtensions.swift
//  Apixu-Sample
//
//  Created Bassem Abbas on 11/7/18.
//  Copyright © 2018 Ibtikar Technologies, Co. Ltd. All rights reserved.
//

import Foundation
import UIKit

//swiftlint:disable all

extension UIView {

    static var heartbeatingAnimation: CAAnimation = {

        let beatAnimation = CASpringAnimation(keyPath: "transform.scale")

        beatAnimation.duration = 0.25

        beatAnimation.fromValue = 1.0
        beatAnimation.toValue = 1.02

        beatAnimation.autoreverses = true

        beatAnimation.initialVelocity = 0.5
        beatAnimation.damping = 0.8

        return beatAnimation
    }()

    func performHeartBeating() {
        self.layer.add(UIView.heartbeatingAnimation, forKey: "beating")
    }

    func hideAnimated( completion: (() -> Void)? = nil ) {

        self.alpha = 1
        self.isHidden = false

        UIView.animate(withDuration: 0.25, animations: {

            self.alpha = 0

        }) { (_) in

            self.alpha = 1
            self.isHidden = true

            completion?()
        }
    }

    func showupAnimated(_ completion:(() -> Void)? = nil) {

        self.alpha = 0
        self.isHidden = false

        UIView.animate(withDuration: 0.25, animations: {

            self.alpha = 1
        }) { (_) in
            completion?()
        }
    }

    func showupAsKeyboard(on superView: UIView) {

        var oldFrame = superView.bounds

        oldFrame.size.height = self.bounds.height
        oldFrame.size.width = superView.bounds.size.width
        oldFrame.origin.y = superView.bounds.height

        self.frame = oldFrame
        superView.addSubview(self)

        var newFrame = oldFrame
        newFrame.origin.y = superView.bounds.size.height - self.bounds.size.height

        UIView.animate(withDuration: 0.25, delay: 0.0, options: .curveEaseOut, animations: {

            self.frame = newFrame

        }, completion: nil)
    }

    func hideAsKeyboard(_ superView: UIView) {

        let oldFrame = self.frame

        self.frame = oldFrame

        var newFrame = oldFrame
        newFrame.origin.y = superView.bounds.size.height

        UIView.animate(withDuration: 0.25, delay: 0.0, options: .curveEaseOut, animations: {

            self.frame = newFrame

        }, completion: {_ in
            self.removeFromSuperview()
        }
        )
    }

    //    var width : CGFloat {
    //        get{
    //            return self.bounds.width
    //        }
    //    }
    //
    //    var height : CGFloat {
    //        get{
    //            return self.bounds.height
    //        }
    //    }

    func loadFromNib() {

        let view = Bundle.main.loadNibNamed(String(describing: type(of: self)), owner: self, options: nil)!.first as! UIView
        view.frame = self.bounds
        self.addSubview(view)
    }

    func showLoader() {
        let hud = MBProgressHUD.showAdded(to: self, animated: true)

        hud.backgroundView.style = MBProgressHUDBackgroundStyle.solidColor
        hud.backgroundView.color = UIColor(red: CGFloat(0), green: CGFloat(0), blue: CGFloat(0), alpha: CGFloat(0.1))
        hud.bezelView.backgroundColor = UIColor.white
        hud.contentColor = UIColor.brown
        hud.mode = MBProgressHUDMode.indeterminate
    }

    func hideLoader() {
        MBProgressHUD.hide(for: self, animated: true)
    }
}

extension UIButton {

}

extension UITextField {
    @IBInspectable var placeholderColor: UIColor? {
        get {
            return nil
        }
        set {
            self.attributedPlaceholder = NSAttributedString(string: self.placeholder ?? "",
                                                            attributes: [NSAttributedString.Key.foregroundColor: newValue!])
        }
    }
}

extension UIImageView {

}

extension UICollectionView {

    func reloadData(_ completion: (() -> Void)?) {
        UIView.animate(withDuration: 0, animations: { self.reloadData() }) { _ in completion?() }
    }
}

extension UITableView {

    //    func refresh(){
    //        self.spr_beginRefreshing()
    //    }
    //
    //    func setupRefreshController(_ completion : @escaping () -> (Void)){
    //
    //        self.spr_setIndicatorHeader(action: completion)
    //    }
    //
    //    func endLoadingMoreAndRefreshing(){
    //        self.spr_endRefreshing()
    //    }
    //
    //    func setupLoadingMoreController(_ completion : @escaping () -> (Void)){
    //        self.spr_setIndicatorFooter(action: completion)
    //    }
    // ------------------------------------------------
    func setHeaderViewAnimated(_ headerView: UIView) {

        if self.tableHeaderView == headerView {
            return
        }

        headerView.isHidden = true
        self.tableHeaderView = UIView()

        self.beginUpdates()
        UIView.animate(withDuration: 0.25, animations: {
            self.tableHeaderView?.frame = headerView.frame
        }, completion: { (_) in
            self.tableHeaderView = headerView
            self.tableHeaderView?.showupAnimated()
        })
        self.endUpdates()
    }

    func setFooterViewAnimated(_ footerView: UIView) {

        if self.tableFooterView == footerView {
            return
        }

        footerView.isHidden = true
        self.tableFooterView = UIView()

        self.beginUpdates()
        UIView.animate(withDuration: 0.25, animations: {
            self.tableFooterView?.frame = footerView.frame
        }, completion: { (_) in
            self.tableFooterView = footerView
            self.tableFooterView?.showupAnimated()
        })
        self.endUpdates()
    }

    func reloadData(_ completion: (() -> Void)?) {
        UIView.animate(withDuration: 0, animations: { self.reloadData() }) { _ in completion?() }
    }
}
