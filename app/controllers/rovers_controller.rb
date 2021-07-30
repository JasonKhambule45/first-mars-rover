class RoversController < ApplicationController

  RIGHT_DIRECTIONS = {
    "N" => "E",
    "S" => "W",
    "E" => "S",
    "W" => "N"
  }

  LEFT_DIRECTIONS = {
    "N" => "W",
    "S" => "E",
    "E" => "N",
    "W" => "S"
  }

  def index
    @rovers = Rover.all
  end

  def new
  end

  def show
    @rover = Rover.find(params[:id])
  end

  def create
    @rover = Rover.new(rovers_params)
    if @rover.save
      redirect_to rover_path(@rover)
    else
      render :new
    end
  end

  def instruction

    rover = Rover.find(params[:id])

    instructions = params[:instruction]

    instructions.split(//).each do |instruction|
      if instruction == 'L'
        left(rover)
      elsif instruction == 'R'
        right(rover)
      elsif instruction == 'M'
        move(rover)
      end
    end

    redirect_to rover
  end

  def left(rover)
    rover.update(direction: LEFT_DIRECTIONS[rover.direction] )
  end

  def right(rover)
    rover.update(direction: RIGHT_DIRECTIONS[rover.direction] )
  end

  def move(rover)
    if rover.direction == 'N'
      rover.update(y_axis: rover.y_axis + 1 )
    elsif rover.direction == 'S'
      rover.update(y_axis: rover.y_axis - 1 )
    elsif rover.direction == 'E'
      rover.update(x_axis: rover.x_axis + 1 )
    else rover.direction == 'W'
      rover.update(x_axis: rover.x_axis - 1 )
    end
  end

  def update
  end

  private
    def rovers_params
      params.require(:rover).permit(:name, :org, :y_axis, :x_axis, :direction, :plateau_x_axis, :plateau_y_axis)
    end
end