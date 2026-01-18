class ApplicationController < ActionController::Base
  # Default meta tags for all pages
  before_action :set_default_meta_tags

  private

  def set_default_meta_tags
    site_name = "Malvern Ballet School"
    location = "Darfield"
    og_image = "#{request.base_url}#{ActionController::Base.helpers.asset_path('hero.webp')}"
    
    set_meta_tags(
      site: site_name,
      title: "Professional Ballet Classes in #{location}, Canterbury",
      description: "Malvern Ballet School offers professional ballet classes in #{location}, Canterbury. RAD qualified teaching, Progressive Ballet Technique, adult classes, and more. Join our dance community today!",
      keywords: "ballet darfield, darfield ballet, dance darfield, darfield dance, ballet classes darfield, dance classes darfield, ballet school darfield, dance school darfield, RAD ballet darfield, dance lessons canterbury, ballet lessons canterbury, malvern ballet school",
      og: {
        site_name: site_name,
        locale: 'en_NZ',
        image: og_image
      },
      twitter: {
        card: 'summary_large_image',
        image: og_image
      }
    )
  end
end

