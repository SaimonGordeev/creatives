class MarkdownController < ApplicationController

  layout false

  def preview
    @text = params[:data]
  end

end
