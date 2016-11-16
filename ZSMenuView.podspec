

Pod::Spec.new do |s|
  s.name             = 'ZSMenuView'
  s.version          = '0.1.0'
  s.summary          = 'a simple menuView，every menu can be clicked'
  s.description      = <<-DESC
TODO: Add long description of the pod here.
小功能：菜单栏。+ 练习使用Cocoapods创建公有podspec
                       DESC

  s.homepage         = 'https://github.com/safiriGitHub/ZSMenuView'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'safiri' => 'safiri@163.com' }
  s.source           = { :git => 'https://github.com/safiriGitHub/ZSMenuView.git', :tag => '0.1.0' }
  s.social_media_url = 'http://www.jianshu.com/users/2809c84474f6/latest_articles'

  s.ios.deployment_target = '8.0'

  s.source_files = 'ZSMenuView/Classes/**/*'

end
