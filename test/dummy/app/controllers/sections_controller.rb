# frozen_string_literal: true

class SectionsController < ApplicationController
  def index
    @sections = @course.sections.sorted
  end

  def show
    @section = @course.sections.find(params[:id])
  end

  private

  def set_course
    @course = Course.find(params[:course_id])
  end
end
