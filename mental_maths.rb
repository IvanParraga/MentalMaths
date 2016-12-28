#!/usr/bin/env ruby

class Addition
  attr_accessor :count

  def initialize(count, digits)
    @count = count
    @digits = digits
  end

  def run
    statistics = []

    count.times do 
      c = Challenge.new(@digits)
      statistics.push(c)
    end

    ok_count = 0
    ko_count = 0
    overall_time = 0
    statistics.each do |e| 
      puts e

      ok_count = ok_count + 1 if e.right
      ko_count = ko_count + 1 if !e.right
      overall_time = (overall_time + e.time_diff).round(3)
    end

    puts "Total right #{ok_count}, total incorrect #{ko_count} in #{overall_time}"
  end

  class Challenge
    attr_reader :right, :time_diff

    def initialize(digits)
      @first = rand(10 ** digits)
      @second = rand(10 ** digits)
      @result = @first + @second

      start_time = Time.now
      puts "#{@first} + #{@second}?"
      @answer = $stdin.gets.chomp
      @time_diff = Time.now - start_time

      @right = @result == @answer.to_i
    end

    def to_s
      "#{@right} -> #{@first} + #{@second} = #{@result} (#{@answer}) in #{@time_diff}"
    end
  end
end

a = Addition.new(ARGV[0].to_i, ARGV[1].to_i)
a.run

# loop do
#   input = gets.chomp
#   command, *params = input.split /\s/

#   print "#{command}\n"

#   case command
#   when /\Ahelp\z/i
#     puts Application::Console.help_text
#   when /\Aopen\z/i
#     Application::Task.open params.first
#   when /\Ado\z/i
#     Application::Action.perform *params
#   else puts 'Invalid command'
#   end
# end