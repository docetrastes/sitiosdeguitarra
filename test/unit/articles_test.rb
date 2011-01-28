require 'test_helper'

class ArticlesTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Articles.new.valid?
  end
end
