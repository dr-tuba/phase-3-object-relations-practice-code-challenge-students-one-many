class Student < ActiveRecord::Base
  belongs_to :cohort

  def current_mod
    cohort.current_mod
  end
end