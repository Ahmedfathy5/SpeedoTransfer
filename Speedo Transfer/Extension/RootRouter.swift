//
//  RootRouter.swift
//  Attendance App
//
//  Created by ihab saad on 27/07/2024.


import UIKit
class RootRouter {
    
    static func presentRoot(root: UIViewController){
        let window = UIApplication.shared.windows.filter { $0.isKeyWindow }.first
        window?.rootViewController = root
        window?.makeKeyAndVisible()
    }
}
