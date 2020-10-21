class ChargeOrderJob < ApplicationJob
  queue_as :default

  def perform(order, pay_type_params)
    puts pay_type_params
    # Do something later
    pp order
    order.charge!(pay_type_params)
  end
end
