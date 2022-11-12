module GistsHelper
    
  include Rails.application.routes.url_helpers

  def test_link(question)
    link_to question.body.truncate(25), admin_question_path(question)
  end

  def gist_url(gist)
    hash = gist.url.split('/').last
    link_to hash, gist.url, target: '_blank'
  end

  def user_email(gist)
    gist.user.email
  end
end
