InlineSvg.configure do |config|
  config.asset_file = InlineSvg::CachedAssetFile.new(
    paths: ['gems/componeer/app/assets/images/icons/'],
    filters: /\.svg/
  )
end
