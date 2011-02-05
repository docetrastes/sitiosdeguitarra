# encoding: utf-8
require 'test_helper'

class FeedEntriesHelperTest < ActionView::TestCase
  context "#replace_particularities" do
    should "Replace 'Image: URL' with appropriate Textile image tags" do
      s = replace_particularities("Image: http://1.bp.blogspot.com/__6gBbNSWeK8/THlcb5JSqdI/AAAAAAAABY4/d6bdLBA3mOg/s1600/Behemoth-Nergal.jpg
      El líder de la popular banda polaca...")
      
      assert_equal s, "!(centered)http://1.bp.blogspot.com/__6gBbNSWeK8/THlcb5JSqdI/AAAAAAAABY4/d6bdLBA3mOg/s1600/Behemoth-Nergal.jpg!
      El líder de la popular banda polaca..."
    end
  end
end
