class Polycoms::PolycomsController < PolycomsController
    before_action :set_commentable

    private
    
    def set_commentable
        @commentable = Polycom.find(params[:polycom_id])

    end
end