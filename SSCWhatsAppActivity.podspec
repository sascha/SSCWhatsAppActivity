Pod::Spec.new do |s|
  s.name              = "SSCWhatsAppActivity"
  s.version           = "1.2.1"
  s.summary           = "A UIActivity subclass for sharing images and messages with WhatsApp."
  s.homepage          = "https://github.com/sascha/SSCWhatsAppActivity"
  s.screenshots       = "https://raw.github.com/sascha/SSCWhatsAppActivity/master/screenshot.png"
  s.license           = { :type => 'MIT', :file => 'LICENSE' }
  s.author            = { "Sascha Schwabbauer" => "sascha@evolved.io" }
  s.source            = { :git => "https://github.com/sascha/SSCWhatsAppActivity.git", :tag => s.version.to_s }
  s.social_media_url  = 'https://twitter.com/_SaschaS'
  
  s.platform          = :ios, '6.0'
  s.requires_arc      = true
  
  s.source_files      = 'SSCWhatsAppActivity/*.{h,m}'
  s.resources         = 'SSCWhatsAppActivity/*.png'
end
