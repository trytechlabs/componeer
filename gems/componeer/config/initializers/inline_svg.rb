InlineSvg.configure do |config|
  config.asset_file = InlineSvg::CachedAssetFile.new(
    paths: ["#{__dir__}/../../app/assets/images/icons/"],
    filters: /\.svg/
  )
end
