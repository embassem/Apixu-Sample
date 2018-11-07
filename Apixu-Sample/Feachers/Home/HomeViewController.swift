//
//  HomeViewController.swift
//  Apixu-Sample
//
//  Created Bassem Abbas on 11/7/18.
//  Copyright © 2018 Ibtikar Technologies, Co. Ltd. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    // MARK: - Public Variables
    var presenter: HomePresenterProtocol?

    // MARK: - Private Variables

    // MARK: - Computed Variables

    // MARK: - IBOutlets

    @IBOutlet private weak var weekDaysContainer: UIView!

    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var windLabel: UILabel!

}

// MARK: - View Controller lifecycle
extension HomeViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        showLoader()
        presenter?.viewDidLoad()
        weekDaysContainer.layer.cornerRadius = 8
        weekDaysContainer.layer.masksToBounds = true

    }
}

// MARK: - IBActions
extension HomeViewController {

}

// MARK: - Selectors
extension HomeViewController {

}

// MARK: - Protocal
extension HomeViewController: HomeViewProtocol {
    func display(result: ApixuBase) {
        hideLoader()

        self.cityLabel.text = result.location?.name
        self.dateLabel.text = result.current?.lastUpdated
        if let tempC = result.current?.tempC {
            self.tempLabel.text = String(tempC)
        }
        if let windKph = result.current?.windKph, let dir = result.current?.windDir {
            self.windLabel.text = "\(windKph) \(dir)"
        }
        if let forcast = result.forecast?.forecastday {
            prepareContainer(model: forcast)
        }
    }

    func showError(message: String) {
        hideLoader()

    }

}

// MARK: - Container
extension HomeViewController {

    func prepareContainer(model: [Forecastday]) {

        if  weekDaysContainer.subviews.isEmpty {
            if let child = UIStoryboard(name: "Pager", bundle: nil).instantiateViewController(withIdentifier: "RootViewController") as? RootViewController {

                child.didGetModel(model: model)
                self.embedViewController(child, to: weekDaysContainer)

            }
        }
    }
}
