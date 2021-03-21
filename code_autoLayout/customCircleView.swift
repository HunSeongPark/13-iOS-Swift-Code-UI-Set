//
//  customCircleView.swift
//  code_autoLayout
//
//  Created by 박훈성 on 2021/03/21.
//

import Foundation
import UIKit

class customCircleView: UIView {
  
  override func layoutSubviews() {
    super.layoutSubviews()
    self.layer.cornerRadius = self.frame.height / 2
  }
}
