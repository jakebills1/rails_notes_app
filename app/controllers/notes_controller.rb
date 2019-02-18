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

  def edit
    @note = Note.find(params[:id])
  end

  def create
    @note = Note.new(notes_params)

    if @note.save
      redirect_to notes_path
    else
      render :new
    end
  end

  def update
    @note = Note.find(params[:id])
    if @note.update(notes_params)
      redirect_to notes_path
    else
      render :edit
    end
  end

  def destroy
    Note.find(params[:id]).destroy
    redirect_to notes_path
  end

  private 
    def notes_params
      params.require(:note).permit(:title, :author, :body)
    end
end
