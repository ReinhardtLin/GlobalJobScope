module UserExperiencesHelper
  def location_links(locations)
    locations.split(",").map{|location| link_to location.strip, location_path(location.strip) }.join(", ")
  end
end
