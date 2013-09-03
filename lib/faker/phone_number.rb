module Faker::PhoneNumber
  extend self

  def phone_number(options)
    nanp_phone_number(options)
  end

  def cell_phone(options)
    nanp_phone_number(options)
  end

  # http://en.wikipedia.org/wiki/North_American_Numbering_Plan
  def nanp_phone_number(options)
    itucc = ['', '+1', '1'].sample

    npa = (2..9).to_a.sample.to_s + (0..8).to_a.sample.to_s + (0..9).to_a.sample.to_s

    co = [(2..9).to_a.sample, (0..9).to_a.sample]
    co <<  (co.last == 1 ? ((2..9).to_a << 0).to_a.sample : (0..9).to_a.sample)
    co = co.join

    sn = []
    4.times { sn << (0..9).to_a.sample }
    sn = sn.join

    ext = []
    4.times { ext << (0..9).to_a.sample }
    ext = ext.join
    extsep = [' ', ''].sample
    extname = ['x', 'ex.', 'ex', 'ext', 'extension'].sample + [' ', ''].sample

    sep = ['-', ' ', '.'].sample
    parens = [true, false].sample

    phone = itucc + [' ', ''].sample
    phone += (parens ? '(' + npa + ')' : npa)
    phone += sep + co + sep + sn
    phone += extsep + extname + ext if !(options[:extension] == false)
    phone.gsub(/\s/, ' ')
    phone
  end

end
