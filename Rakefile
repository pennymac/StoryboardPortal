namespace :unit do
  desc 'Build and run unit tests for the main app target'
  task :test do
    exec('xctool/xctool.sh ONLY_ACTIVE_ARCH=NO -workspace StoryboardPortal.xcworkspace/ -scheme StoryboardPortal -sdk iphonesimulator test')
  end
end
