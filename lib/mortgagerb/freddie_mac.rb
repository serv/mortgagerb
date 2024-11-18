require "faraday"
require "nokogiri"

module Mortgagerb
  class FreddieMac
    def self.now
      parsed_data = fetch
      locate_assign(parsed_data)
    end

    def self.fetch
      response = Faraday.get("https://www.freddiemac.com/pmms/pmmsthick.html")
      html = response.body
      parsed_data = Nokogiri::HTML.parse(html)
    end

    def self.locate_assign(parsed_data)
      fmr30 = parsed_data.xpath("//div[@class='pmmsContainer']/table[@class='table1']/tr/td[1]")
      fmr15 = parsed_data.xpath("//div[@class='pmmsContainer']/table[@class='table1']/tr/td[2]")

      {
        fmr30: fmr30.text.strip.to_f,
        fmr15: fmr15.text.strip.to_f
      }
    end
  end
end
