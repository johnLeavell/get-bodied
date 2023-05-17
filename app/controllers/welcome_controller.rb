class WelcomeController < ApplicationController
  def index
    render({ template: 'welcome/index.html.erb' })
  end
end
