# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

use_frameworks!

def shared_pods
  pod 'RxSwift', '~> 5'
  pod 'RxCocoa', '~> 5'
end

target 'MarvelBattle' do

  shared_pods

  target 'MarvelBattleTests' do
    #inherit! :search_paths
    # Pods for testing
  end

  target 'MarvelBattleUITests' do
    #inherit! :search_paths
    # Pods for testing
  end

end

target 'MarvelCore' do
  shared_pods
  pod 'RealmSwift'
end
