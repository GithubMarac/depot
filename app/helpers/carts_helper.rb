module CartsHelper
  def check_current_path
    if current_page?("/orders/new")
      return false
    end
    true
  end
end
