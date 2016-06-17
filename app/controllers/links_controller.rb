class LinksController < ApplicationController
  def new
    @link = Link.find_by(slug: flash[:slug]) if flash[:slug]
  end

  def create
    if link = Link.find_by(address: link_params[:address])
      flash[:slug] = link.slug
      redirect_to root_url
    else
      link = Link.new(link_params)
  
      if link.save
        flash[:slug] = link.slug
        redirect_to root_url
      else
        flash[:notice] = 'URL shortening unsuccessful'
        render :new
      end
    end
  end

  def show

  end

  private

    def link_params
      params.require(:links).permit(:address)
    end
end
