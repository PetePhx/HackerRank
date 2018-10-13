def grading_students(grades)
  grades.each_with_object([]) do |grd, obj|
    if grd < 38
      obj << grd
    else
      rem = grd % 5
      obj << (rem >= 3 ? grd + (5 - rem) : grd )
    end
  end
end

p grading_students([73, 67, 38, 33]) # [75, 67, 40, 33]


# Problem:
# HackerLand University has the following grading policy:
#
#     Every student receives a grade in the inclusive range from 0 to 100.
#     Any less than 40 is a failing grade.
#
# Sam is a professor at the university and likes to round each student's grade according to these rules:
#
#     If the difference between the grade and the next multiple of 5 is less than 3, round grade up to the next multiple of 5.
#     If the value of grade is less than 38, no rounding occurs as the result will still be a failing grade.
