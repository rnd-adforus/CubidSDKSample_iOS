//
//  BannerViewController.swift
//  CuBidSDKSample
//
//  Created by jennet on 11/17/25.
//

import UIKit
import CuBidKit

class BannerViewController : UIViewController {
    
    let sizeSegmentedControl = UISegmentedControl(items: ["320X50", "320X100", "300X250"])

    
    lazy var bannerContainerStack : UIStackView = {
        let stack = UIStackView(arrangedSubviews: [containerSlice, containerStretch, containerSpread])
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        stack.alignment = .center
        
        stack.spacing = 8
        return stack
    }()
    
    lazy var containerSlice : UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray6
        let label = UILabel()
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        label.text = sizeSegmentedControl.titleForSegment(at: 0)
        label.backgroundColor = .systemGray6
        return view
    }()
    
    lazy var containerStretch : UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray6
        let label = UILabel()
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        label.textColor = .black
        label.text = sizeSegmentedControl.titleForSegment(at: 1)
        return view
    }()
    
    lazy var containerSpread : UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray6
        let label = UILabel()
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        label.text = sizeSegmentedControl.titleForSegment(at: 2)
        return view
    }()
    
    private var _size : CuBidBannerSize? = .fixed320X50
    
    private lazy var sliceBanner = CuBidBanner(placementId: "bEiQuvFrVp", containerView: containerSlice)
    private lazy var stretchBanner = CuBidBanner(placementId: "qyoc6iVP2X", containerView: containerStretch)
    private lazy var spreadBanner = CuBidBanner(placementId: "FpMXfTOI1v", containerView: containerSpread)
    
    let loadButton : UIButton = {
        let button = UIButton()
        button.setTitle("LOAD", for: .normal)
        button.contentEdgeInsets = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        button.layer.cornerRadius = 5
        button.backgroundColor = .lightGray
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(sizeSegmentedControl)
        view.addSubview(loadButton)
        view.addSubview(bannerContainerStack)
        
        sizeSegmentedControl.translatesAutoresizingMaskIntoConstraints = false
        loadButton.translatesAutoresizingMaskIntoConstraints = false
        bannerContainerStack.translatesAutoresizingMaskIntoConstraints = false
        containerSlice.translatesAutoresizingMaskIntoConstraints = false
        containerStretch.translatesAutoresizingMaskIntoConstraints = false
        containerSpread.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            sizeSegmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            sizeSegmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            sizeSegmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            loadButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loadButton.topAnchor.constraint(equalTo: sizeSegmentedControl.bottomAnchor, constant: 10),
            loadButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.75),
            containerSlice.widthAnchor.constraint(equalToConstant: 320),
            containerSlice.heightAnchor.constraint(equalToConstant: 50),
            containerStretch.widthAnchor.constraint(equalToConstant: 320),
            containerStretch.heightAnchor.constraint(equalToConstant: 100),
            containerSpread.widthAnchor.constraint(equalToConstant: 300),
            containerSpread.heightAnchor.constraint(equalToConstant: 250),
            
            bannerContainerStack.topAnchor.constraint(equalTo: loadButton.bottomAnchor, constant: 8),
            bannerContainerStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
        sizeSegmentedControl.selectedSegmentIndex = 0        
        loadButton.addTarget(self, action: #selector(tabLoadButton), for: .touchUpInside)
        
    }
    
   @objc func tabLoadButton() {
       load()
    }
    
}


extension BannerViewController : CuBidBannerDelegate {
    
    func load(){
        let sizeIndex = sizeSegmentedControl.selectedSegmentIndex
        
        switch sizeIndex {
        case 0 :
            sliceBanner.size = .fixed320X50
            sliceBanner.delegate = self
            sliceBanner.loadAd()
        case 1 :
            stretchBanner.size = .fixed320X100
            stretchBanner.delegate = self
            stretchBanner.loadAd()
        case 2 :
            spreadBanner.size = .fixed300X250
            spreadBanner.delegate = self
            spreadBanner.loadAd()
        default: return
        }
    }
    
    func cuBidBannerDidLoad(_ banner: CuBidKit.CuBidBanner) {
        if banner === sliceBanner {
            print("test-jennet sliceBanner load")
        }else if banner === stretchBanner {
            print("test-jennet stretchBanner load")
        }else if banner === spreadBanner {
            print("test-jennet spreadBanner load")
        }
    }
    
    func cuBidBanner(_ banner: CuBidKit.CuBidBanner, didFailWithError error: any Error) {
        if banner === sliceBanner {
            print("test-jennet sliceBanner error : \(error.localizedDescription)")
        }else if banner === stretchBanner {
            print("test-jennet stretchBanner error : \(error.localizedDescription)")
        }else if banner === spreadBanner {
            print("test-jennet spreadBanner error : \(error.localizedDescription)")
        }
    }
    
    func cuBidBannerDidPresentScreen(_ banner: CuBidKit.CuBidBanner) {
        if banner === sliceBanner {
            print("test-jennet sliceBanner present")
        }else if banner === stretchBanner {
            print("test-jennet stretchBanner present")
        }else if banner === spreadBanner {
            print("test-jennet spreadBanner present")
        }
    }
    
    func cuBidBannerDidClick(_ banner: CuBidKit.CuBidBanner) {
        if banner === sliceBanner {
            print("test-jennet sliceBanner click")
        }else if banner === stretchBanner {
            print("test-jennet stretchBanner click")
        }else if banner === spreadBanner {
            print("test-jennet spreadBanner click")
        }
    }
    
    
}
