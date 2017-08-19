class BoardsController < ApplicationController
  def list
    @results = Board.all ### chera asan in??? chera board? in mire tu db negah mikone?

    count = Array.new(2)
    @results.each do |x|

      if x.winner == 1
        count[0] += 1
      elsif x.winner == 2
        count[1] += 1
      end

    end

    render :json => count

  end

  def indice(needle)
    found = []
    current_index = -1
    while current_index = index(needle, current_index+1)
      found << current_index
    end
    found
  end

  def has_winner(game)
     case
     when game[0...3] == "111"
       return 1
     when game[0...3] == "222"
       return 2
     when game[3...6] == "111"
       return 1
     when game[3...6] == "222"
       return 2
     when game[6...9] == "111"
       return 1
    when game[6...9] == "222"
      return 2
    when (game[0] == "1" && game[4] == "1" && game[8] == "1")
      return 1
    when (game[0] == "2" && game[4] == "2" && game[8] == "2")
      return 2
    when (game[2] == "1" && game[4] == "1" && game[6] == "1")
      return 1
    when (game[2] == "2" && game[4] == "2" && game[6] == "2")
      return 2
    when (game[2] == "1" && game[5] && "1" && game[8] == "1")
      return 1
    when (game[2] == "2" && game[5] && "2" && game[8] == "2")
      return 2
    when (game[2] == "2" && game[5] && "2" && game[8] == "2")
      return 2
    when (game[2] == "1" && game[5] && "1" && game[8] == "1")
      return 1
    when (game[1] == "1" && game[4] && "1" && game[7] == "1")
      return 1
    when (game[1] == "2" && game[4] && "2" && game[7] == "2")
      return 2
     end

    return 0

  end

  def has_winner_indice(a , b , c , game)
    if(game[a] == "1" && game[b] == "1" && game[c] == "1")
      return 1
    elsif (game[a] == "2" && game[b] == "2" && game[c] == "2")
      return 2
    else
      return 0
    end

  end


  def update
    ## how to handle ID
    @board = @params[:board]

    now_winner = has_winner(game_sts)
    if now_winner != 0
      tmpBoard = Board.new(game_sts: "444444444" , winner: now_winner) ## "4" is for the state that the winner is specified
      render json: tmpBoard
      return
    end

    raise "Should be a board model" unless @board.class.name == "Board"

    tmpBoard = Board.new(game_sts: @board.game_sts , winner: @board.winner) ## so doubt in this line

    freePointes = tmpBoard.game_sts.indice

    nextFillPoint = freePointes.sample

    tmpBoard.game_sts[nextFillPoint] = "3" ### 2 is for ours! the next point we want to play

    render json: tmpBoard
  end

  def show
    @game = Board.find(params[:id])
    render json: @game
  end

  def delete
    Book.find(params[:id]).destroy

    redirect_to :action => "newGame"
  end

  def create
    tmpBoard = Board.new(game_sts: "000000000" , winner: "0")

    render json: tmpBoard
  end

end
