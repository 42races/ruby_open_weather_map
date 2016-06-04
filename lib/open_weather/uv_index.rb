
module OpenWeather

  # Access UV index (Clear Sky) for any location on Earth! Data is available in JSON.
  class UvIndex < Base

    # http://api.openweathermap.org/v3/uvi/{location}/{datetime}.json?appid={api_key}
    # location Location coordinates format is {lat},{lon}
    # datetime ISO 8601 date or alias
    # api_key Your API key

    # Documentation
    # http://openweathermap.org/api/uvi

    # Date values
    # 2016-01-02T15:04:05Z searches between 2016-01-02T15:04:05Z and 2016-01-02T15:04:05.9999Z
    # 2016-01-02T15:04Z searches between 2016-01-02T15:04:00Z and 2016-01-02T15:04:59.9999Z
    # 2016-01-02T15Z searches between 2016-01-02T15:00:00Z and 2016-01-02T15:59:59.9999Z
    # 2016-01-02Z searches between 2016-01-02T00:00:00Z and 2016-01-02T23:59:59.9999Z
    # 2016-01Z searches between 2016-01-01T00:00:00Z and 2016-12-31T23:59:59.9999Z
    # 2016Z searches between 2016-01-01T00:00:00Z and 2016-12-31T23:59:99.9999Z

    # Digits beyond decimal point to search radius
    # No decimal part ~78km
    # 1 digit 7862 m
    # 2 digits 786 m
    # 3 digits 78 m
    # 4 digits 8 m
    # 5 digits 1 m

    attr_accessor :base_url

    def initialize(options = {})
      base_url = 'http://api.openweathermap.org/v3/uvi/'
      super(base_url, options)
    end

    private

    def target_url
      valid_options = [:lat, :lng, :datetime, :api_key]
      raise AuthError unless options.respond_to? :api_key
      "%{lat},{lng}/%{datetime}Z.json?appid=%{api_key}" % options
    end
  end
end