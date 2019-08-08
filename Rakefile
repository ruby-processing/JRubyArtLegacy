require_relative 'lib/jruby_art/version'
# @TODO change download source for jruby-complete
def create_manifest
  title =  'Implementation-Title: rpextras (java extension for JRubyArt)    '
  version =  format('Implementation-Version: %s', JRubyArt::VERSION)
end

task default: [:init, :compile, :gem, :test]

desc 'Create Manifest'
task :init do
  create_manifest
end

desc 'Build gem'
task :gem do
  sh 'gem build jruby_art.gemspec'
end

desc 'Compile'
task :compile do
  sh 'mvn package'
  sh 'mv target/rpextras.jar lib'
end

desc 'Test'
task :test do
  sh 'jruby --dev test/deglut_spec_test.rb'
  sh 'jruby --dev test/vecmath_spec_test.rb'
  sh 'jruby --dev test/math_tool_test.rb'
  sh 'jruby --dev test/helper_methods_test.rb'
  sh 'jruby --dev test/aabb_spec_test.rb'
  sh 'jruby --dev test/create_test.rb'
  sh 'jruby --dev test/color_group_test.rb'
  home = File.expand_path('~')
  config = File.exist?(format('%s/.jruby_art/config.yml', home))
  if config
    ruby 'test/k9_run_test.rb'
  else
    warn format('You should create %s/.jruby_art/config.yml to run sketch tests', home)
  end
end

desc 'clean'
task :clean do
  Dir["./**/*.{jar,gem}"].each do |path|
    puts "Deleting #{path} ..."
    File.delete(path)
  end
  FileUtils.rm_rf('./target')
end
