class PrototypesController < ApplicationController
  #以下は特にしていないけど作成した
  before_action :authenticate_user!, except: [:show, :index]

  def index
    @prototypes = Prototype.all
  end

  def new
    @prototype = Prototype.new
    #prototypeかprotospaceかはわからず。
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
    @comments = @prototype.comments
  end
  #showについてはpictweetを参考にしている。

  def edit
    unless user_signed_in?
      redirect_to action: :index
    end
    @prototype = Prototype.find(params[:id])
  end

  def update
       prototype = Prototype.find(params[:id])
    if prototype.update(prototype_params)
       redirect_to prototype_path(prototype.id)
    else
      @prototype = Prototype.find(params[:id])
      render :edit
    end
  end

  def destroy
    prototype = Prototype.find(params[:id])
    prototype.destroy
    redirect_to root_path
  end

  private

  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)

  #上記は若干怪しい。確実性を求めるために再テスト。
  end

end

