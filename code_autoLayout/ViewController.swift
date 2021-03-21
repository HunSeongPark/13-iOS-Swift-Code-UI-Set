//
//  ViewController.swift
//  code_autoLayout
//
//  Created by 박훈성 on 2021/03/21.
//

import UIKit

class ViewController: UIViewController {
  
  //MARK: - using closure
  var mySecondView: UIView = {
    let view = UIView()
    view.backgroundColor = .green
    view.layer.cornerRadius = 15
    view.translatesAutoresizingMaskIntoConstraints = false
  
    //corner radius를 설정 할 때, 테두리가 둥글어짐에 따라 내용이 뷰의 테두리를 기준으로 잘림.
    view.clipsToBounds = false
    return view
  }()
  
  //MARK: - using closure and custom view class
  var myThirdView: customCircleView = {
    let view = customCircleView()
    view.backgroundColor = .yellow
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()

  override func viewDidLoad() {
    super.viewDidLoad()

    //MARK: - using line by line
    let myFirstView = UIView()
    myFirstView.translatesAutoresizingMaskIntoConstraints = false
    myFirstView.backgroundColor = .red
    self.view.addSubview(myFirstView)
    
    //set x,y position (Constraint)
    myFirstView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true //Horizontally in Container
    myFirstView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 200).isActive = true //top Constraint
    
    //set width, height
    myFirstView.widthAnchor.constraint(equalToConstant: 200).isActive = true
    myFirstView.heightAnchor.constraint(equalToConstant: 200).isActive = true
    myFirstView.layer.cornerRadius = 30
    
    
    self.view.addSubview(mySecondView)
    NSLayoutConstraint.activate([
      mySecondView.widthAnchor.constraint(equalToConstant: 100),
      mySecondView.heightAnchor.constraint(equalToConstant: 100),
      mySecondView.leadingAnchor.constraint(equalTo: myFirstView.leadingAnchor),
      mySecondView.topAnchor.constraint(equalTo: myFirstView.bottomAnchor, constant: 20),
    ])
    
//    mySecondView.widthAnchor.constraint(equalToConstant: 100).isActive = true
//    mySecondView.heightAnchor.constraint(equalToConstant: 100).isActive = true
//    mySecondView.leadingAnchor.constraint(equalTo: myFirstView.leadingAnchor).isActive = true
//    mySecondView.topAnchor.constraint(equalTo: myFirstView.bottomAnchor, constant: 20).isActive = true
    
    self.view.addSubview(myThirdView)
    NSLayoutConstraint.activate([
      myThirdView.widthAnchor.constraint(equalTo: mySecondView.widthAnchor, multiplier: 1.5),
      myThirdView.heightAnchor.constraint(equalTo: mySecondView.heightAnchor, multiplier: 1.5),
      myThirdView.leadingAnchor.constraint(equalTo: mySecondView.trailingAnchor),
      myThirdView.topAnchor.constraint(equalTo: mySecondView.bottomAnchor, constant: 20),
    ])
    
  }
}

//MARK: - Preview Line

//전처리기 (컴파일 되기 전에 처리되는 프로그램, 디버깅을 위해)
#if DEBUG

import SwiftUI
struct ViewControllerRepresentable: UIViewControllerRepresentable {
  
  //update
  func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
  }

  //makeUI
  @available(iOS 13.0,*)
  func makeUIViewController(context: Context) -> UIViewController {
    ViewController()
    
  }
}

struct ViewController_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      ViewControllerRepresentable()
        .previewDisplayName("ViewController")
    }
  }
  
}

#endif



