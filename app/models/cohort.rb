class Cohort < ActiveRecord::Base
    has_many :students, dependent: :destroy

    def add_student(name, age)
        Student.create(name: name, age: age, email: "#{name}@gmail.com", cohort_id: id)
    end

    def average_age
        students.average(:age).to_f
    end

    def total_students
        students.all.count
    end

    def self.biggest
        all.max_by { |cohort| cohort.total_students }
    end

    def self.sort_by_mod
        all.sort_by { |cohort| cohort.current_mod }
    end
end