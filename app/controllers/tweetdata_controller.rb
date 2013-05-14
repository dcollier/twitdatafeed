class TweetdataController < ApplicationController
  # GET /tweetdata
  # GET /tweetdata.json
  def index
    @tweetdata = Tweetdatum.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @tweetdata }
    end
  end

  # GET /tweetdata/1
  # GET /tweetdata/1.json
  def show
    @tweetdatum = Tweetdatum.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @tweetdatum }
    end
  end

  # GET /tweetdata/new
  # GET /tweetdata/new.json
  def new
    @tweetdatum = Tweetdatum.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @tweetdatum }
    end
  end

  # GET /tweetdata/1/edit
  def edit
    @tweetdatum = Tweetdatum.find(params[:id])
  end

  # POST /tweetdata
  # POST /tweetdata.json
  def create
    @tweetdatum = Tweetdatum.new(params[:tweetdatum])

    respond_to do |format|
      if @tweetdatum.save
        format.html { redirect_to @tweetdatum, :notice => 'Tweetdatum was successfully created.' }
        format.json { render :json => @tweetdatum, :status => :created, :location => @tweetdatum }
      else
        format.html { render :action => "new" }
        format.json { render :json => @tweetdatum.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tweetdata/1
  # PUT /tweetdata/1.json
  def update
    @tweetdatum = Tweetdatum.find(params[:id])

    respond_to do |format|
      if @tweetdatum.update_attributes(params[:tweetdatum])
        format.html { redirect_to @tweetdatum, :notice => 'Tweetdatum was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @tweetdatum.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tweetdata/1
  # DELETE /tweetdata/1.json
  def destroy
    @tweetdatum = Tweetdatum.find(params[:id])
    @tweetdatum.destroy

    respond_to do |format|
      format.html { redirect_to tweetdata_url }
      format.json { head :no_content }
    end
  end
end
