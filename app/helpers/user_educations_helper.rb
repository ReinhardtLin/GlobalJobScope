module UserEducationsHelper
  def location_links(locations)
    locations.split(",").map{|location| link_to location.strip, location_path(location.strip) }.join(", ")
  end

  def profession_links(professions)
    professions.split(",").map{|profession| link_to profession.strip, profession_path(profession.strip) }.join(", ")
  end
end
