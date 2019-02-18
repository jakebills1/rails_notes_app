class NotesController < ApplicationController
  def index
    @notes = Note.all
    #returns all notes in db
  end

  def show
    @note = Note.find(params[:id])
    #finds a note by id
  end

  def new
    @note = Note.new
    #creates a new note in memory
  end

  def create
    @note = Note.new(notes_params)

    if @note.save
      redirect_to notes_path
    else
      render :new
    end
  end

  private 
    def notes_params
      params.require(:note).permit(:title, :author, :body)
    end
end
