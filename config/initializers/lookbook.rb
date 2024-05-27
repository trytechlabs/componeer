Rails.application.configure do
  config.lookbook.project_name = "Componeer #{Componeer::VERSION}"
  config.lookbook.preview_collection_label = 'Components'
  config.lookbook.preview_paths = ['app/previews']
  config.lookbook.ui_theme = 'zinc'

  config.to_prepare do
    Componeer.eager_load!
  end
end
