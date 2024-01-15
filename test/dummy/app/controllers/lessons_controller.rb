# frozen_string_literal: true

class LessonsController < ApplicationController
  before_action :set_course, :set_section

  def index
    @lessons = @section.lessons.sorted
  end

  def show
    @lesson = @section.lessons.find(params[:id])
  end

  private

  def set_course
    @course = Course.find(params[:course_id])
  end

  def set_section
    @section = @course.sections.find(params[:section_id])
  end
end
