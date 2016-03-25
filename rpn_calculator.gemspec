# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name			 = "Thomas LePage"
  spec.version		 = '1.0'
  spec.authors		 = ["Thomas LePage"]
  spec.email		 = ["thomaslepage@live.com"]
  spec.summary		 = %q{Reverse Polish Notation Calculator}
  spec.description   = %q{RPN Calculator that runs from command line}
  spec.homepage      = "https://portfolio-lepage.herokuapp.com"
  spec.license       = "MIT"
  
  spec.files         = ['lib/rpn_calculator.rb']
  spec.executables   = ['bin/rpn_calculator']
  spec.test_files    = ['tests/test_rpn_calculator.rb']
  spec.require_paths = ["lib"]
end