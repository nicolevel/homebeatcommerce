class ItemsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :accesorios, :audifonos, :audiovideo, :parlantes, :stereo]
  add_breadcrumb "Inicio", :items_path

  def index
    @items = Item.search(params[:search])
  end

  def show
    @item = Item.find(params[:id])
    @items = Item.search(params[:categoria])
    add_breadcrumb @item.nombre, @item_path
  end

  def accesorios
    @items = Item.search(params[:search])
  end

  def audifonos
    @items = Item.search(params[:search])
  end

  def audiovideo
    @items = Item.search(params[:search])
  end

  def parlantes
    @items = Item.search(params[:search])
  end

  def stereo
    @items = Item.search(params[:search])
  end

  def new
    @items = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to item_path(@item)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @item.update(item_params)
    redirect_to products_path
  end

  def destroy
    @item.destroy(item_params)
    redirect_to products_path
  end

  private

  def item_params
    params.require(:items).permit(:nombre, :descripcion, :precio, :category, :marca, :color)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
