class SkillsController < ApplicationController

  def index
  end

  def create
  end

  def show
    @skill = Skill.find(params[:id])
  end

end
