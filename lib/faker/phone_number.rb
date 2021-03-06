module Faker::PhoneNumber
  extend self

  NANP_NPA_CODES = [
    201, 202, 203, 204, 205, 206, 207, 208, 212, 213, 214, 215, 216, 217, 218,
    301, 302, 303, 304, 305, 306, 307, 312, 313, 314, 315, 316, 317, 319, 401,
    402, 403, 404, 405, 406, 412, 413, 414, 415, 416, 418, 419, 501, 502, 503,
    504, 505, 512, 513, 514, 515, 517, 518, 601, 602, 603, 604, 605, 612, 613,
    614, 616, 617, 618, 701, 702, 703, 704, 712, 713, 715, 716, 717, 801, 802,
    803, 812, 814, 815, 816, 901, 902, 913, 914, 915, 916, 219, 417, 516, 714,
    519, 813, 817, 918, 308, 507, 606, 607, 615, 912, 919, 506, 608, 209, 309,
    318, 509, 705, 805, 806, 808, 819, 907, 609, 809, 408, 707, 906, 709, 807,
    904, 804, 619, 409, 710, 718, 818, 407, 508, 719, 708, 903, 310, 410, 510,
    908, 210, 706, 909, 917, 810, 905, 910, 610, 334, 352, 360, 423, 441, 520,
    540, 541, 770, 860, 864, 941, 954, 970, 242, 246, 250, 268, 281, 320, 345,
    561, 573, 630, 664, 757, 758, 773, 787, 847, 869, 937, 972, 228, 240, 248,
    253, 254, 264, 267, 284, 330, 336, 340, 425, 435, 440, 443, 473, 530, 562,
    580, 626, 649, 650, 660, 732, 734, 740, 760, 765, 767, 781, 785, 830, 850,
    867, 868, 870, 876, 920, 931, 940, 956, 973, 978, 225, 252, 256, 323, 450,
    559, 570, 651, 678, 720, 724, 727, 775, 784, 786, 828, 831, 843, 925, 949,
    231, 262, 270, 321, 337, 347, 361, 469, 480, 484, 623, 631, 636, 646, 661,
    662, 780, 832, 856, 858, 863, 865, 229, 234, 478, 571, 641, 682, 763, 845,
    859, 936, 952, 971, 979, 989, 251, 276, 289, 339, 351, 386, 434, 551, 563,
    586, 620, 647, 731, 754, 774, 848, 857, 862, 878, 928, 939, 980, 985, 224,
    260, 269, 479, 567, 574, 585, 772, 947, 239, 325, 430, 432, 951, 769, 829,
    226, 424, 438, 331, 575, 762, 779, 581, 587, 657, 778, 385, 442, 475, 681,
    747, 872, 343, 458, 470, 534, 579, 938, 249, 531, 539, 721, 929, 431, 667,
    669, 873, 984, 236, 272, 365, 437, 639, 737, 346, 364, 725, 782, 930, 959,
    220, 548, 628, 629, 854, 825
  ].map(&:to_s)

  def phone_number(options={})
    nanp_phone_number(options)
  end

  def cell_phone(options={})
    nanp_phone_number(options)
  end

  # http://en.wikipedia.org/wiki/North_American_Numbering_Plan
  def nanp_phone_number(options={})
    itucc = ['', '+1'].sample

    npa = NANP_NPA_CODES.sample

    co = [(2..9).to_a.sample, (0..9).to_a.sample]
    co <<  (co.last == 1 ? ((2..9).to_a << 0).sample : (0..9).to_a.sample)
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
    parens = sep != '.' && [true, false].sample

    phone = itucc + [' ', ''].sample
    phone += (parens ? '(' + npa + ')' : npa)
    phone += (parens ? ' ' : sep) + co + sep + sn
    phone += extsep + extname + ext if options[:extension]
    phone.gsub!(/\s+/, ' ')
    phone
  end

end
