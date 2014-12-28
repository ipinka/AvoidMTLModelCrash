Pod::Spec.new do |s|

  s.name         = "AvoidMTLModelCrash"
  s.version      = "1.0.0"
  s.summary      = "Avoid some Mantle crash "

  s.description  = <<-DESC
                   AvoidMTLModelCrash can reduce some crash caused by type mismatch.
                   DESC

  s.homepage     = "http://pinka.cn"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }

  s.author       = "Pinka"
  s.requires_arc = true
  s.source       = { :git => "https://github.com/ipinka/AvoidMTLModelCrash", :tag => "v1.0.0" }
  s.source_files  = "*.{h,m}"
  s.dependency 'JRSwizzle', '~> 1.0'

end
