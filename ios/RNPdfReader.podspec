require "json"

package = JSON.parse(File.read(File.join(__dir__, "..", "package.json")))
version = package['version']

source = { :git => "https://github.com/ybonnetain/react-native-pdf-reader.git" }
source[:tag] = "#{version}"

Pod::Spec.new do |s|
  s.name         = "RNPdfReader"
  s.version      = version
  s.summary      = "RNPdfReader"
  s.description  = "RN component to embed a local PDF"
  s.homepage     = "https://github.com/ybonnetain/react-native-pdf-reader"
  s.license      = "MIT"
  s.author       = { "author" => "yann.bonnetain@gmail.com" }
  s.platform     = :ios, "7.0"
  s.source       = source
  s.source_files = "**/*.{h,m}"
  s.requires_arc = true

  s.dependency "React"
end