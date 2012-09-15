class TagstosnipsController < ApplicationController
  # GET /tagstosnips
  # GET /tagstosnips.json
  def index
    @tagstosnips = Tagstosnip.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tagstosnips }
    end
  end

  # GET /tagstosnips/1
  # GET /tagstosnips/1.json
  def show
    @tagstosnip = Tagstosnip.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tagstosnip }
    end
  end

  # GET /tagstosnips/new
  # GET /tagstosnips/new.json
  def new
    @tagstosnip = Tagstosnip.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tagstosnip }
    end
  end

  # GET /tagstosnips/1/edit
  def edit
    @tagstosnip = Tagstosnip.find(params[:id])
  end

  # POST /tagstosnips
  # POST /tagstosnips.json
  def create
    @tagstosnip = Tagstosnip.new(params[:tagstosnip])

    respond_to do |format|
      if @tagstosnip.save
        format.html { redirect_to @tagstosnip, notice: 'Tagstosnip was successfully created.' }
        format.json { render json: @tagstosnip, status: :created, location: @tagstosnip }
      else
        format.html { render action: "new" }
        format.json { render json: @tagstosnip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tagstosnips/1
  # PUT /tagstosnips/1.json
  def update
    @tagstosnip = Tagstosnip.find(params[:id])

    respond_to do |format|
      if @tagstosnip.update_attributes(params[:tagstosnip])
        format.html { redirect_to @tagstosnip, notice: 'Tagstosnip was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tagstosnip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tagstosnips/1
  # DELETE /tagstosnips/1.json
  def destroy
    @tagstosnip = Tagstosnip.find(params[:id])
    @tagstosnip.destroy

    respond_to do |format|
      format.html { redirect_to tagstosnips_url }
      format.json { head :no_content }
    end
  end
end
