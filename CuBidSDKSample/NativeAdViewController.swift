//
//  NativeAdViewController.swift
//  CuBidSDKSample
//
//  Created by jennet on 11/17/25.
//

import UIKit
import CuBidKit

class NativeAdViewController : UIViewController {
    
    let loadButton : UIButton = {
        let button = UIButton()
        button.setTitle("LOAD", for: .normal)
        button.contentEdgeInsets = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = 5
        return button
    }()
    
    lazy var nativeAdView : CuBidNativeView = {
        let nativeAdView = CuBidNativeView()
        nativeAdView.backgroundColor = .systemGray6
        return nativeAdView
    }()
    
    let nativeTitle : UILabel = {
        let title = UILabel()
        return title
    }()
    
    let nativeDescription : UILabel = {
        let description = UILabel()
        return description
    }()
    
    let nativeCallToAction : UIButton = {
        let callToAction = UIButton()
        return callToAction
    }()

    let nativeIconView : UIImageView = {
       let iconView = UIImageView()
        return iconView
    }()
    
    let nativeMediaView : UIView = {
        let mediaView = UIView()
        return mediaView
    }()
    
    lazy var nativeAd = CuBidNativeAd(placementId: "ofvK0zNEgJ", root: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(loadButton)
        view.addSubview(nativeAdView)
        
        let containerView = nativeAdView.containerView        
        containerView.addSubview(nativeTitle)
        containerView.addSubview(nativeDescription)
        containerView.addSubview(nativeIconView)
        containerView.addSubview(nativeMediaView)
        containerView.addSubview(nativeCallToAction)
        
        loadButton.translatesAutoresizingMaskIntoConstraints = false
        nativeAdView.translatesAutoresizingMaskIntoConstraints = false
        nativeTitle.translatesAutoresizingMaskIntoConstraints = false
        nativeDescription.translatesAutoresizingMaskIntoConstraints = false
        nativeIconView.translatesAutoresizingMaskIntoConstraints = false
        nativeMediaView.translatesAutoresizingMaskIntoConstraints = false
        nativeCallToAction.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            loadButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loadButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 8),
            loadButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.75),
            nativeAdView.topAnchor.constraint(equalTo: loadButton.bottomAnchor, constant: 8),
            nativeAdView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            nativeAdView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            nativeAdView.heightAnchor.constraint(equalToConstant: 420),
            nativeIconView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8),
            nativeIconView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
            nativeIconView.widthAnchor.constraint(equalToConstant: 60),
            nativeIconView.heightAnchor.constraint(equalTo: nativeIconView.widthAnchor, multiplier: 1),
            nativeTitle.topAnchor.constraint(equalTo: nativeIconView.topAnchor, constant: 8),
            nativeTitle.leadingAnchor.constraint(equalTo: nativeIconView.trailingAnchor, constant: 8),
            nativeTitle.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
            nativeTitle.heightAnchor.constraint(equalTo: nativeIconView.heightAnchor, multiplier: 0.4),
            nativeDescription.leadingAnchor.constraint(equalTo: nativeTitle.leadingAnchor),
            nativeDescription.trailingAnchor.constraint(equalTo: nativeTitle.trailingAnchor),
            nativeDescription.topAnchor.constraint(equalTo: nativeTitle.bottomAnchor, constant: 2),
            nativeDescription.heightAnchor.constraint(equalTo: nativeIconView.heightAnchor, multiplier: 0.4),
            nativeMediaView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
            nativeMediaView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
            nativeMediaView.topAnchor.constraint(equalTo: nativeIconView.bottomAnchor, constant: 8),
            nativeMediaView.heightAnchor.constraint(equalTo: nativeMediaView.widthAnchor, multiplier: 0.5),
            nativeCallToAction.topAnchor.constraint(equalTo: nativeMediaView.bottomAnchor, constant: 2),
            nativeCallToAction.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
            nativeCallToAction.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
            nativeCallToAction.heightAnchor.constraint(equalTo: nativeCallToAction.widthAnchor, multiplier: 0.15)
        ])
        
        loadButton.addTarget(self, action: #selector(touchLoadNative), for: .touchUpInside)
    }
    
    
    @objc func touchLoadNative(){
        
        nativeAd.delegate = self
 
        Task { @MainActor in
            nativeAd.viewElements = CuBidNativeAdElementsBinder(container: nativeAdView, mediaView: nativeMediaView, iconView: nativeIconView, titleLabel: nativeTitle, describeLabel: nativeDescription, callToActionButton: nativeCallToAction, priceLabel: nil)
            nativeAd.loadAd()
        }
    }
    
}

extension NativeAdViewController: CuBidNativeAdDelegate {
    func cuBidenNativeAdDidLoad(_ nativeAd: CuBidKit.CuBidNativeAd) {
        print("cuBidenNativeAdDidLoad")
    }
    
    func cuBidenNativeAd(_ nativeAd: CuBidKit.CuBidNativeAd, didFailWithError error: any Error) {
        print("cuBidenNativeAd didFailWithError : \(error.localizedDescription)")
    }
    
    func cuBidenNativeAdDidClick(_ nativeAd: CuBidKit.CuBidNativeAd) {
        print("cuBidenNativeAdDidClick")
    }
    
    func cuBidenNativeAdDidPresentScreen(_ nativeAd: CuBidKit.CuBidNativeAd) {
        print("cuBidenNativeAdDidPresentScreen")
    }
}
