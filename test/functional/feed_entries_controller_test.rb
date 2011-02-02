require 'test_helper'

class FeedEntriesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => FeedEntry.first
    assert_template 'show'
  end

  def test_edit
    get :edit, :id => FeedEntry.first
    assert_template 'edit'
  end

  def test_update_invalid
    FeedEntry.any_instance.stubs(:valid?).returns(false)
    put :update, :id => FeedEntry.first
    assert_template 'edit'
  end

  def test_update_valid
    FeedEntry.any_instance.stubs(:valid?).returns(true)
    put :update, :id => FeedEntry.first
    assert_redirected_to feed_entry_url(assigns(:feed_entry))
  end

  def test_destroy
    feed_entry = FeedEntry.first
    delete :destroy, :id => feed_entry
    assert_redirected_to feed_entries_url
    assert !FeedEntry.exists?(feed_entry.id)
  end
end
