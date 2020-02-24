class SeasController < ApplicationController
  #define your controller actions here
  def index
    @seas = Sea.all
  end

  def new
    
  end

  get "/seas/:id" do
    @sea = Sea.find(params[:id])
    erb :'show.html'
  end

  post "/seas" do
    @sea = Sea.new(params)
    @sea.save
    redirect to "/seas/#{@sea.id}"
  end

  get "/seas/:id/edit" do
    @sea = Sea.find(params[:id])

    erb :'edit.html'
  end

  patch "/seas/:id" do
    @sea = Sea.find(params[:id])
    params.delete("_method")
    params[:has_mermaids] ||= false
    @sea.update(params)
    redirect to "/seas/#{@sea.id}"
  end

  delete "/seas/:id" do
    @sea = Sea.find(params[:id])
    @sea.destroy
    redirect to "/seas"
  end

end


  private
  # In controller actions, use this private method to access sea params from forms.
  # Example: @sea.update(sea_params)
  # check the return value of sea_params to see what you're working with!
  def sea_params
    params.require(:sea).permit(:name, :temperature, :bio, :mood, :image_url, :favorite_color, :scariest_creature, :has_mermaids)
  end

end
