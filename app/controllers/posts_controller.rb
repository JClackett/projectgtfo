class PostsController < ApplicationController

# ---------------------------------------------------------------------------------------------------------------------------------------------------------------
# CALLBACKS  
# ---------------------------------------------------------------------------------------------------------------------------------------------------------------
	load_and_authorize_resource
	before_action :set_post, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, except: [:index, :show]
	before_action :sidebar_tags

# ---------------------------------------------------------------------------------------------------------------------------------------------------------------
# GET : Index
# ---------------------------------------------------------------------------------------------------------------------------------------------------------------

	def index
		if params[:tag].present?
			@posts = Post.joins(:tags).where(tags: { title: params[:tag] } ).paginate(page: params[:page], per_page: 10).ordered_by_reverse_order
		else
			@posts = Post.paginate(page: params[:page], per_page: 10).ordered_by_reverse_order
		end

		respond_to do |format|
		  format.html
		  format.js
		end

	end

# ---------------------------------------------------------------------------------------------------------------------------------------------------------------
# GET : Show
# ---------------------------------------------------------------------------------------------------------------------------------------------------------------

	def show
	end

# ---------------------------------------------------------------------------------------------------------------------------------------------------------------
# GET : New
# ---------------------------------------------------------------------------------------------------------------------------------------------------------------

	def new
		@post = Post.new
	end

# ---------------------------------------------------------------------------------------------------------------------------------------------------------------
# GET : Edit
# ---------------------------------------------------------------------------------------------------------------------------------------------------------------

	def edit
	end

# ---------------------------------------------------------------------------------------------------------------------------------------------------------------
# POST : Create
# ---------------------------------------------------------------------------------------------------------------------------------------------------------------

	def create

	@post = current_user.posts.new(post_params)  # Assign user id to Post

	respond_to do |format|

		if @post.save
			format.html { redirect_to root_path, notice: 'Post was successfully created.' }
			format.json { render :show, status: :created, location: @post }
		else
			format.html { render :new }
			format.json { render json: @post.errors, status: :unprocessable_entity }
		end

	end

	end

# ---------------------------------------------------------------------------------------------------------------------------------------------------------------
# PUT : Update
# ---------------------------------------------------------------------------------------------------------------------------------------------------------------

	def update
	respond_to do |format|
	  if @post.update(post_params)
	    format.html { redirect_to root_path, notice: 'Post was successfully updated.' }
	    format.json { render :show, status: :ok, location: @post }
	  else
	    format.html { render :edit }
	    format.json { render json: @post.errors, status: :unprocessable_entity }
	  end
	end
	end

# ---------------------------------------------------------------------------------------------------------------------------------------------------------------
# DELETE : Destroy
# ---------------------------------------------------------------------------------------------------------------------------------------------------------------

	def destroy
	@post.destroy
	respond_to do |format|
	  format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
	  format.json { head :no_content }
	end
	end

# ---------------------------------------------------------------------------------------------------------------------------------------------------------------
# PRIVATE 
# ---------------------------------------------------------------------------------------------------------------------------------------------------------------

	private
	
	# Use callbacks to share common setup or constraints between actions.
	def set_post
	  @post = Post.find(params[:id])
	end

	# Never trust parameters from the scary internet, only allow the white list through.
	def post_params
	  params.require(:post).permit(:title, :text, :user_id, :video, :first_name, :photo, tag_ids: [] )
	end

end
