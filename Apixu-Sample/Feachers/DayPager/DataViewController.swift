//
//  DataViewController.swift
//  pager
//
//  Created by Bassem Abbas on 11/7/18.
//  Copyright © 2018 Zadfresh. All rights reserved.
//

import UIKit

class DataViewController: UIViewController {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var windlabel: UILabel!

    var forecastday: Forecastday?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.dateLabel.text = forecastday?.date
        self.tempLabel.text = "\(forecastday?.day?.mintempC ?? 0) / \(forecastday?.day?.maxtempC ?? 0)"
        self.windlabel.text = "\(forecastday?.day?.maxwindKph ?? 0 )"

    }

}
