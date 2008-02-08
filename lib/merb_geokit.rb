# make sure we're running inside Merb
if defined?(Merb::Plugins)

  # Merb gives you a Merb::Plugins.config hash...feel free to put your stuff in your piece of it
  Merb::Plugins.config[:merb_geokit] = {
    :chickens => false
  }
  
  require 'merb_geokit/defaults'
  require 'merb_geokit/geocoders'
  require 'merb_geokit/mappable'
  require 'merb_geokit/acts_as_mappable'
  require 'merb_geokit/ip_geocode_lookup'
  
  config_file = File.join(Merb.root, "config", "geokit.rb")
  unless File.exists?(config_file)
    from = File.join(File.dirname(__FILE__), "skeleton", "api_keys_template")
    FileUtils.cp(from,config_file)
    puts "\n**** New GeoKit Installation Found\n"
    puts "A default config file was created at:"
    puts "\n#{config_file}\n\nPlease edit this file first and add your API keys.\n\n"
    exit
  end

  require config_file

  # Automatically mix in distance finder support into ActiveRecord classes.
  ActiveRecord::Base.send :include, GeoKit::ActsAsMappable
  
  Merb::Plugins.add_rakefiles "merb_geokit/merbtasks"
end

Merb::BootLoader.after_app_loads do
  Application.send(:include, GeoKit::IpGeocodeLookup)
end