class CommentsController < ApplicationController
    def create
      @photo = Photo.find(params[:photo_id])
      @comment = current_user.comments.create(comments_params.merge(photo_id: @photo.id))
      if @comment.save
        redirect_to photo_path(@comment.photo), notice: 'Comment done!'
      else
        redirect_to root_path, alert: 'Something went wrong'
      end
    end

    private
      def comments_params
        params.require(:comment).permit(:photo_id, :body)
      end
end
