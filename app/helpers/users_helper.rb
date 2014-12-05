module UsersHelper
  def country_links(countries)
    countries.split(",").map{|country| link_to country.strip, country_path(country.strip) }.join(", ")
  end

  def country_cloud(countries, classes)
    max = countries.sort_by(&:count).last
    countries.each do |country|
      index = country.count.to_f / max.count * (classes.size-1)
      yield(country, classes[index.round])
    end
  end
end
