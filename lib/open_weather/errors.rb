module OpenWeather
  class AuthError < StandardError
    def message
      "Please provide the APPID, http://openweathermap.org/appid"
    end
  end
end