class MeetingMembersController < ApplicationController
  before_action :set_meeting_member, only: [:show, :edit, :update, :destroy]

  # GET /meeting_members
  # GET /meeting_members.json
  def index
    @meeting_members = MeetingMember.all
  end

  # GET /meeting_members/1
  # GET /meeting_members/1.json
  def show
  end

  # GET /meeting_members/new
  def new
    @meeting_member = MeetingMember.new
  end

  # GET /meeting_members/1/edit
  def edit
  end

  # POST /meeting_members
  # POST /meeting_members.json
  def create
    @meeting_member = MeetingMember.new(meeting_member_params)

    respond_to do |format|
      if @meeting_member.save
        format.html { redirect_to @meeting_member, notice: 'Meeting member was successfully created.' }
        format.json { render :show, status: :created, location: @meeting_member }
      else
        format.html { render :new }
        format.json { render json: @meeting_member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /meeting_members/1
  # PATCH/PUT /meeting_members/1.json
  def update
    respond_to do |format|
      if @meeting_member.update(meeting_member_params)
        format.html { redirect_to @meeting_member, notice: 'Meeting member was successfully updated.' }
        format.json { render :show, status: :ok, location: @meeting_member }
      else
        format.html { render :edit }
        format.json { render json: @meeting_member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meeting_members/1
  # DELETE /meeting_members/1.json
  def destroy
    @meeting_member.destroy
    redirect_to edit_meeting_path(@meeting_member.meeting_id), notice: 'Meeting member was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meeting_member
      @meeting_member = MeetingMember.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def meeting_member_params
      params.require(:meeting_member).permit(:member_id, :meeting_id, :organizer)
    end
end
