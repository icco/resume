###
# Compass
###

# Change Compass configuration
compass_config do |config|
  config.output_style = :compact
end

###
# Page options, layouts, aliases and proxies
###
page "/index.html", :layout => false

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

set :css_dir, 'css'
set :js_dir, 'js'
set :images_dir, 'img'

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Enable cache buster
  activate :asset_hash, :ignore => [/^img/]

  # Use relative URLs
  activate :relative_assets

  # https://github.com/plasticine/middleman-imageoptim
  activate :imageoptim do |options|
    options.pngout = false
    options.svgo = false
  end
end

activate :deploy do |deploy|
  deploy.method = :git
  deploy.branch = "gh-pages"
  deploy.build_before = true
end
