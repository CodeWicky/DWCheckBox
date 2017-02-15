Pod::Spec.new do |s|
s.name = 'DWCheckBox'
s.version = '1.0.2'
s.license = { :type => 'MIT', :file => 'LICENSE' }
s.summary = 'Help you to create a checkBox in just one line.You can also customize it as you want.'
s.homepage = 'https://github.com/CodeWicky/DWCheckBox'
s.authors = { 'codeWicky' => 'codewicky@163.com' }
s.social_media_url = 'http://www.jianshu.com/u/a56ec10f6603'
s.source = { :git => 'https://github.com/CodeWicky/DWCheckBox.git', :tag => s.version.to_s }
s.requires_arc = true
s.ios.deployment_target = '7.0'
s.source_files = 'DWCheckBox/**/*.{h,m,bundle}'
s.frameworks = 'UIKit'
end
