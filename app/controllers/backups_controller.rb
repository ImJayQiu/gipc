class BackupsController < ApplicationController
  before_action :set_backup, only: %i[ show edit update destroy ]

  # GET /backups or /backups.json
  def index
    @backups = Backup.all
  end

  # GET /backups/1 or /backups/1.json
  def show
  end

  # GET /backups/new
  def new
    @backup = Backup.new
  end

  # GET /backups/1/edit
  def edit
  end

  # POST /backups or /backups.json
  def create
    @backup = Backup.new(backup_params)

    respond_to do |format|
      if @backup.save
        format.html { redirect_to @backup, notice: "Backup was successfully created." }
        format.json { render :show, status: :created, location: @backup }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @backup.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /backups/1 or /backups/1.json
  def update
    respond_to do |format|
      if @backup.update(backup_params)
        format.html { redirect_to @backup, notice: "Backup was successfully updated." }
        format.json { render :show, status: :ok, location: @backup }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @backup.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /backups/1 or /backups/1.json
  def destroy
    @backup.destroy
    respond_to do |format|
      format.html { redirect_to backups_url, notice: "Backup was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_backup
      @backup = Backup.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def backup_params
      params.require(:backup).permit(:cycle, :path, :remark)
    end
end
