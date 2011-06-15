Factory.define :article do |a|
  a.title  'Some article'
  a.body   'Best article evar!' * 50
  a.publish_date Date.today
end
