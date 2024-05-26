namespace :componeer do
  desc 'Install Componeer'
  task :install do
    location = File.expand_path('../install/componeer.rb', __dir__)

    system "#{RbConfig.ruby} ./bin/rails app:template LOCATION=#{location}"
  end
end
