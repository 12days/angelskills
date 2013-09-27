class SkillsController < ApplicationController

  def new
    @skill = Skill.new
  end

  def index
  end

  def create
    @skill = Skill.new
    @skill.title = params[:skill][:title]
    @skill.save
    redirect_to skill_path
  end

  def show
    @skill = Skill.find(params[:id])
  end

end
