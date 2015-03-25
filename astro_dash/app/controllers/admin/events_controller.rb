class Admin::EventsController < AdminController
    
  def index
    @events = Event.all
  end
  
  def new
    @event = Event.new
  end
  
  def create
    @event = Event.new(event_params)
    
    if @event.save
      redirect_to [:admin, @event]
    else
      render 'new'
    end
    
  end
  
  def show
    @event = Event.find(params[:id])
  end
  
  def edit
    @event = Event.find(params[:id])
  end
  
  def update
    @event = Event.find(params[:id])
   
    if @event.update(event_params)
      redirect_to [:admin, @event]
    else
      render 'edit'
    end
  end
  
  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    
    redirect_to admin_events_path
  end
  
  private
    def event_params
      params.require(:event).permit(:name, :description, :date)
    end
end
