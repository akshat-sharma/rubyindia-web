class HomeController < ApplicationController

  def index
    render layout: 'landing'
  end

  def newsletter
    render layout: 'issue'
  end

  def submit_link
    #hit by xhr post
    content = {
      link: params[:content_link],
      link_description: params[:content_link_description]
    }

    #notify reviewers
    Mailer.new_content_notify(content).deliver

    render text: "We are notified, Thank You"
  end
end
