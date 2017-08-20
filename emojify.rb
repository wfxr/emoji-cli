#!/usr/bin/env ruby
require_relative './dict.rb'

def emojify(line)
    line.gsub(/(:\w+:)/) { |w| @dict[w[1..-2]]&.chr('utf-8') || w }
end

def emojify_lines()
    while line = gets
        puts emojify line
    end
end

def get_emoji(v)
    begin
        if v.is_a?(Integer)
            v.chr('utf-8')
        else
            v.reduce('') { |r, x| r += x.chr('utf-8') }
        end
    rescue
        v
    end
end

def get_code(v)
    begin
        if v.is_a?(Integer)
            "0x%X" % v
        else
            v.map { |x| "0x%X" % x }.join(",")
        end
    rescue
        v
    end
end

def list_emoji()
    @dict.each do |k, v|
        puts "%s %s %s" % [k, get_code(v), get_emoji(v)]
    end
end

if ARGV.empty?
    emojify_lines
elsif ARGV.length == 1 && ARGV[0] == '-l'
    list_emoji
else
    puts "Usage: emojify [-l]"
end
