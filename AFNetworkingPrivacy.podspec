Pod::Spec.new do |spec|
  # ====================== 【必填：修改这 3 处信息】 ======================
  spec.name         = "AFNetworkingPrivacy"        # 你的 Pod 名称（固定即可）
  spec.version      = "4.0.1-privacy.1"             # 必须和你 GitHub 打的 Tag 完全一致
  spec.homepage     = "https://github.com/你的GitHub用户名/AFNetworking-Privacy" # 你的仓库地址
  # ======================================================================

  spec.summary      = "AFNetworking 4.0.1 官方原版 + 已添加 iOS 隐私清单(PrivacyInfo)，适配 App Store 审核合规"
  spec.description  = <<-DESC
  基于 AFNetworking 4.0.1 官方稳定版本，新增 iOS 隐私清单文件 PrivacyInfo.xcprivacy，
  解决 App Store 审核中第三方库缺少隐私协议的问题，无任何业务代码修改，100% 兼容官方用法。
                   DESC

  spec.license      = { :type => "MIT", :file => "LICENSE" } # 保留原开源协议
  spec.author       = { "你的名字" => "你的邮箱地址" } # 可随意填写

  # 平台适配（和官方 AFNetworking 4.0.1 完全一致）
  spec.ios.deployment_target = "9.0"
  spec.osx.deployment_target = "10.10"
  spec.watchos.deployment_target = "2.0"
  spec.tvos.deployment_target = "9.0"

  # Git 仓库地址（自动读取上面的 homepage，无需修改）
  spec.source       = { :git => spec.homepage + ".git", :tag => spec.version.to_s }

  # 核心源码配置（完全匹配官方文件结构）
  spec.source_files  = "AFNetworking/**/*.{h,m}"
  spec.public_header_files = "AFNetworking/**/*.h"
  spec.frameworks = "Security", "SystemConfiguration"
  spec.ios.frameworks = "MobileCoreServices", "CoreServices"

  # ====================== 【核心：隐私清单配置】 ======================
  # 必须开启，告诉 CocoaPods 打包隐私文件，解决 App Store 审核缺失隐私协议问题
  spec.privacy_manifest = {
    :file => "PrivacyInfo.xcprivacy"
  }
  # ======================================================================

  spec.requires_arc = true
end