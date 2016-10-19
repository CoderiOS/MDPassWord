Pod::Spec.new do |s|
  s.name         = "MDPassWord"
  s.version      = "1.0.0"
  s.summary      = "A similar system PassWord"
  s.homepage     = "https://github.com/CoderiOS/MDPassWord"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "wlq" => "ihousehold@163.com" }
  s.source       = { :git => "https://github.com/CoderiOS/MDPassWord.git", :tag => s.version }
  s.platform     = :ios, "7.0"
  s.requires_arc = true
  s.source_files = "MDPassWord/MDPassWord/*.{h,m}"

end
