# CuBid SDK For iOS
## 변경사항
- [버전 변경 기록](https://github.com/rnd-adforus/CubidSDKSample_iOS/releases)

## 지원
- 기본 요건
- Xcode 16.0 이상 <br>
- Target iOS 14.0 이상 <br>

## 연동 가이드

### 바로가기
1. [Configuration](#chapter-1)
2. [GADApplicationIdentifier](#chapter-2)
3. [SDK 초기화](#chapter-3)
4. [광고 호출](#chapter-4)  
   4-1. [배너](#chapter-4-1)  
   4-2. [네이티브](#chapter-4-2)  
   4-3. [리워드](#chapter-4-3)  
   4-4. [전면](#chapter-4-4)  

---  

### 1. Configuration 설정 <a id="chapter-1"/>
CocoaPods을 사용하여 Podfile을 열고 다음과 같이 target 빌드 내에 의존성을 추가하여 주세요.<br>
#### 1-1. Dependency Settings
```ruby
// [Podfile] 
  use_frameworks!

  pod 'CuBidKit', '1.0.2' // Core module
  pod 'UAdKit', '2.0.2' // Adapter module
  pod 'UPanKit', '1.0.2' // Adapter module
  pod 'CubeXKit', '1.0.2' // Adapter module
``` 
</br>

#### 1-2. Info.plist 설정
##### 1-2-1.SDKAdNetwork ID 설정
일부 광고 소재에서는 광고 전환에 사용되는 SDKAdNetwork ID를 필요로 합니다. Info.plist 내 SKAdNetworkItems 키값으로 ID 배열을 다음과 같이 설정해주세요.</br>
<details>
<summary>상세보기</summary>

```xml
<key>SKAdNetworkItems</key>
 <array>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>22mmun2rn5.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>uw77j35x4d.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>7ug5zh24hu.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>9t245vhmpl.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>kbd757ywx3.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>a8cz6cu7e5.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>578prtvx9j.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>5tjdwbrq8w.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>hs6bdukanm.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>k674qkevps.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>dbu4b84rxf.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>cstr6suwn9.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>4fzdc2evr5.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>2fnua5tdw4.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>ydx93a7ass.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>p78axxw29g.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>v72qych5uu.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>ludvb6z3bs.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>cp8zw746q7.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>3sh42y64q3.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>c6k4g5qg8m.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>s39g8k73mm.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>3qy4746246.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>f38h382jlk.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>mlmmfzh3r3.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>v4nxqhlyqp.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>wzmmz9fp6w.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>su67r6k2v3.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>yclnxrl5pm.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>t38b2kh725.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>gta9lk7p23.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>vutu7akeur.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>y5ghdn5j9k.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>v9wttpbfk9.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>n38lu8286q.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>47vhws6wlr.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>a2p9lx4jpn.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>44jx6755aq.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>4468km3ulz.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>2u9pt9hc89.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>8s468mfl3y.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>klf5c3l5u5.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>ppxm28t8ap.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>kbmxgpxpgc.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>4dzt52r2t5.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>tl55sbb4fm.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>c3frkrj4fj.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>e5fvkxwrpn.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>8c4e2ghe7u.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>3rd42ekr43.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>97r2b46745.skadnetwork</string>
  </dict>
  <dict>
    <key>SKAdNetworkIdentifier</key>
    <string>3qcr597p9d.skadnetwork</string>
  </dict>
</array>
```

</details>
</br>

##### 1-2-2. 사용자 추적 권한(ATT) 요청
사용자 추적 허용을 통해 광고 품질을 높일 수 있습니다. 사용자 추적 권한에 필요한 NSUserTrackingUsageDescription을 설정은 다음과 같이 키를 추가하고 추적 목적을 명확히 설명하는 문구를 문자열 값으로 작성합니다. 아래는 문구는 예시이며, 앱 내 알맞는 문구로 작성해주세요.
```xml
    <key>NSUserTrackingUsageDescription</key>
    <string>서비스 품질 향상과 맞춤형 콘텐츠 제공을 위해 사용자의 기기 정보를 활용합니다.</string>
```
</br>

#  

### 2.  GADApplicationIdentifier 설정 <a id="chapter-2"/>
GADApplicationIdentifier는 Google Mobile Ads SDK 초기화 및 광고 요청을 위해 필수이며, 미설정 시 광고 로드가 실패할 수 있습니다. Info.plist에 다음과 같이 작성하여주세요. 앱별로 해당하는 고유한 값을 애드포러스 "플랫폼3팀"에 문의해주세요.
```xml
    <key>GADApplicationIdentifier</key>
    <string>ca-app-pub-xxxxxxxxxxxxxxxx~xxxxxxxxxx</string>
```
</br>

> [!NOTE]
> 본 SDK에서 발생할 수 있는 duplicate 경고는
> 설계 구조상 노출되는 정보성 메시지이며,
> 자사 SDK 간 조합에서는 동작 안정성에 영향을 주지 않습니다.

# 

### 3. SDK 초기화 <a id="chapter-3"/>
광고를 호출하기 전에 반드시 `CuBidSettings.initialize()` 메서드를 호출하여 SDK를 초기화해야 합니다.  
이 메서드는 SDK 초기화를 수행하며, 성공 또는 실패 여부를 콜백을 통해 전달합니다.
>⚠️ 주의: `UAdKit`, `CubeXKit`, `UPanKit` 중 하나 이상의 Adapter 라이브러리가 프로젝트에 포함되어 있지 않거나,  
광고 인스턴스(CuBidBanner, CuBidInterstitial, CuBidReward, CuBidNativeAd)는 SDK 초기화 완료 이후에만 생성/호출해야 광고 로드를 실행할 수 있습니다.

```swift 
import CuBidKit

CuBidSettings.initialize(setId: "YOUR_APP_ID", userId: "USER_ID", delegate: self)
    
extension ViewController : CuBidInitializable {
    func cubidInitializedSuccessfully() {
        // 초기화 성공 - 광고 인스턴스 호출 시작
    }

    func cubidInitializedFailed(error: String) {
        // 초기화 실패
    }
}
```
#   

### 4. 광고 호출 <a id="chapter-4"/>
### 4-1. 배너 <a id="chapter-4-1">
#### [광고 로드 및 콜백 리스너 설정]
`CubidBanner`는 광고를 표시할 UIView 타입의 container를 필수 요구합니다. `loadAd()` 호출 이후 `cuBidBannerDidLoad()` 콜백 시점에 광고 뷰가 container 내부에 자동으로 주입됩니다.

```swift
import CuBidKit

let containerView = UIView() 
var cubidBanner : CubidBanner? = nil

...

cubidBanner = CubidBanner(placementId : "YOUR_PLACEMENT_ID", containerView: containerView)

// 광고 사이즈 설정 .fixed320X50 or .fixed320X100 or fixed300X250
cubidBanner?.size = .fixed320X50 
// 광고 이벤트 delegate 설정 
cubidBanner?.delegate = self 
// 광고 호출
cubidBanner?.loadAd()

extension BannerViewController : CuBidBannerDelegate {
    func cuBidBannerDidLoad(_ banner: CuBidKit.CuBidBanner) {
        // 광고 로드 - containerView에 광고 뷰가 attached 됨.
    }
    
    func cuBidBanner(_ banner: CuBidKit.CuBidBanner, didFailWithError error: any Error) {
       // 광고 실패 
    }
    
    func cuBidBannerDidPresentScreen(_ banner: CuBidKit.CuBidBanner) {
        // 광고 표시
    }
    
    func cuBidBannerDidClick(_ banner: CuBidKit.CuBidBanner) {
        // 광고 클릭
    }
}
```
<br>

#### [광고 게제하기]
`CubidBanner` 인스턴스에서 받은 광고뷰가 containerView에 원하는 화면에 추가하여 배너 광고를 표시할 수 있습니다.

```swift
import CuBidKit

containerView.translatesAutoresizingMaskIntoConstraints = false
view.addSubview(containerView) 

NSLayoutConstraint.activate([
    containerView.widthAnchor.constraint(equalToConstant: 320),
    containerView.heightAnchor.constraint(equalToConstant: 50),
    containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
    containerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
])
```
<br>

#### [광고 종료 및 자원 해제]
배너 광고를 끝내고 싶을 때, 배너 광고 자원을 해제 하세요. 뷰계층에서의 참조 관계를 끊어내고, 배너 광고 인스턴스 delegate를 해제하여 내부 동작을 중단하세요.
```swift
import CuBidKit

containerView.subviews.forEach { subview in
    subview.removeFromSuperview()
}
cubidBanner?.delegate = nil
cubidBanner = nil
```

<br>

### 4-2. 네이티브 <a id="chapter-4-2">
**네이티브 광고는 커스텀 UI 구성에 광고 요소를 자유롭게 배치할 수 있는 광고 형식입니다.**

#### [커스텀 UI 구성 예시]
광고 호출 전, CuBidNativeView의 인스턴스의 containerView 프로퍼티 내에 네이티브 광고 요소를 담을 뷰를 원하는 구성으로 배치 합니다. 
```swift
import CuBidKit

lazy var nativeAdView : CuBidNativeView = {
    let nativeAdView = CuBidNativeView()
    return nativeAdView
}()
    
view.addSubView(nativeAdView)

let containerView = nativeAdView.containerView
containerView.addSubview(nativeTitle) // custom UILabel 
containerView.addSubview(nativeDescription) // custom UILabel
containerView.addSubview(nativeIconView) // custom UIImageView
containerView.addSubview(nativeMediaView) // custom UIView
containerView.addSubview(nativeCallToAction) // custom UIButton

nativeAdView.translatesAutoresizingMaskIntoConstraints = false
nativeTitle.translatesAutoresizingMaskIntoConstraints = false
nativeDescription.translatesAutoresizingMaskIntoConstraints = false
nativeIconView.translatesAutoresizingMaskIntoConstraints = false
nativeMediaView.translatesAutoresizingMaskIntoConstraints = false
nativeCallToAction.translatesAutoresizingMaskIntoConstraints = false

NSLayoutConstraint.activate([
    nativeAdView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
    nativeAdView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
    nativeAdView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
    nativeAdView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
    
    nativeIconView.topAnchor.constraint(equalTo: containerView.topAnchor),
    nativeIconView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
    nativeIconView.widthAnchor.constraint(equalToConstant: 60),
    nativeIconView.heightAnchor.constraint(equalTo: nativeIconView.widthAnchor, multiplier: 1),
    
    nativeTitle.topAnchor.constraint(equalTo: nativeIconView.topAnchor),
    nativeTitle.leadingAnchor.constraint(equalTo: nativeIconView.trailingAnchor, constant: 8),
    nativeTitle.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
    nativeTitle.heightAnchor.constraint(equalTo: nativeIconView.heightAnchor, multiplier: 0.4),
    
    nativeDescription.leadingAnchor.constraint(equalTo: nativeTitle.leadingAnchor),
    nativeDescription.trailingAnchor.constraint(equalTo: nativeTitle.trailingAnchor),
    nativeDescription.topAnchor.constraint(equalTo: nativeTitle.bottomAnchor, constant: 2),
    nativeDescription.heightAnchor.constraint(equalTo: nativeIconView.heightAnchor, multiplier: 0.4),
    
    nativeMediaView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
    nativeMediaView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
    nativeMediaView.topAnchor.constraint(equalTo: nativeIconView.bottomAnchor, constant: 8),
    nativeMediaView.heightAnchor.constraint(equalTo: nativeMediaView.widthAnchor, multiplier: 0.5),
    
    nativeCallToAction.topAnchor.constraint(equalTo: nativeMediaView.bottomAnchor, constant: 8),
    nativeCallToAction.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
    nativeCallToAction.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
    nativeCallToAction.heightAnchor.constraint(equalTo: nativeCallToAction.widthAnchor, multiplier: 0.15)
])
    
```
</br>

#### [광고 로드 및 콜백 리스너 설정]
📌 _광고 필수 요소가 누락된 경우, 광고는 정상적으로 로드되지 않습니다._  

`CuBidNativeAd` 인스턴스의 `loadAd()` 메서드를 호출하기 전에 광고 요소를 받을 커스텀 UI를 viewElementsBinder 프로퍼티에 세팅해주세요.\n
광고 로드 성공 시 `CuBidNativeAdDelegate`의 `cuBidenNativeAdDidLoad()` 콜백이 호출되며, 커스텀으로 준비된 뷰에 광고 뷰가 주입됩니다.  
```swift
import CuBidKit

var nativeAd : CuBidNativeAd? = nil
nativeAd = CuBidNativeAd(placementId: "YOUR_PLACEMENT_ID", root: self)
nativeAd?.delegate = self
nativeAd?.viewElements = CuBidNativeAdElementsBinder(container: nativeAdView, mediaView: nativeMediaView, iconView: nativeIconView, titleLabel: nativeTitle, describeLabel: nativeDescription, callToActionButton: nativeCallToAction, priceLabel: nil)
nativeAd?.loadAd()

extension NativeAdViewController: CuBidNativeAdDelegate {
    func cuBidenNativeAdDidLoad(_ nativeAd: CuBidKit.CuBidNativeAd) {
        // 광고 로드 
    }
    
    func cuBidenNativeAd(_ nativeAd: CuBidKit.CuBidNativeAd, didFailWithError error: any Error) {
        // 광고 실패
    }
    
    func cuBidenNativeAdDidClick(_ nativeAd: CuBidKit.CuBidNativeAd) {
        // 광고 클릭
    }
    
    func cuBidenNativeAdDidPresentScreen(_ nativeAd: CuBidKit.CuBidNativeAd) {
        // 광고 표시
    }
}

```
<br>

#### [광고 종료 및 자원 해제]
네이티브 광고를 종료하고 싶을 때, 네이티브 광고 자원을 해제 해주세요. 뷰계층에서의 참조 관계를 끊어내고, 네이티브 광고 인스턴스를 nil 로 초기화 합니다.
```swift
nativeAdView.removeFromSuperview()
nativeAd.delegate = nil
nativeAd = nil
```
<br>

### 4-3. 리워드 <a id="chapter-4-3">
#### [광고 로드 및 콜백 리스너 설정] <a id="chapter-4-3-1">
**리워드 광고는 `CubidReward` 인스턴스를 통해 게재할 수 있습니다.**
광고를 로드하려면 `load()` 메소드를 호출하세요.  
로드가 완료되면 `CuBidRewardDelegate`의 `cuBidRewardDidLoad()` 콜백이 호출되며,  
이후 `showAd(UIViewController)`를 통해 광고를 표시할 수 있습니다.
```swift
import CuBidKit

var cubidReward : CuBidReward? = nil
cubidReward = CubidReward(placementId : "YOUR_PLACEMENT_ID")
cubidReward?.delegate = self
cubidReward?.load()

extension RewardViewController : CuBidRewardDelegate {
    func cuBidRewardDidLoad(_ reward: CuBidKit.CuBidReward) {
        // 광고 로드
    }
    
    func cuBidReward(_ reward: CuBidKit.CuBidReward, didFailWithError: any Error) {
        // 광고 실패
    }
    
    func cuBidRewardDidShow(_ reward: CuBidKit.CuBidReward) {
        // 광고 표시
    }
    
    func cuBidRewardDidClick(_ reward: CuBidKit.CuBidReward) {
        // 광고 클릭
    }
    
    func cuBidRewardDidSkip(_ reward: CuBidKit.CuBidReward) {
        // 광고 스킵
    }
    
    func cuBidRewardDidComplete(_ reward: CuBidKit.CuBidReward) {
        // 광고 완료
    }
    
    func cuBidRewardDidClose(_ reward: CuBidKit.CuBidReward) {
        // 광고 닫기
    }
}
```
<br>

#### [광고 게제]
**리워드 광고를 표시하려면 먼저 [광고 로드 및 델리게이트 설정](#chapter-4-3-1)을 완료한 뒤, `cuBidRewardDidLoad()` 콜백을 수신해야 합니다.**  
광고가 성공적으로 로드된 후에만 `CubidReward` 인스턴스의 `showAd(UIViewController)` 메소드를 호출할 수 있습니다.
> ⚠️ `showAd()`는 반드시 `UIViewController`를 인자로 전달해야 정상적으로 동작합니다.

```swift
cubidReward?.showAd(viewController : self)
```
<br>

#### [광고 종료 및 자원 해제]
리워드 광고를 종료하고 싶을 때, 광고 인스턴스 및 delegate 프로퍼티를 nil로 초기화 하세요.
```kotlin
//Kotlin
cubidReward?.delegate = nil
cubidReward = nil
```
<br>

### 4-4. 전면 <a id="chapter-4-4">
#### [광고 로드 및 델리게이트 설정] <a id="chapter-4-4-1">
**전면 광고는 `CubidInterstitial` 인스턴스를 통해 게재할 수 있습니다.**
광고를 로드하려면 `load()` 메소드를 호출하세요.  
로드가 완료되면 `CuBidInterstitialDelegate`의 `cuBidenterstitialDidLoad()` 콜백이 호출되며,  
이후 `showAd(UIViewController)`를 통해 광고를 표시할 수 있습니다.
```swift
var cubidInterstitial : CubidInterstitial? = nil
cubidInterstitial = CubidInterstitial(placementId : "YOUR_PLACEMENT_ID")
cubidInterstitial?.delegate = self
cubidInterstitial?.load()

extension InterstitialViewController : CuBidInterstitialDelegate {
    func cuBidenterstitialDidLoad(_ interstitial: CuBidKit.CuBidInterstitial) {
        // 광고 로드
    }
    
    func cuBidInterstitial(_ interstitial: CuBidKit.CuBidInterstitial, didFailWithError: any Error) {
        // 광고 실패
    }
    
    func cuBidInterstitialDidShow(_ interstitial: CuBidKit.CuBidInterstitial) {
        // 광고 표시
    }
    
    func cuBidInterstitialDidClick(_ interstitial: CuBidKit.CuBidInterstitial) {
        // 광고 클릭
    }
    
    func cuBidInterstitialDidClose(_ interstitial: CuBidKit.CuBidInterstitial) {
        // 광고 닫기
    }
}

```
</br>

#### [광고 게제]
**전면 광고를 표시하려면 먼저 [광고 로드 및 델리게이트 설정](#chapter-4-4-1)을 완료한 뒤, `cuBidenterstitialDidLoad()` 콜백을 수신해야 합니다.**  
광고가 성공적으로 로드된 후에만 `CubidInterstitial` 인스턴스의 `showAd(UIViewController)` 메소드를 호출할 수 있습니다.
> ⚠️ `showAd()`는 반드시 `UIViewController`를 인자로 전달해야 정상적으로 동작합니다.

```swift
cubidInterstitial?.showAd(viewController: self)
```
<br>

#### [광고 종료 및 자원 해제]
전면 광고를 종료하고 싶을 때, 광고 인스턴스 및 delegate 프로퍼티를 nil로 초기화 하세요.
```swift
cubidInterstitial?.delegate = nil
cubidInterstitial = nil
```
<br>


### 기타 플렛폼 지원
- [(준비중) Flutter]()
- [(준비중 )ReactNative]()
