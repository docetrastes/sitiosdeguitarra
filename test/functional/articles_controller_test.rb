require 'test_helper'

class ArticlesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Articles.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Articles.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Articles.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to articles_url(assigns(:articles))
  end

  def test_edit
    get :edit, :id => Articles.first
    assert_template 'edit'
  end

  def test_update_invalid
    Articles.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Articles.first
    assert_template 'edit'
  end

  def test_update_valid
    Articles.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Articles.first
    assert_redirected_to articles_url(assigns(:articles))
  end

  def test_destroy
    articles = Articles.first
    delete :destroy, :id => articles
    assert_redirected_to articles_url
    assert !Articles.exists?(articles.id)
  end
end
