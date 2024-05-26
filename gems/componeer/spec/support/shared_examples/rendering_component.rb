shared_examples 'rendering component' do |options|
  subject(:rendered) do
    if defined?(block)
      render_inline(component) { block.call }
    else
      render_inline(component)
    end.strip
  end

  let(:expected_content) { render_component_fixture(options&.fetch(:fixture_file)) }

  it { expect(rendered).to eq(expected_content) }
end
