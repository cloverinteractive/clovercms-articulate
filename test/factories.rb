Factory.define :article do |a|
  a.title  'Some article'
  a.body   'Best article evar!' * 100
  a.publish_date  lambda { Date.today }
end
