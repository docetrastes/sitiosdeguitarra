# Encoding: utf-8
require 'test_helper'

class SiteTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Site.new(:title => "Guitarra con Andrés", :url => "http://guitarra-con-andres.com", :review => "Very good.").valid?
  end
end
