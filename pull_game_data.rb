require 'mechanize'
require 'json'

MILLIS_PER_HOUR = 1000 * 60 * 60

agent = Mechanize.new
agent.get('https://www.soundersfc.com/schedule?month=all&year=2017&club_options=11&op=Update&form_build_id=form-HCfmOwE70ILxjHT-icY6jGgppRmN0O1geJ8OkbA24Vc&form_id=mp7_schedule_hub_search_filters_form')

match_divs = agent.page.search('div.match_meta')

def val(match, sel)
  match.search(sel).text
end

matches = match_divs.map do |match|
  date = val(match, '.match_date')
  date_string = date.chomp.gsub('PT', 'PST').gsub('2017 ', '')
  {
    date: date_string,
    matchup: val(match, '.match_matchup').gsub('at ', ''),
    location: val(match, '.match_location_short'),
    time_in_milliseconds: DateTime.parse(date).strftime('%Q').to_i + (7 * MILLIS_PER_HOUR)
  }
end

File.write 'match_data.json', JSON.generate(matches)
