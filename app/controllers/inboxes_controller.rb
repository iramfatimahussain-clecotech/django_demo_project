class InboxesController < ApplicationController
  before_action :set_inbox, only: %i[show edit update destroy]

  def index
    @inboxes = Inbox.all
  end

  def show
    @inbox = Inbox.find(params[:id])
  end

  def new
    @inbox = Inbox.new
  end

  def edit
    @inbox = Inbox.find(params[:id])
    render turbo_stream: turbo_stream.update(@inbox, partial: 'inboxes/form', locals: { inbox: @inbox })
  end

  def create
    @inbox = Inbox.new(inbox_params)
    respond_to do |format|
      if @inbox.save
        format.turbo_stream do
            render turbo_stream: [
              turbo_stream.prepend('inboxes', partial: 'inboxes/inbox', locals: { inbox: @inbox }),
              turbo_stream.replace('new_inbox', partial: 'inboxes/form', locals: { inbox: Inbox.new }),
              turbo_stream.update('inbox_count', html: inboxes_count)
            ]
        end
         format.html { redirect_to @inbox, notice: 'Inbox created.' }
      else
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace('new_inbox', partial: 'inboxes/form', locals: { inbox: @inbox })
        end
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @inbox.update(inbox_params)
        format.turbo_stream do
          render turbo_stream: turbo_stream.update(@inbox, partial: 'inboxes/inbox', locals: { inbox: @inbox })
        end
        format.html { redirect_to @inbox, notice: "Inbox was successfully updated." }
      else
        format.turbo_stream do
          render turbo_stream: turbo_stream.update(@inbox, partial: 'inboxes/form', locals: { inbox: @inbox })
        end
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @inbox.destroy
    respond_to do |format|
    format.turbo_stream { render turbo_stream: turbo_stream.remove(@inbox) }
     format.turbo_stream do
      render turbo_stream: [
         turbo_stream.update('inbox_count', html: "#{Inbox.count}"),
         turbo_stream.remove(@inbox)
       ]
      end
      format.html { redirect_to inboxes_url, notice: 'Inbox destroyed.' }
    end
  end

  def inboxes_count
    Inbox.count
  end

  private

  def set_inbox
    @inbox = Inbox.find(params[:id])
  end

  def inbox_params
    params.require(:inbox).permit(:name)
  end
end
