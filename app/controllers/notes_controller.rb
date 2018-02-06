class NotesController < ApplicationController
  load_and_authorize_resource only: [:edit, :show, :update]

  def create
    @note = Note.new(note_params)
    @note.user = User.find_by_id(session[:user_id])
    @note.save
    redirect_to '/'
  end

  def new
    @note = Note.new
  end

  def index
    @notes = Note.all
  end

  def show
  end

  def edit
  end

  def update
    @note.update(note_params)
    redirect_to '/'
  end

  def destroy
    @note.destroy
    redirect_to notes_path
  end

  private

  def note_params
    params.require(:note).permit(:content, :visible_to)
  end

end
