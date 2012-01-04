require "bundler"
Bundler::GemHelper.install_tasks

require 'rake/testtask'

Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = false
end

upstreams = { 'emberjs' => [ 'ember', 'ember-datetime' ], 'emberjs-data' => [ 'ember-data' ] }

task :update => upstreams.values.flatten.map { |name| "vendor/assets/javascripts/#{name}.js" } + [ "vendor/assets/javascripts/html5.js" ]

file "vendor/assets/javascripts/html5.js" do
  sh "wget -O vendor/assets/javascripts/html5.js http://html5shim.googlecode.com/svn/trunk/html5.js"
end

upstreams.each do |dist, names|
  names.each do |name|
    file "vendor/upstream/#{dist}/dist/#{name}.js" do
      puts "updating #{dist}"
      owd = pwd

      cd "vendor/upstream/#{dist}"
      # Pull in the latest upstream changes.
      sh "git pull"
      # Bundle the gems required to build.
      sh "bundle"
      # Build the distribution files.
      sh "rake dist/#{name}.min.js"
      cd owd
    end

    file "vendor/assets/javascripts/#{name}.js" => "vendor/upstream/#{dist}/dist/#{name}.js" do
      # Copy the unminified version to the assets directory, since it might make
      # debugging easier and Sprockets will uglify it in production anyway.
      sh "cp -v vendor/upstream/#{dist}/dist/#{name}.min.js vendor/assets/javascripts/#{name}.js"
    end
  end
end

task :clean do
  sh "rm vendor/assets/javascripts/html5.js" if File.exists?("vendor/assets/javascripts/html5.js")
  upstreams.each do |dist, names|
    names.each do |name|
      sh "rm vendor/assets/javascripts/#{name}.js" if File.exists?("vendor/assets/javascripts/#{name}.js")
    end
    owd = pwd
    cd "vendor/upstream/#{dist}"
    # Reset the repository to pristine state
    sh "git clean -df"
    sh "git reset --hard"
    sh "rm -rf dist"
    cd owd
  end
end

task :default => [ :clean, :update, :test ]

