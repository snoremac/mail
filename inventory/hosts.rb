#!/usr/bin/env ruby

require 'rubygems'
require 'aws-sdk'
require 'json'

if ARGV[0] == "--host"
  puts JSON.generate({})
  exit 0
end

ec2 = AWS::EC2.new

mail_instances = ec2.instances.tagged("Name").tagged_values("mail")

groups = {
  mail: mail_instances.map(&:ip_address)
}

puts JSON.generate(groups)
