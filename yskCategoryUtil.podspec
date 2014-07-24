Pod::Spec.new do |s|
  s.name         = "yskCategoryUtil"
  s.version      = "0.0.1"
  s.platform     = :ios, '6.0'
  s.source       = { :path => "~/myGit/yskCategoryUtil" }
  s.source_files  = '**/*.{h,m}'
  s.resources    = '**/*.plist'
  s.requires_arc = true

end
