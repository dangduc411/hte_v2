class Quote < ActiveRecord::Base
  belongs_to :console

  state_machine :initial => :pending do
    event :cancel do
      transition any => :cancelled
    end
    event :complete do
      transition any => :completed
    end
  end

  scope :waiting, -> { where(processed: [false, nil]) }

  state_machine.states.map do |state|
    scope state.name, -> { where(state: state.name.to_s) }
  end
end
