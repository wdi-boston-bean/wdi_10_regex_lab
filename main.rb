require_relative 'source'
require 'pry'

def valid_ip_addresses(string)
  string.scan /\b(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\b/
end

def valid_mit_ip_addresses(string)
  # valid_ip_addresses(string) & string.scan words starting with 18
  string.scan /\b(?:18\.{1})(?:(?:2(?:[0-4][0-9]|5[0-5])|[0-1]?[0-9]?[0-9])\.){2}(?:(?:2(?:[0-4][0-9]|5[0-5])|[0-1]?[0-9]?[0-9]))\b/
end

def non_mit_ip_addresses(string)
  valid_ip_addresses(string) - valid_mit_ip_addresses(string)
end

def valid_phone_numbers(string)
  string.scan(/[2-9]\d{2}-\d{3}-\d{4}/).uniq
end

def area_codes(string)
  string.scan /\b(?<![-.])(?:[2-9][0-8][0-9])(?![.])\b/
end

def email_addresses(string)
  string.scan /\b(?:[\w\d\S]+)@(?:[\w\d\-\.]){1,253}[\.](?:[\w]{2,3})\b/

  # [^@]*@[^@]*
end

def zip_codes(string)
  string.scan /\b\d{5}\b/
end

def hex_colors(string)
  string.scan /(?<=#)[0-9a-f]{6}\b/
end
