class MessagesController < ApplicationController
	before_action :find_message, only: [:show, :edit, :destroy, :update]
	def index
		@messages = Message.all.order("created_at DESC")
	end

	def show
	end

	def new
		@message = Message.new
	end

	def edit

	end

	def update
		respond_to do |format|
    		if @message.update(message_params)
       			format.html { redirect_to @message, notice: 'message was successfully updated.'}
        		format.json { render :show, status: :ok, location: @message }
      		else
        		format.html {render :edit}
        		format.json {render json: @message.errors, status: :unprocessable_entity }
        		render 'edit'
    		end
    	end
	end

	def destroy

		@message.destroy
		redirect_to root_path
	end
	
	def create
		@message = Message.new(message_params)
		if @message.save
			redirect_to root_path
		else
			render 'new'
		end
	end	
	
	private

		def find_message
			@message = Message.find(params[:id])
		end

		def message_params
			params.require(:message).permit(:title, :description)
	 	end
end

