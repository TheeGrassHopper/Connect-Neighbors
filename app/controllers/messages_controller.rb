class MessagesController < ApplicationController
	before_action :find_message, only: [:show, :edit, :destroy, :update]
	before_action :authenticate_user!, except: [:index, :show]
	def index
		@messages = Message.all.order("created_at DESC")
	end

	def show
	end

	def new
		@message = current_user.messages.build
	end

	def edit

	end

	def update
		respond_to do |format|
    		if @message.update(message_params)
       			format.html { redirect_to message_path, notice: 'message was successfully updated.'}
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
		@message = current_user.messages.build(message_params)
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

