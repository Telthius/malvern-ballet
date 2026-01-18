class SitemapController < ApplicationController
  def index
    @pages = [
      { url: root_url, changefreq: 'weekly', priority: 1.0 },
      { url: timetables_url, changefreq: 'weekly', priority: 0.8 },
      { url: ballet_levels_url, changefreq: 'monthly', priority: 0.8 }
    ]

    # Add dynamic timetable pages
    Timetable.all.each do |timetable|
      @pages << { url: timetable_url(timetable), changefreq: 'monthly', priority: 0.7 }
    end

    # Add dynamic ballet level pages
    BalletLevel.all.each do |level|
      @pages << { url: ballet_level_url(level.name), changefreq: 'monthly', priority: 0.7 }
    end

    respond_to do |format|
      format.xml
    end
  end
end

