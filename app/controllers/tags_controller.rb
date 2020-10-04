class TagsController < ApplicationController
  before_action :set_tag, only: [:show, :update, :destroy]
  before_action :check_tag_exists, only: [:create]

  # GET /tags
  def index
    @tags = Tag.all

    render json: @tags
  end

  # GET /tags/1
  def show
    render json: @tag
  end

  # POST /tags
  def create
    @tag = Tag.new(tag_params)
  
    if @tag.save
      render json: @tag, status: :created, location: @tag
    else
      render json: @tag.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tags/1
  def update
    if @tag.update(tag_params)
      render json: @tag
    else
      render json: @tag.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tags/1
  def destroy
    @tag.destroy
  end

  #Get tags by name
  def nameindex
    @tag = Tag.where('name = ?', params[:name] )
    render json: @tag
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tag
      @tag = Tag.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def tag_params
      params.require(:tag).permit(:name, :post_id)
    end
    
    def check_tag_exists
      @tag = Tag.find_by_name(self.name)
      if @tag != nil
        self.post_id.push(:post_id)
      end
   end
end
