(1..100).each do |employee_id|
  (1..2).each do |i|
    Position.create! \
      employee_id: employee_id,
      title: Faker::Job.title,
      historical_index: i,
      active: i == 1,
      department_id: [1, 2, 3].sample
  end
end
