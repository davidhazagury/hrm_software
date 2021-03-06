class NotesController < ApplicationController
  def index
    @worker = Worker.find(params[:worker_id])
    @notes = policy_scope(Note.where('worker_id = ?', params[:worker_id]))
  end

  def new
    @worker = Worker.find(params[:worker_id])
    @note = Note.new()
    authorize @note
  end

  def create
    @worker = Worker.find(params[:worker_id])
    @note = Note.new(note_params)
    @note.worker = @worker
    authorize @note
    if @note.save
      redirect_to worker_notes_path(@worker), notice: "Nota creado correctamente"
    else
      render :new, alert: 'Revisar errores'
    end
  end

  def edit
    @worker = Worker.find(params[:worker_id])
    @note = Note.find(params[:id])
    authorize @note
  end

  def update
    @worker = Worker.find(params[:worker_id])
    @note = Note.find(params[:id])
    authorize @note
    if @note.update(note_params)
      redirect_to worker_notes_path(@worker), notice: "Nota actualizado correctamente"
    else
      render :edit, alert: "Revisar errores."
    end
  end

  def destroy
    @note = Note.find(params[:id])
    authorize @note
    if @note.destroy
      redirect_to worker_notes_path(@note.worker), notice: 'Nota eliminada correctamente'
    else
      redirect_to worker_notes_path(@note.worker), alert: 'Upss algo fallo'
    end
  end

  private

  def note_params
    params.require(:note).permit(:content, :worker_id)
  end
end
