# frozen_string_literal: true

class LineItemsController < ApplicationController
  # rubocop:disable Metrics/MethodLength
  def create
    chosen_product = Book.find(params[:book_id])
    current_cart = @current_cart

    if current_cart.books.include?(chosen_product)
      @line_item = current_cart.line_items.find_by(book_id: chosen_product)
      @line_item.quantity += 1
    else
      @line_item = LineItem.new
      @line_item.cart = current_cart
      @line_item.book = chosen_product
    end
    @line_item.save
    redirect_to cart_path(current_cart)
  end
  # rubocop:enable Metrics/MethodLength

  def destroy
    line_item_finder
    @line_item.destroy
    redirect_to cart_path(@current_cart)
  end

  def add_quantity
    line_item_finder
    @line_item.quantity += 1
    @line_item.save
    redirect_to cart_path(@current_cart)
  end

  def reduce_quantity
    line_item_finder
    @line_item.quantity -= 1 if @line_item.quantity > 1
    @line_item.save
    redirect_to cart_path(@current_cart)
  end

  private

  def line_item_params
    params.require(:line_item).permit(:quantity, :book_id, :cart_id)
  end

  def line_item_finder
    @line_item = LineItem.find(params[:id])
  end
end
