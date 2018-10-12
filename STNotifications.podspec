Pod::Spec.new do |s|

  s.name         = "STNotifications"
  s.version      = "1.1.5.1"
  s.summary      = "Tiny library for Strongly Typed Notifications in Objective-C"

  s.description  = <<-DESC
Strongly typed notificatinos allow your Objective-C notifications to work in a safe manner, using light generics magics and little bit of architecture tricks!
Benefits:
1) Strongly typed payload
2) NSNotification name won't be messed again!
3) Easy syntax for use
4) Interoperable with swift!
5) 100% Code Coverage!

                        DESC

  s.homepage     = "https://github.com/neisip/StronglyTypedNotifications"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Alexander Kazartsev" => "alex.a.kazartsev@gmail.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/neisip/StronglyTypedNotifications.git", :tag => "#{s.version}" }
  s.source_files  = "Classes", "STNotifications/**/*.{h,m}"
  s.exclude_files = "Classes/Exclude"

end
