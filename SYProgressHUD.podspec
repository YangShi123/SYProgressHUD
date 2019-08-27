Pod::Spec.new do |s|
 
  s.name         = "SYProgressHUD"
  s.version      = "0.1"
  s.summary      = "基于MBProgressHUD的封装"
  s.description  = "easy use SYProgressHUD on iOS，use by readme"
 
  s.homepage     = "https://github.com/YangShi123/SYProgressHUD"
 
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "石阳" => "421111472@qq.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/YangShi123/SYProgressHUD.git", :tag => "v#{s.version}" }
  s.source_files  = "SYProgressHUD/*.{h,m}"
  s.dependency "MBProgressHUD"  
  s.resources = "SYProgressHUD/*.bundle"
end