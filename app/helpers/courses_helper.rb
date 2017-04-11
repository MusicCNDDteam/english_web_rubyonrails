module CoursesHelper
  def course_author?(course)
    begin
      course.author_id == current_user.id
    rescue
      false
    end
  end
end
