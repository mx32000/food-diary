# frozen_string_literal: true

# entries controller
class EntriesController < ApplicationController
  before_action :set_entry, only: %i[show edit update destroy]

  # GET /users/:user_id/entries
  def index
    @entries = current_user.entries
  end

  # GET /users/:user_id/entries/:id
  def show; end

  # GET /users/:user_id/entries/new
  def new
    @entry = current_user.entries.build
  end

  # POST /users/:user_id/entries
  def create
    @entry = current_user.entries.build(entry_params)
    if @entry.save
      redirect_to @entry, notice: 'Entry was successfully created.'
    else
      render :new
    end
  end

  # GET /users/:user_id/entries/:id/edit
  def edit; end

  # PATCH/PUT /users/:user_id/entries/:id
  def update
    if @entry.update(entry_params)
      redirect_to @entry, notice: 'Entry was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /users/:user_id/entries/:id
  def destroy
    @entry.destroy
    redirect_to entries_path, notice: 'Entry was successfully destroyed.'
  end

  private

  def set_entry
    @entry = @user.entries.find(params[:id])
  end

  def entry_params
    params.require(:entry).permit(:food_id, :quantity, :consumed_at)
  end
end
