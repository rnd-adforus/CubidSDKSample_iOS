//
//  ViewController.swift
//  CuBidSDKSample
//
//  Created by jennet on 11/17/25.
//
import UIKit
import CuBidKit

class ViewController : UIViewController {
    
    lazy var banner : UIView? = UIView()

    let segmentedControl : UISegmentedControl = {
        let control = UISegmentedControl(items: ["Banner", "Interstitial", "Reward", "NativeAd"])
        control.setTitleTextAttributes([.foregroundColor: UIColor.systemGray6], for: .disabled)
        return control
    }()
    let containerView = UIView()
    
    lazy var bannerViewController : BannerViewController = {
        let controller = BannerViewController()
        return controller
    }()
    
    lazy var interstitialViewController : InterstitialViewController = {
        let controller = InterstitialViewController()
        return controller
    }()
    
    lazy var rewardViewController : RewardViewController = {
        let controller = RewardViewController()
        return controller
    }()
    
    lazy var nativeAdViewController : NativeAdViewController = {
        let controller = NativeAdViewController()
        return controller
    }()
    
    let indicator = UIActivityIndicatorView(style: .medium)

    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(segmentedControl)
        view.addSubview(containerView)
        view.addSubview(indicator)
        
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            segmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 8),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        segmentedControl.isEnabled = false

        indicator.center = view.center
        indicator.startAnimating()

        initCubid()
    }
    
    func setSegmentControl(){
        Task { @MainActor in
            segmentedControl.isEnabled = true
            segmentedControl.addTarget(self, action: #selector(tabChanged), for: .valueChanged)
            segmentedControl.selectedSegmentIndex = 0

            displayChildViewController(bannerViewController)
            indicator.stopAnimating()
        }
    }
    
    @objc func tabChanged() {
        guard segmentedControl.isEnabled else { return }
        let page = segmentedControl.selectedSegmentIndex
        
        let vc : UIViewController? = {
            switch page {
            case 0 : return bannerViewController
            case 1 : return interstitialViewController
            case 2 : return rewardViewController
            case 3 : return nativeAdViewController
            default: return nil
            }
        }()
        
        guard let vc = vc else { return }
        displayChildViewController(vc)
    }
    
    func displayChildViewController(_ vc: UIViewController) {
        // 기존 child 제거
        children.forEach { childVC in
            childVC.willMove(toParent: nil)
            childVC.view.removeFromSuperview()
            childVC.removeFromParent()
        }
        
        // 새로운 child 추가
        addChild(vc)
        vc.view.frame = containerView.bounds
        vc.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        containerView.addSubview(vc.view)
        vc.didMove(toParent: self)
    }
    
}

extension ViewController : CuBidInitializable {
    
    func initCubid(){
        CuBidSettings.initialize(setId: "93O4czothe", userId: "CuBider", delegate: self)
    }
    
    func cubidInitializedSuccessfully() {
        setSegmentControl()
    }
    
    func cubidInitializedFailed(error: String) {
        print("not init : \(error)")
    }
    
    
}

