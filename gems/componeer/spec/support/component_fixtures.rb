module ComponentFixtures
  def render_component_fixture(...)
    File.read(component_fixture_path(...)).strip
  end

  def component_fixture_path(fixture_filename)
    path = described_class.name.underscore
    path = path.gsub("/#{path.split('/').last}", '/fixtures')

    "spec/components/#{path}/#{fixture_filename}"
  end
end

RSpec.configure do |config|
  config.include ComponentFixtures
end
