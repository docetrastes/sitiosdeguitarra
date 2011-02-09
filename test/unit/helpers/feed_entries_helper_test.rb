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
    
    should "Remove 'Slide Show' message on posts from Guitarrista.com" do
      s = replace_particularities(%{<img title="65amps &quot;EMPIRE&quot;" class="imagefield imagefield-field_image" src="http://www.guitarrista.com/sites/default/files/image/65amps_Empire.jpg?1297050764" height="235" alt="65amps &quot;EMPIRE&quot;" width="350" />Slide Show Cabezal a válvulas de 22W con 3 sonidos diferenciados El "Empire" es el resultado de 4 años de investigación y desarrollo por parte de los fundadores de 65amps,...})      
      assert_equal s, %{<img title="65amps &quot;EMPIRE&quot;" class="imagefield imagefield-field_image" src="http://www.guitarrista.com/sites/default/files/image/65amps_Empire.jpg?1297050764" height="235" alt="65amps &quot;EMPIRE&quot;" width="350" /> Cabezal a válvulas de 22W con 3 sonidos diferenciados El "Empire" es el resultado de 4 años de investigación y desarrollo por parte de los fundadores de 65amps,...}
    end
  end
end
