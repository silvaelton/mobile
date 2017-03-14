module Attendance
  class TicketsController < ApplicationController
    before_action :set_cadastre

    def index
      @tickets = @cadastre.attendance_tickets
    end

    def new
    end

    def pre_create
      @context = params[:context_id] ||= 1
    end

    def create
      @service = TicketService.new(cadastre: @cadastre, context_id: params[:context_id])

      if @service.create
        redirect_to @service.route_path
      else
        redirect_to new_ticket_path
      end
    end

    def destroy
    end

    private

    def set_cadastre
      @cadastre = current_cadastre
    end

    def set_ticket
    end

  end
end