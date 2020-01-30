# frozen_string_literal: true

class LineItemsController < ApplicationController
  def create
    @current_line_item = current_cart.line_items.find_or_initialize_by(book_id: params[:book_id])
    current_line_item.quantity += 1
    save_and_redirect
  end

  def destroy
    current_line_item.destroy
    redirect_to cart_path(@current_cart)
  end

  def add_quantity
    current_line_item.quantity += 1
    save_and_redirect
  end

  def reduce_quantity
    current_line_item.quantity -= 1 if current_line_item.quantity > 1
    save_and_redirect
  end

  private

  def line_item_params
    params.require(:line_item).permit(:quantity, :book_id)
  end

  def current_line_item
    @current_line_item ||= current_cart.line_items.find(params[:id])
  end

  def save_and_redirect
    if current_line_item.save
      flash[:notice] = 'Successfully'
    else
      flash[:alert] = 'Error'
    end
    redirect_to cart_path(@current_cart)
  end
end
