class SnippetTagsController < ApplicationController
  # GET /snippet_tags
  # GET /snippet_tags.json
  def index
    @snippet_tags = SnippetTag.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @snippet_tags }
    end
  end

  # GET /snippet_tags/1
  # GET /snippet_tags/1.json
  def show
    @snippet_tag = SnippetTag.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @snippet_tag }
    end
  end

  # GET /snippet_tags/new
  # GET /snippet_tags/new.json
  def new
    @snippet_tag = SnippetTag.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @snippet_tag }
    end
  end

  # GET /snippet_tags/1/edit
  def edit
    @snippet_tag = SnippetTag.find(params[:id])
  end

  # POST /snippet_tags
  # POST /snippet_tags.json
  def create
    @snippet_tag = SnippetTag.new(params[:snippet_tag])

    respond_to do |format|
      if @snippet_tag.save
        format.html { redirect_to @snippet_tag, notice: 'snippet_tag was successfully created.' }
        format.json { render json: @snippet_tag, status: :created, location: @snippet_tag }
      else
        format.html { render action: "new" }
        format.json { render json: @snippet_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /snippet_tags/1
  # PUT /snippet_tags/1.json
  def update
    @snippet_tag = SnippetTag.find(params[:id])

    respond_to do |format|
      if @snippet_tag.update_attributes(params[:snippet_tag])
        format.html { redirect_to @snippet_tag, notice: 'snippet_tag was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @snippet_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /snippet_tags/1
  # DELETE /snippet_tags/1.json
  def destroy
    @snippet_tag = SnippetTag.find(params[:id])
    @snippet_tag.destroy

    respond_to do |format|
      format.html { redirect_to snippet_tags_url }
      format.json { head :no_content }
    end
  end

  QUERY_PATTERN = /\A(?<tags>(\[(\w|\-)+\])+)?(?<therest>.*)\Z/
  TAG_PATTERN   = /\A\s*\[/

  def search
    query = params[:q]
    if QUERY_PATTERN =~ query
      tag_portion = $~[:tags]
      the_rest    = $~[:therest]

      @snippet_ids = search_tags(tag_portion)

      respond_to do |format|
        format.html
        format.json { head :no_content }
      end
    else
      raise ArgumentError.new
    end
  end

  private
  def search_tags (tag_portion)
    # cleanup
    tag_portion = tag_portion.sub(/\A\s*\[/, '')
    tag_portion = tag_portion.sub(/\]\s*\Z/, '')

    tags = tag_portion.split(/\]\s*\[/)

    results = SnippetTag.select(:snippet_id)
                        .joins(:tag)
                        .where("tags.tag IN (?)", tags.join(","))
                        .group(:snippet_id)
                        .having("COUNT(DISTINCT(tags.id)) = ?", tags.size)

    results
  end
end
