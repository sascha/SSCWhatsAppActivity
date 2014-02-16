Pod::Spec.new do |s|
  s.platform     = :ios, '6.0'
  s.name         = "SSCWhatsAppActivity"
  s.version      = "1.0"
  s.summary      = "A UIActivity subclass for sharing messages with WhatsApp."
  s.homepage     = "https://github.com/sascha/SSCWhatsAppActivity"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "Sascha Schwabbauer" => "sascha.schwabbauer@me.com" }
  s.source       = { :git => "https://github.com/sascha/SSCWhatsAppActivity.git", :tag => s.version.to_s }
  s.source_files = 'SSCWhatsAppActivity/*.{h,m}'
  s.resources    = 'SSCWhatsAppActivity/*.png'
  s.requires_arc = true
end