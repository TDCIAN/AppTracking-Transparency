//
//  ViewController.swift
//  Tracker
//
//  Created by hexlant_01 on 2021/03/26.
//
import AppTrackingTransparency
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        view.addSubview(button)
        button.center = view.center
        button.setTitle("Get Permission", for: .normal)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        button.setTitleColor(.systemRed, for: .normal)
    }

    @objc func didTapButton() {
        ATTrackingManager.requestTrackingAuthorization { status in
            switch status {
            case .notDetermined:
                print("Not determined")
                break
            case .restricted:
                print("Restricted")
                break
            case .denied:
                print("Denied")
                break
            case .authorized:
                print("Allowed")
                break
            @unknown default:
                break
            }
        }
    }

}

