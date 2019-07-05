//
//  Helper.swift
//  ReusableProtocol
//
//  Created by LΞO on 2019/7/5.
//  Copyright © 2019 Leo. All rights reserved.
//

import UIKit

class Helper {

  static func randomColor() -> UIColor {
    return UIColor(red: Helper.randomColorValue(),
                   green: Helper.randomColorValue(),
                   blue: Helper.randomColorValue(),
                   alpha: 1.0)
  }

  private static func randomColorValue() -> CGFloat {
    return CGFloat(arc4random() % (256 / 2) + 256 / 2) / 255
  }
}
