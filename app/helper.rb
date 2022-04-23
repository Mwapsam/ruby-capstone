module Helper
  def time_format(date)
    "#{date.year}-#{date.month}-#{date.day}"
  end

  def select_year
    print 'Year: '
    year = gets.chomp.to_i
    while year < 1800 || year > Time.now.year
      puts 'Select a correct year'
      print 'Year: '
      year = gets.chomp.to_i
    end
    year
  end

  def select_month
    print 'Month: '
    month = gets.chomp.to_i
    while month < 1 || month > 12
      puts 'Select a correct month'
      print 'Month: '
      month = gets.chomp.to_i
    end
    month
  end

  def select_day
    print 'Day: '
    day = gets.chomp.to_i
    while day < 1 || day > 31
      puts 'Select a correct day'
      print 'Day: '
      day = gets.chomp.to_i
    end
    day
  end
end
