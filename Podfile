platform :ios, '13.0'
use_frameworks!

# ignore all warnings from all pods
inhibit_all_warnings!

target 'InstantSystem' do

	# Data
	pod 'Moya', '14.0.0'
	pod 'XMLParsing', :git => 'https://github.com/ShawnMoore/XMLParsing.git'

	# Media
	pod 'SDWebImage', '5.9.4'

	#UI Components
    pod 'SnapKit', '5.0.1'
    pod 'lottie-ios', '3.1.9'

   # Tools
    pod 'R.swift', '5.3.1'
    pod 'BonMot', '5.6.0'

end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
        end
    end
end