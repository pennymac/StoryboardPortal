namespace :unit do
  desc 'Build and run unit tests for the main app target'
  task :test do
    exec('xctool/xctool.sh -project StoryboardPortal.xcodeproj -scheme StoryboardPortal ONLY_ACTIVE_ARCH=NO -sdk iphonesimulator test')
  end
end
