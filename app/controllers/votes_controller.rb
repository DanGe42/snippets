class VotesController < ApplicationController
  def upvote
    @snippet = Snippet.find(params[:snippet])
    current_user.upvote_or_remove(@snippet)

    respond_to do |format|
      format.html { redirect_to request.referrer }
      format.json { head :no_content }
    end
  end

  def downvote
    @snippet = Snippet.find(params[:snippet])
    current_user.downvote_or_remove(@snippet)

    respond_to do |format|
      format.html { redirect_to request.referrer }
      format.json { head :no_content }
    end
  end
end
