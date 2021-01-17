require 'time'
require 'date'

module Generator
  def date_generator
    Time.now.strftime("%d%m%y")
  end

  def key_generator
    (0..99999).to_a.sample.to_s.rjust(5, "0")[0..4]
  end
end
