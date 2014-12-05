module JobsHelper
  def location_links(locations)
    locations.split(",").map{|location| link_to location.strip, location_path(location.strip) }.join(", ")
  end

  def location_cloud(locations, classes)
    max = locations.sort_by(&:count).last
    locations.each do |location|
      index = location.count.to_f / max.count * (classes.size-1)
      yield(location, classes[index.round])
    end
  end
end
