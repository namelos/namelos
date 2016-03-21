class StaticPagesController < ApplicationController
  def home
    @props = { name: 'react' }
  end

  def help
  end

  def about
  end

  def contact
  end
end
