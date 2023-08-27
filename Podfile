# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'Chat' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!


pod 'Firebase/Core'
pod 'Firebase/Auth'
pod 'Firebase/Database'
pod 'Firebase/Storage'
  # Pods for Chat

pod 'MessageKit'
pod 'JGProgressHUD'
pod 'RealmSwift'
pod 'SDWebImage'

  target 'ChatTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'ChatUITests' do
    # Pods for testing
  end
post_install do |installer|
    installer.generated_projects.each do |project|
          project.targets.each do |target|
              target.build_configurations.each do |config|
                  config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
               end
          end
   end
end
end
