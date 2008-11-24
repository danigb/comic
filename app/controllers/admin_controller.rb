class AdminController < ApplicationController

  def index
    redirect_to :action => 'pages'
  end



  def pages
    @page = params[:id] ? Page.find(params[:id]) : Page.new
    @pages = Page.find(:all)
  end

  def create_page
    page = Page.new(params[:page])
    page.save
    redirect_to :action => 'pages'
  end

  def save_page
    page = Page.find(params[:id])
    page.update_attributes(params[:page])
    redirect_to :action => 'pages'
  end

  def generate_page
    page = Page.find(params[:id])
    generated = Liquid::Template.parse(page.layout.content).render :hello => "el texto"
    render :text => generated
#    redirect_to :action => 'pages'
  end

  def layouts
    @layout = params[:id] ? Layout.find(params[:id]) : Layout.new
    @layouts = Layout.find :all
  end

  def create_layout
    layout = Layout.new(params[:layout])
    layout.save
    redirect_to :action => 'layouts'
  end

  def save_layout
    layout = Layout.find(params[:id])
    layout.update_attributes(params[:layout])
    redirect_to :action => 'layouts'
  end

  def assets
  end



end
