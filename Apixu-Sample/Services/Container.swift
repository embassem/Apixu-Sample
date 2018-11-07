//
//  Container.swift
//  Apixu-Sample
//
//  Created by Bassem Abbas on 11/7/18.
//  Copyright © 2018 Zadfresh. All rights reserved.
//

import UIKit

class Container {

    class func homeViewController () -> UIViewController {
        return HomeRouter.createModule()
    }
}
