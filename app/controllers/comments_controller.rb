class CommentsController < ApplicationController
		before_action :find_message
		before_action :find_comment, only: [:edit, :update, :destroy]
		before_action  :authenticate_user!

	def create 
		@comment = @message.comments.create(comment_params)
		@comment.user_id = current_user.id

		respond_to do |format|
			if @comment.save
			format.html { redirect_to message_path(@message), notice: 'Your Comment was successfully created.' }
        	format.json { render :show, status: :created, location: @message}
      		else
        	format.html { render :_form , status: :unprocessable_entity }
        	format.json { render json: @comment.errors, status: :unprocessable_entity }
      		end
   		end
	end

	def edit
	end

	def update
		if @comment.update(comment_params)
			redirect_to message_path(@message)
		else
			render 'edit'
		end
	end

	def destroy
		@comment.destroy
		redirect_to message_path(@message)
	end


	private

		def comment_params
			params.require(:comment).permit(:content)
		end

		def find_message
			@message = Message.find(params[:message_id])
		end

		def find_comment
			@comment = Comment.find(params[:id])
		end

end
