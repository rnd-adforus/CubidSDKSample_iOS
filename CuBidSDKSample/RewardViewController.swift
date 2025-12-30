//
//  RewardViewController.swift
//  CuBidSDKSample
//
//  Created by jennet on 11/17/25.
//

import UIKit
import CuBidKit

class RewardViewController : UIViewController {
    
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
    
    lazy var reward = CuBidReward(placementId: "U4L9FnsiFb")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(buttonStack)
//        buttonStack.frame = view.bounds
        buttonStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonStack.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        print("test-jennet buttonStack frame : \(buttonStack.frame.width) \(buttonStack.frame.height)")
        
        loadButton.addTarget(self, action: #selector(loadReward), for: .touchUpInside)
        showButton.addTarget(self, action: #selector(showReward), for: .touchUpInside)
    }
    
    @objc func loadReward(){
        reward.delegate = self
        reward.loadAd()
    }
    
    @objc func showReward(){
        reward.showAd(viewController: self)
    }
}
extension RewardViewController : CuBidRewardDelegate {
    func cuBidRewardDidLoad(_ reward: CuBidKit.CuBidReward) {
        print("cuBidRewardDidLoad")
    }
    
    func cuBidReward(_ reward: CuBidKit.CuBidReward, didFailWithError: any Error) {
        print("cuBidReward didFailWithError : \(didFailWithError.localizedDescription)")

    }
    
    func cuBidRewardDidShow(_ reward: CuBidKit.CuBidReward) {
        print("cuBidRewardDidShow")

    }
    
    func cuBidRewardDidClick(_ reward: CuBidKit.CuBidReward) {
        print("cuBidRewardDidClick")

    }
    
    func cuBidRewardDidSkip(_ reward: CuBidKit.CuBidReward) {
        print("cuBidRewardDidSkip")

    }
    
    func cuBidRewardDidComplete(_ reward: CuBidKit.CuBidReward) {
        print("cuBidRewardDidComplete")

    }
    
    func cuBidRewardDidClose(_ reward: CuBidKit.CuBidReward) {
        print("cuBidRewardDidClose")

    }

    
}
