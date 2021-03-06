require 'date'

class SnippetsController < ApplicationController
  # GET /snippets
  # GET /snippets.json
  def index
    @snippets = Kaminari.paginate_array(Snippet.order("created_at DESC")).page(params[:page]).per(10)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @snippets }
    end
  end

  # GET /top
  # GET /top.json
  def top
    time_span = params[:t]
    now = Time.now.utc
    # possible of t = {"all", "day", "month", "year"}
    # if t is not in that set, then return today ("day")

    @snippets = Snippet.order("points DESC")

    case time_span
    when "day"
      lower_bound = now - 1.day
    when "month"
      lower_bound = now - 1.month
    when "year"
      lower_bound = now - 1.year
    when "all"
      lower_bound = nil
    else    # defaults to "day"
      lower_bound = now - 1.day
    end

    @snippets = @snippets.where("created_at >= ?", lower_bound) unless lower_bound.nil?
    @snippets = Kaminari.paginate_array(@snippets.all).page(params[:page]).per(10)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @snippets }
    end
  end

  # GET /snippets/1
  # GET /snippets/1.json
  def show
    @snippet = Snippet.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @snippet }
    end
  end

  # GET /snippets/new
  # GET /snippets/new.json
  
  def new
    @snippet = Snippet.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @snippet }
    end
  end

  # POST /snippets
  # POST /snippets.json
  def create
    tags = params[:tags]
    @snippet = Snippet.new(params[:snippet])
    @snippet.all_tags = tags

    respond_to do |format|
      if @snippet.save
        format.html { redirect_to @snippet, notice: 'Snippet was successfully created.' }
        format.json { render json: @snippet, status: :created, location: @snippet }
      else
        format.html { render action: "new" }
        format.json { render json: @snippet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /snippets/1
  # PUT /snippets/1.json
  def update
    @snippet = Snippet.find(params[:id])

    respond_to do |format|
      if @snippet.update_attributes(params[:snippet])
        format.html { redirect_to @snippet, notice: 'Snippet was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @snippet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /snippets/1
  # DELETE /snippets/1.json
  def destroy
    @snippet = Snippet.find(params[:id])
    @snippet.destroy

    respond_to do |format|
      format.html { redirect_to snippets_url }
      format.json { head :no_content }
    end
  end
  
end
