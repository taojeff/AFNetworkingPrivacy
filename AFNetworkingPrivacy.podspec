Pod::Spec.new do |s|
  # ====================== 你自己的定制版 ======================
  s.name     = 'AFNetworkingPrivacy'          # 改成你的库名
  s.version  = '4.0.1'                        # 版本号（和 GitHub tag 保持一致）
  s.homepage = 'https://github.com/taojeff/AFNetworkingPrivacy'
  s.source   = { :git => 'https://github.com/taojeff/AFNetworkingPrivacy.git', :tag => s.version }
  s.authors  = { 'taojeff' => '990073834@qq.com' }
  s.summary  = 'AFNetworking 4.0.1 + 隐私清单 PrivacyInfo.xcprivacy'
  # ============================================================

  s.license  = 'MIT'

  s.ios.deployment_target = '9.0'

  s.source_files = 'AFNetworking/AFNetworking.h'

  # ✅ 核心：自动打包隐私清单，解决 App Store 审核
  s.resource_bundles = {'AFNetworkingPrivacy' => ['PrivacyInfo.xcprivacy']}

  s.subspec 'Serialization' do |ss|
    ss.source_files = 'AFNetworking/AFURL{Request,Response}Serialization.{h,m}'
  end

  s.subspec 'Security' do |ss|
    ss.source_files = 'AFNetworking/AFSecurityPolicy.{h,m}'
  end

  s.subspec 'Reachability' do |ss|
    ss.ios.deployment_target = '9.0'
    ss.source_files = 'AFNetworking/AFNetworkReachabilityManager.{h,m}'
  end

  s.subspec 'NSURLSession' do |ss|
    ss.dependency 'AFNetworkingPrivacy/Serialization'
    ss.ios.dependency 'AFNetworkingPrivacy/Reachability'
    ss.dependency 'AFNetworkingPrivacy/Security'

    ss.source_files = 'AFNetworking/AF{URL,HTTP}SessionManager.{h,m}', 'AFNetworking/AFCompatibilityMacros.h'
  end

  s.subspec 'UIKit' do |ss|
    ss.ios.deployment_target = '9.0'
    ss.dependency 'AFNetworkingPrivacy/NSURLSession'

    ss.source_files = 'UIKit+AFNetworking'
  end
end