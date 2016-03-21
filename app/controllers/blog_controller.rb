class BlogController < ApplicationController
  def index
    @article = markdown('`console.log("test")`')
  end
end
