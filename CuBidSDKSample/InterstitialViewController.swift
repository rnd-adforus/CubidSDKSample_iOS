//
//  InterstitialViewController.swift
//  CuBidSDKSample
//
//  Created by jennet on 11/17/25.
//

import UIKit
import CuBidKit

class InterstitialViewController : UIViewController {
    
    lazy var buttonStack : UIStackView = {
        let stack = UIStackView(arrangedSubviews: [loadButton, showButton])
        stack.alignment = .center
        stack.distribution = .equalCentering
        stack.axis = .vertical
        stack.spacing = 120
        return stack
    }()
    
    let loadButton : UIButton = {
        let button = UIButton()
        button.setTitle("LOAD", for: .normal)
        button.contentEdgeInsets = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        button.layer.cornerRadius = 5
        button.backgroundColor = .lightGray
        return button
    }()
    
    let showButton : UIButton = {
        let button = UIButton()
        button.setTitle("SHOW", for: .normal)
        button.contentEdgeInsets = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        button.layer.cornerRadius = 5
        button.backgroundColor = .lightGray
        return button
    }()
    
    lazy var interstitial = CuBidInterstitial(placementId: "WGKfy6mDf5")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(buttonStack)

        buttonStack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            buttonStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonStack.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        print("test-jennet buttonStack frame : \(buttonStack.frame.width) \(buttonStack.frame.height)")
        
        loadButton.addTarget(self, action: #selector(loadInterstitial), for: .touchUpInside)
        showButton.addTarget(self, action: #selector(showInterstitial), for: .touchUpInside)
    }
    
    @objc func loadInterstitial(){
        interstitial.delegate = self
        interstitial.loadAd()
    }
    
    @objc func showInterstitial(){
        interstitial.showAd(viewController: self)
    }
}

extension InterstitialViewController : CuBidInterstitialDelegate {
    func cuBidenterstitialDidLoad(_ interstitial: CuBidKit.CuBidInterstitial) {
        print("cuBidenterstitialDidLoad")
    }
    
    func cuBidInterstitial(_ interstitial: CuBidKit.CuBidInterstitial, didFailWithError: any Error) {
        print("cuBidInterstitial didFailWithError : \(didFailWithError.localizedDescription)")
    }
    
    func cuBidInterstitialDidShow(_ interstitial: CuBidKit.CuBidInterstitial) {
        print("cuBidInterstitialDidShow")
    }
    
    func cuBidInterstitialDidClick(_ interstitial: CuBidKit.CuBidInterstitial) {
        print("cuBidInterstitialDidClick")
    }
    
    func cuBidInterstitialDidClose(_ interstitial: CuBidKit.CuBidInterstitial) {
        print("cuBidInterstitialDidClose")
    }
    
    
}
