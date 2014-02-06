require 'spec_helper'

describe Entry do
  ["http://jsfiddle.net/cavneb/XbDEM/3/", "http://jsfiddle.net/cavneb/XbDEM/3/embedded/result/"].each do |url|
    it ".new_from_url('#{url}')" do
      entry = Entry.new_from_url(url)
      entry.site.should == Drivers::Jsfiddle.name
      entry.revision.should == 3
      entry.remote_id.should == 'XbDEM'
    end
  end
  ["http://jsbin.com/eVIyOTE/3/edit", "http://jsbin.com/eVIyOTE/3/", "http://jsbin.com/eVIyOTE/3/edit?html,output", 
   "http://emberjs.jsbin.com/eVIyOTE/3/edit", "http://emberjs.jsbin.com/eVIyOTE/3/", "http://emberjs.jsbin.com/eVIyOTE/3/edit?html,css,js,output"].each do |url|
    it ".new_from_url('#{url}')" do
      entry = Entry.new_from_url(url)
      entry.site.should == Drivers::Jsbin.name
      entry.revision.should == 3
      entry.remote_id.should == 'eVIyOTE'
    end
  end
  ["http://codepen.io/cxanthos/pen/hbgIL", "http://codepen.io/cxanthos/details/hbgIL"].each do |url|
    it ".new_from_url('#{url}')" do
      entry = Entry.new_from_url(url)
      entry.site.should == Drivers::Codepen.name
      entry.username.should == 'cxanthos'
      entry.remote_id.should == 'hbgIL'
    end
  end
  ["http://plnkr.co/edit/bN8Z0j?p=preview", "http://plnkr.co/edit/bN8Z0j", "http://embed.plnkr.co/bN8Z0j/preview"].each do |url|
    it ".new_from_url('#{url}')" do
      entry = Entry.new_from_url(url)
      entry.site.should == Drivers::Plnkr.name
      entry.remote_id.should == 'bN8Z0j'
    end
  end
end

