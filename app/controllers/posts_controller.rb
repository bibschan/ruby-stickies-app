class PostsController < ApplicationController
	before_action :find_post, only: [:show, :edit, :update, :destroy]	

  #index is a controller action -> collect information for the view
  #controller gets data from the model and displays in the view
  #create all CRUD actions in your controller

  def index
  	#the newest post will be displayed. created_at is a variable auto added to all rows in the DB
  	@posts = Post.all.order("created_at DESC")
  end

  def new
  	@post = Post.new
  end

  def create
  	# @post is an instance variable
  	@post = Post.new(post_params)
  	if @post.save
  		redirect_to @post
  	else
  		render 'new'
  	end
  end	

  def show
  end

   def edit

  end

  def update
  	 if @post.update(post_params)
  	 	redirect_to @post
  	 else 
  	 	render 'edit'
  	 end
  end

  def destroy
  	@post.destroy
  	redirect_to root_path
  end


  private

  def find_post
  	@post = Post.find(params[:id])
  end

  def post_params
  	# this is a security layer from Rails - you need to whitelist those attributes
  	#permits the view to acecss, write, update, deleet those variables that were permitted
  		params.require(:post).permit(:title, :body)
  	end
  end
