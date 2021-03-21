//
//  ViewController.swift
//  code_autoLayout
//
//  Created by 박훈성 on 2021/03/21.
//

import UIKit

class secondViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    
    let myFirstView = UIView()
    myFirstView.translatesAutoresizingMaskIntoConstraints = false
    myFirstView.backgroundColor = .black
    self.view.addSubview(myFirstView)
    
    //set x,y position (Constraint)
    myFirstView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true //Horizontally in Container
    myFirstView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 200).isActive = true //top Constraint
    
    //set width, height
    myFirstView.widthAnchor.constraint(equalToConstant: 200).isActive = true
    myFirstView.heightAnchor.constraint(equalToConstant: 200).isActive = true
    myFirstView.layer.cornerRadius = 30
  }
}

//전처리기 (빌드되기 전에 처리, 디버깅 영역)
#if DEBUG

import SwiftUI
struct secondViewControllerRepresentable: UIViewControllerRepresentable {
  
  //update
  func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
  }
  
  //makeUI
  @available(iOS 13.0,*)
  func makeUIViewController(context: Context) -> UIViewController {
    secondViewController()
    
  }
}

struct secondViewController_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      secondViewControllerRepresentable()
        .previewDisplayName("secondViewController")
    }
  }
  
}

#endif


