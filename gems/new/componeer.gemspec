require_relative 'lib/componeer/version'

Gem::Specification.new do |spec|
  spec.required_ruby_version = '>= 3.1.0'

  spec.name        = 'componeer'
  spec.version     = Componeer::VERSION
  spec.authors     = ['Andre Rodrigues', 'Mauricio Pereira']
  spec.email       = ['andrerpbts@gmail.com', 'mauriciopdvg@gmail.com']
  spec.homepage    = 'https://docs.componeer.me'
  spec.summary     = 'A non-intrusive gem for component-based development in Ruby on Rails'
  spec.description = 'Componeer is a non-intrusive gem that enhances component-based development
    in Ruby on Rails applications. It empowers developers to effortlessly build modular, reusable,
    and highly maintainable UI components within their Rails projects. With an intuitive syntax and
    comprehensive features, Componeer simplifies component management, promotes code reusability,
    and enhances the scalability and flexibility of your Rails applications.'
  spec.license     = 'MIT'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/trytechlabs/componeer'
  spec.metadata['changelog_uri'] = 'https://github.com/trytechlabs/componeer/blob/main/CHANGELOG.md'
  spec.metadata['rubygems_mfa_required'] = 'true'

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']
  end

  spec.add_dependency 'inline_svg', '>= 1.9.0'
  spec.add_dependency 'view_component', '>= 3.1.0'
end
