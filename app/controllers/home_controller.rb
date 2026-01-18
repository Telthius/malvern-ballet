
class HomeController < ApplicationController
  def index
    @gallery = Gallery.all.first
    
    set_meta_tags(
      title: "Professional Ballet Classes in Darfield, Canterbury",
      description: "Malvern Ballet School in Darfield, Canterbury offers professional ballet classes for all ages. RAD qualified teaching, Progressive Ballet Technique, adult ballet, and bootybarre fitness. Join our dance community in the Darfield region today!",
      keywords: "ballet darfield, darfield ballet, dance darfield, darfield dance, ballet classes darfield, dance classes darfield, ballet school darfield, dance school darfield, RAD ballet darfield, dance lessons canterbury, ballet lessons canterbury, malvern ballet school, ballet darfield region, dance darfield region"
    )
  end
end

