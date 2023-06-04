source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }


ruby "3.1.3"

gem "componeer", github: "componeer/componeer", branch: "main"
gem "rails", "~> 7.0.5"
gem "sprockets-rails"
gem "puma", "~> 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", require: false

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
end
