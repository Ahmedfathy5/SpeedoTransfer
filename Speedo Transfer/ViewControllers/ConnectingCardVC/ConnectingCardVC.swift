//
//  ConnectingCardVC.swift
//  Speedo Transfer
//
//  Created by ihab saad on 03/08/2024.
//

import UIKit

class ConnectingCardVC: UIViewController {
    @IBOutlet weak var progressView: UIProgressView!
    



   
  
    private var progressLayer: CAShapeLayer!

    override func viewDidLoad() {
        super.viewDidLoad()

  
        progressView.isHidden = true

        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(containerView)

        NSLayoutConstraint.activate([
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.widthAnchor.constraint(equalToConstant: 174),
            containerView.heightAnchor.constraint(equalToConstant: 174)
        ])

        let circlePath = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 174, height: 174))
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circlePath.cgPath
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = UIColor.primary.withAlphaComponent(0.3).cgColor
        shapeLayer.lineWidth = 10

        progressLayer = CAShapeLayer()
        progressLayer.path = circlePath.cgPath
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.strokeColor = UIColor.primary.cgColor
        progressLayer.lineWidth = 10
        progressLayer.strokeEnd = 0.0

        containerView.layer.addSublayer(shapeLayer)
        containerView.layer.addSublayer(progressLayer)

        animateProgress(to: 1.0)
    }

    func animateProgress(to value: CGFloat) {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.duration = 2.0
        animation.fromValue = progressLayer.strokeEnd
        animation.toValue = value
        animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        progressLayer.strokeEnd = value
        progressLayer.add(animation, forKey: "progressAnimation")

        // عند انتهاء الرسوم المتحركة، إظهار التنبيه
        DispatchQueue.main.asyncAfter(deadline: .now() + animation.duration) {
            self.showCompletionAlert()
        }
    }

    func showCompletionAlert() {
        let alert = UIAlertController(title: " Successfully! ", message: "The Card has been completed 🤩", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Done", style: .destructive, handler: { _ in
            self.presentOtbVC()
        }))
        present(alert, animated: true, completion: nil)
    }
    
    func presentOtbVC(){
     let OtpViewController = OtpViewController()
        let nav = UINavigationController(rootViewController: OtpViewController)
        RootRouter.presentRoot(root: nav)
    }
}
