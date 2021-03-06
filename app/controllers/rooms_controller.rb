class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :edit, :update, :destroy]

  # 会議室管理画面表示
  def index
    @rooms = Room.all
  end

  # 会議室追加画面表示
  def new
    @room = Room.new
  end

  # 会議室編集画面表示
  def edit
  end

  # 会議室追加
  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to rooms_path, notice: '会議室を作成しました。'
    else
      render :new
    end
  end

  # 会議室編集
  def update
    if @room.update(room_params)
      redirect_to rooms_path, notice: '会議室を更新しました。'
    else
      render :edit
    end
  end

  # 会議室廃止
  def destroy
    @room.destroy
    redirect_to rooms_url, notice: '会議室を廃止しました。'
  end

  private
    def set_room
      @room = Room.find(params[:id])
    end

    def room_params
      params.require(:room).permit(:name, :capacity)
    end
end
